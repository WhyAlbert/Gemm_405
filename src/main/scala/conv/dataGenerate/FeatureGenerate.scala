package conv.dataGenerate

import spinal.core.{Area, Bits, Bool, Bundle, Component, Device, False, IntToBuilder, Mem, Reg, RegInit, RegNext, SpinalEnum, SpinalVerilog, True, UInt, Vec, binaryOneHot, default, in, is, log2Up, out, switch, when}
import spinal.lib.{Delay, Flow, IMasterSlave, StreamFifo, flowBitsPimped, master, slave}
import conv.wa.{WaCounter, WaStreamFifo}
import spinal.core.sim._

case class FeatureGenerateConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, KERNEL_NUM: Int, FEATURE_RAM_DEPTH: Int) {
    val PICTURE_NUM = 1
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
}

object FeatureGenerateEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, WAIT, FIFO_READY, WR, END = newElement
}

case class FeatureGenerateFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val waitEnd = Bool()
    val wrEnd = Bool()
    val endEnd = Bool()
    val wait2 = Bool()

    val fifoReady = Bool()

    val currentState = Reg(FeatureGenerateEnum()) init FeatureGenerateEnum.IDLE
    val nextState = FeatureGenerateEnum()
    currentState := nextState

    switch(currentState) {
        is(FeatureGenerateEnum.IDLE) {
            when(start) {
                nextState := FeatureGenerateEnum.INIT
            } otherwise {
                nextState := FeatureGenerateEnum.IDLE
            }
        }
        is(FeatureGenerateEnum.INIT) {
            when(initEnd) {
                nextState := FeatureGenerateEnum.WAIT
            } otherwise {
                nextState := FeatureGenerateEnum.INIT
            }
        }
        is(FeatureGenerateEnum.WAIT) {
            when(waitEnd) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WAIT
            }
        }
        is(FeatureGenerateEnum.FIFO_READY) {
            when(fifoReady) {
                nextState := FeatureGenerateEnum.WR
            } otherwise {
                nextState := FeatureGenerateEnum.FIFO_READY
            }
        }
        is(FeatureGenerateEnum.WR) {
            when(wrEnd) {
                nextState := FeatureGenerateEnum.END
            } otherwise {
                nextState := FeatureGenerateEnum.WR
            }
        }
        is(FeatureGenerateEnum.END) {
            when(wait2) {
                nextState := FeatureGenerateEnum.WAIT
            } elsewhen (endEnd) {
                nextState := FeatureGenerateEnum.IDLE
            } otherwise {
                nextState := FeatureGenerateEnum.FIFO_READY
            }
        }
    }


}

case class GenerateMatrixPort(dataWidth: Int, kernelNum: Int) extends Bundle {
    val mData = Vec(master Flow UInt(dataWidth bits), kernelNum)
    val ready = in Bool()
}

class FeatureGenerate(featureGenerateConfig: FeatureGenerateConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits)
        val mData = GenerateMatrixPort(featureGenerateConfig.STREAM_DATA_WIDTH, featureGenerateConfig.KERNEL_NUM)
        val rowNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val start = in Bool()
        val channelIn = in UInt (featureGenerateConfig.CHANNEL_WIDTH bits)
        //        val last = out Bool()
    }
    noIoPrefix()

    val channelTimes: UInt = RegNext(io.channelIn >> log2Up(featureGenerateConfig.COMPUTE_CHANNEL_NUM), 0) //一点进完次数
    val totalCnt = RegNext(channelTimes * io.colNumIn) //一行数据次数
    val fsm = FeatureGenerateFsm(io.start)
    fsm.fifoReady := io.mData.ready //看后面模块FIFO是否准备好


    val rdAddr = Reg(UInt(log2Up(featureGenerateConfig.FEATURE_RAM_DEPTH) bits)) init 0
    val wrData = Vec(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), 2)
    val rdData = Vec(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), 2)
    val wrAddr = RegNext(rdAddr)
    when(io.sData.fire) {
        when(rdAddr === totalCnt - 1) {
            rdAddr := 0
        } otherwise {
            rdAddr := rdAddr + 1
        }
    }
    wrData(0) := RegNext(io.sData.payload)
    wrData(1) := rdData(0)
    val mem = Array.tabulate(2)(i => {
        def gen(): Mem[UInt] = {
            val mem = Mem(UInt(featureGenerateConfig.STREAM_DATA_WIDTH bits), wordCount = featureGenerateConfig.FEATURE_RAM_DEPTH).addAttribute("ram_style = \"block\"")
            mem.write(wrAddr, wrData(i), RegNext(io.sData.fire))
            rdData(i) := mem.readSync(rdAddr)
            mem
        }

        gen()
    })
    val initCount = WaCounter(fsm.currentState === FeatureGenerateEnum.INIT, 3, 5)
    fsm.initEnd := initCount.valid
    val channelCnt = WaCounter(io.sData.fire, featureGenerateConfig.CHANNEL_WIDTH, channelTimes - 1)
    val columnCnt = WaCounter(channelCnt.valid && io.sData.fire, featureGenerateConfig.FEATURE_WIDTH, io.colNumIn - 1)
    val rowCnt = WaCounter(fsm.currentState === FeatureGenerateEnum.END, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn - 1)

    fsm.waitEnd := channelCnt.valid && columnCnt.valid //等一行
    fsm.wrEnd := channelCnt.valid && columnCnt.valid //按行处理
    fsm.endEnd := rowCnt.valid
    fsm.wait2 := rowCnt.count < 1 //第一行单独处理
    when(fsm.currentState === FeatureGenerateEnum.WAIT || fsm.currentState === FeatureGenerateEnum.WR) {
        io.sData.ready := True
    } otherwise {
        io.sData.ready := False
    }
    val valid = Vec(Reg(Bool()) init False, featureGenerateConfig.KERNEL_NUM)
    //    (0 until featureGenerateConfig.KERNEL_NUM).foreach(i => {
    //        io.mData.mData(i).valid := Delay(valid(i) && fsm.currentState === FeatureGenerateEnum.WR, 2)
    //    })
    io.mData.mData(0).valid := Delay(valid(0), 3)
    io.mData.mData(3).valid := Delay(valid(3), 3)
    io.mData.mData(6).valid := Delay(valid(6), 3)
    io.mData.mData(1).valid := Delay(valid(1), 2)
    io.mData.mData(4).valid := Delay(valid(4), 2)
    io.mData.mData(7).valid := Delay(valid(7), 2)
    io.mData.mData(2).valid := Delay(valid(2), 1)
    io.mData.mData(5).valid := Delay(valid(5), 1)
    io.mData.mData(8).valid := Delay(valid(8), 1)
    when(fsm.currentState === FeatureGenerateEnum.WR) {
        when(columnCnt.count < io.colNumIn - 2) {
            valid(0) := True
            valid(3) := True
            valid(6) := True
        } otherwise {
            valid(0) := False
            valid(3) := False
            valid(6) := False
        }
        when(columnCnt.count > 0 && columnCnt.count < io.colNumIn - 1) {
            valid(1) := True
            valid(4) := True
            valid(7) := True
        } otherwise {
            valid(1) := False
            valid(4) := False
            valid(7) := False
        }
        when(columnCnt.count > 1 && columnCnt.count < io.colNumIn) {
            valid(2) := True
            valid(5) := True
            valid(8) := True
        } otherwise {
            valid(2) := False
            valid(5) := False
            valid(8) := False
        }
    } otherwise {
        valid.map(_ := False)
    }

    //    io.mData.mData(2).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3)
    //    io.mData.mData(5).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3)
    //    io.mData.mData(6).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3)
    //
    //    io.mData.mData(1).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3+channelTimes)
    //    io.mData.mData(4).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3+channelTimes)
    //    io.mData.mData(8).valid := Delay(io.sData.fire && fsm.currentState === FeatureGenerateEnum.WR, 3+channelTimes)

    //    when()
    io.mData.mData(0).payload := RegNext(io.mData.mData(1).payload)
    io.mData.mData(1).payload := RegNext(io.mData.mData(2).payload)
    io.mData.mData(2).payload := RegNext(rdData(1))

    io.mData.mData(3).payload := RegNext(io.mData.mData(4).payload)
    io.mData.mData(4).payload := RegNext(io.mData.mData(5).payload)
    io.mData.mData(5).payload := RegNext(rdData(0))

    io.mData.mData(6).payload := RegNext(io.mData.mData(7).payload)
    io.mData.mData(7).payload := RegNext(io.mData.mData(8).payload)
    io.mData.mData(8).payload := RegNext(RegNext(io.sData.payload))

}

object FeatureGenerate extends App {
//    def main(args: Array[String]): Unit = {
//        SpinalVerilog(new FeatureGenerate(FeatureGenerateConfig(8, 10, 8, 8, 9, 10)))
//    }
    SimConfig
      //      withXSimSourcesPaths(ArrayBuffer("D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt/"),ArrayBuffer("")) //第二个参数是bd的参数
      //      .withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
      .withXSim.withWave.compile(new FeatureGenerate(FeatureGenerateConfig(8,10,8,10,9,2048)))
      .doSim{   dut =>
          dut.clockDomain.forkStimulus(10) //10ns为周期 100MHz  //改成10ps 应该能减少编译时间 不能
          dut.clockDomain.waitSampling(10)

          dut.io.rowNumIn #= 322  //Padding后+2    图片数据320*320*32
          dut.io.colNumIn #= 322
          dut.io.channelIn #= 32  //256/8 = 32
//          dut.io.enPadding #= true
//          dut.io.zeroDara #= 1
//          dut.io.zeroNum #= 1

          dut.io.sData.payload #= 0
          dut.io.sData.valid #= false
          dut.io.mData.ready #= false
          dut.io.start #= false
          dut.clockDomain.waitSampling(10)
          dut.io.mData.ready #= true
          dut.io.start #= true
          dut.clockDomain.waitSampling()
          dut.io.start #= false

          for(i <- 0 until 322*322*4){  //channelIn = 256
              dut.io.sData.valid #= true
              //            dut.io.sData.payload #= (U"8'd8"@@U"8'd7"@@U"8'd6"@@U"8'd5"@@U"8'd4"@@U"8'd3"@@U"8'd2"@@U"8'd1").toInt //sData 64bit
              //            dut.io.sData.payload #= BigInt("578437695752307201",10)
              dut.io.sData.payload #= i%255
              dut.clockDomain.waitSamplingWhere(dut.io.sData.valid.toBoolean && dut.io.sData.ready.toBoolean)
          }

          dut.io.sData.valid #= false
          //          dut.clockDomain.waitSampling(100)
          dut.clockDomain.waitSamplingWhere(dut.fsm.currentState == FeatureGenerateEnum.IDLE) //波形图一直在跑，没停下来，但是条件应该满足了
          dut.clockDomain.waitSampling(100)


      }
}

