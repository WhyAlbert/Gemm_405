package conv.dataGenerate

import spinal.core._
import spinal.lib.slave
import conv.wa.WaCounter
import spinal.core.sim.SimConfig
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

case class FeatureConv11ConvertFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val fifoReady = Bool() //后面模块fifo是否准备好
    val sendEnd = Bool()
//    val last = Bool()
    val last = Reg(Bool()) init false //2.20更改 改成寄存器 打一拍，好在END状态正常拉高


    val currentState = Reg(FeatureWidthConvertEnum()) init FeatureWidthConvertEnum.IDLE
    val nextState = FeatureWidthConvertEnum()
    currentState := nextState

    switch(currentState) {
        is(FeatureWidthConvertEnum.IDLE) {
            when(start) {
                nextState := FeatureWidthConvertEnum.INIT
            } otherwise {
                nextState := FeatureWidthConvertEnum.IDLE
            }
        }
        is(FeatureWidthConvertEnum.INIT) {
            when(initEnd) {
                nextState := FeatureWidthConvertEnum.FIFO_READY
            } otherwise {
                nextState := FeatureWidthConvertEnum.INIT
            }
        }
        is(FeatureWidthConvertEnum.FIFO_READY) {
            when(fifoReady) {
                nextState := FeatureWidthConvertEnum.SEND
            } otherwise {
                nextState := FeatureWidthConvertEnum.FIFO_READY
            }
        }
        is(FeatureWidthConvertEnum.SEND) {
            when(sendEnd) {
                nextState := FeatureWidthConvertEnum.END
            } otherwise {
                nextState := FeatureWidthConvertEnum.SEND
            }
        }
        is(FeatureWidthConvertEnum.END) {
            when(last) {
                nextState := FeatureWidthConvertEnum.IDLE
            } otherwise {
                nextState := FeatureWidthConvertEnum.FIFO_READY
            }
        }

    }
}

class FeatureConv11Convert(featureGenerateConfig: FeatureGenerateConfig) extends Component {
    val S_DATA_WIDTH = featureGenerateConfig.COMPUTE_CHANNEL_NUM * 8

    val io = new Bundle {
        val sData = slave Stream UInt(S_DATA_WIDTH bits)
        val mData = GenerateMatrixPort(S_DATA_WIDTH, featureGenerateConfig.KERNEL_NUM)
        val rowNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val start = in Bool()
        val channelIn = in UInt (featureGenerateConfig.CHANNEL_WIDTH bits)
    }

    val fsm = FeatureConv11ConvertFsm(io.start)

    val initCnt = WaCounter(fsm.currentState === FeatureWidthConvertEnum.INIT, 3, 7)
    fsm.initEnd := initCnt.valid

    val channelInTimes = RegNext(io.channelIn >> log2Up(featureGenerateConfig.COMPUTE_CHANNEL_NUM)) //512>>3 = 64
    val channelCnt = WaCounter(io.sData.fire, featureGenerateConfig.CHANNEL_WIDTH, channelInTimes - 1)
    val columnCnt = WaCounter(channelCnt.valid, featureGenerateConfig.FEATURE_WIDTH, io.colNumIn - 1)
    val rowCnt = WaCounter(fsm.currentState === FeatureWidthConvertEnum.END, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn - 1)
    // val mCount = RegNext(channelInTimes * io.colNumIn)
    fsm.fifoReady := io.mData.ready
    fsm.sendEnd := channelCnt.valid && columnCnt.valid
    fsm.last := rowCnt.valid && channelCnt.valid && columnCnt.valid

    (1 until featureGenerateConfig.KERNEL_NUM).foreach(i => {
        io.mData.mData(i).payload := 0
        io.mData.mData(i).valid := io.sData.fire
    })
    io.mData.mData(0).payload := io.sData.payload
    io.mData.mData(0).valid := io.sData.fire

    when(fsm.currentState === FeatureWidthConvertEnum.SEND) {
        io.sData.ready.set()
    } otherwise {
        io.sData.ready.clear()
    }

}

object FeatureConv11Convert extends App {

    //    SpinalVerilog(new FeatureWidthConvert(FeatureGenerateConfig(8, 10, 8, 8, 9, 10)))
    SimConfig
//      withXSimSourcesPaths(ArrayBuffer("D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt/"),ArrayBuffer("")) //第二个参数是bd的参数
//      .withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
      .withXSim.withWave.compile(new FeatureConv11Convert(FeatureGenerateConfig(8, 10, 8, 9, 9, 10)))
      .doSim{   dut =>
          dut.clockDomain.forkStimulus(10) //10ns为周期 100MHz  //改成10ps 应该能减少编译时间
          dut.clockDomain.waitSampling(10)

          dut.io.rowNumIn #= 416
          dut.io.colNumIn #= 416
          dut.io.channelIn #= 512
          dut.io.sData.payload #= 0
          dut.io.sData.valid #= false
          dut.io.mData.ready #= false
          dut.io.start #= false
          dut.clockDomain.waitSampling(10)
          dut.io.mData.ready #= true
          dut.io.start #= true
          dut.clockDomain.waitSampling()
          dut.io.start #= false
          for(i <- 0 until 416*416*64){ //多给了8倍 为啥？ 因为col计数器猛涨问题
              dut.io.sData.valid #= true
              //            dut.io.sData.payload #= (U"8'd8"@@U"8'd7"@@U"8'd6"@@U"8'd5"@@U"8'd4"@@U"8'd3"@@U"8'd2"@@U"8'd1").toInt //sData 64bit
              //            dut.io.sData.payload #= BigInt("578437695752307201",10)
              dut.io.sData.payload #= i%255
              dut.clockDomain.waitSamplingWhere(dut.io.sData.valid.toBoolean && dut.io.sData.ready.toBoolean)
          }

          dut.io.sData.valid #= false
          dut.clockDomain.waitSampling(10)


      }
}