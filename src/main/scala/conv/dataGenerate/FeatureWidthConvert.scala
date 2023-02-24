package conv.dataGenerate

import spinal.core._
import spinal.lib._
import conv.wa.WaCounter
import conv.wa.xip.axi.StreamDataWidthConvert
import spinal.core.sim._
import scala.collection.mutable._


object FeatureWidthConvertEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, FIFO_READY, SEND, END = newElement
}

case class FeatureWidthConvertFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val fifoReady = Bool() //后面模块fifo是否准备好
    val sendEnd = Bool()
    val last = Reg(Bool()) init false //2.18更改 改成寄存器 打一拍，好在END状态正常拉高，进入IDLE状态


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

class FeatureWidthConvert(featureGenerateConfig: FeatureGenerateConfig) extends Component {
    val S_DATA_WIDTH = featureGenerateConfig.COMPUTE_CHANNEL_NUM * 8 //64bit
    val M_DATA_WIDTH = 8 * S_DATA_WIDTH //64*8 bit

    val io = new Bundle {
        val sData = slave Stream UInt(S_DATA_WIDTH bits)
        val mData = GenerateMatrixPort(S_DATA_WIDTH, featureGenerateConfig.KERNEL_NUM)
        val rowNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (featureGenerateConfig.FEATURE_WIDTH bits)
        val start = in Bool()
        val channelIn = in UInt (featureGenerateConfig.CHANNEL_WIDTH bits)
    }
    noIoPrefix()

    val fsm = FeatureWidthConvertFsm(io.start)

    val initCnt = WaCounter(fsm.currentState === FeatureWidthConvertEnum.INIT, 3, 7)
    fsm.initEnd := initCnt.valid //等7下
    val dataCvt = StreamDataWidthConvert(S_DATA_WIDTH, M_DATA_WIDTH, "conv11DataCvt", true)

    val channelInTimes = RegNext(io.channelIn >> (log2Up(featureGenerateConfig.COMPUTE_CHANNEL_NUM) + 3))  // 后面+3是因为固定一个3*3通道有8个有效点，前面用来判断多少入多少出
    val channelCnt = WaCounter(dataCvt.io.mData.fire, featureGenerateConfig.CHANNEL_WIDTH, channelInTimes - 1) //IP核拉高一下，就是出64字节了,64通道
    val columnCnt = WaCounter(channelCnt.valid&&dataCvt.io.mData.fire, featureGenerateConfig.FEATURE_WIDTH, io.colNumIn - 1) //使能信号进行了更改！ 2.18
    val rowCnt = WaCounter(fsm.currentState === FeatureWidthConvertEnum.END, featureGenerateConfig.FEATURE_WIDTH, io.rowNumIn - 1)
   // val mCount = RegNext(channelInTimes * io.colNumIn)
    fsm.fifoReady := io.mData.ready //看后面模块是不是准备好接收了
    fsm.sendEnd := channelCnt.valid && columnCnt.valid && dataCvt.io.mData.fire  //发完一行 //2.18 更改！
    fsm.last := rowCnt.valid && channelCnt.valid && columnCnt.valid && dataCvt.io.mData.fire //图片结束 //12.28更改！

    dataCvt.io.sData <> io.sData //连着握手信号一起给

    (0 until 8).foreach(i => {
        io.mData.mData(i).payload <> dataCvt.io.mData.payload.subdivideIn(8 slices)(i)  //8个点 每个点8通道
        io.mData.mData(i).valid <> dataCvt.io.mData.fire
    })
    io.mData.mData(8).payload := 0
    io.mData.mData(8).valid := dataCvt.io.mData.fire

    //val cnt = WaCounter(dataCvt.io.mData.fire, mCount.getWidth, mCount - 1)
    //val ready = Reg(Bool()) setWhen io.mData.ready clearWhen cnt.valid
    when(fsm.currentState === FeatureWidthConvertEnum.SEND) {
        //        when(cnt.valid) {
        //            dataCvt.io.mData.ready.clear()
        //        } otherwise {
        dataCvt.io.mData.ready.set()
        //        }
    } otherwise {
        dataCvt.io.mData.ready.clear()
    }

}
object FeatureWidthConvert extends App {

//    SpinalVerilog(new FeatureWidthConvert(FeatureGenerateConfig(8, 10, 8, 8, 9, 10)))
    SimConfig.withXSimSourcesPaths(ArrayBuffer("D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt/"),ArrayBuffer("")) //第二个参数是bd的参数
      .withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
      .withXSim.withWave.compile(new FeatureWidthConvert(FeatureGenerateConfig(8, 10, 8, 9, 9, 10)))
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