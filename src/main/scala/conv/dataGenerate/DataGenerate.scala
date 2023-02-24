package conv.dataGenerate

import conv.compute.CONV_STATE
import spinal.core._
import spinal.lib.{master, slave}
import spinal.core.sim._
import scala.collection.mutable._


case class DataGenerateConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, KERNEL_NUM: Int, FEATURE_RAM_DEPTH: Int, ZERO_NUM: Int) {
    val PICTURE_NUM = 1
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
    val paddingConfig = PaddingConfig(DATA_WIDTH, CHANNEL_WIDTH, COMPUTE_CHANNEL_NUM, FEATURE_WIDTH, ZERO_NUM)
    val featureGenerateConfig = FeatureGenerateConfig(DATA_WIDTH, CHANNEL_WIDTH, COMPUTE_CHANNEL_NUM, FEATURE_WIDTH, KERNEL_NUM, FEATURE_RAM_DEPTH)
}

class DataGenerate(dataGenerateConfig: DataGenerateConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream (UInt(dataGenerateConfig.STREAM_DATA_WIDTH bits))
        val start = in Bool()
        val enPadding = in Bool() //指令里传进来的
        val channelIn = in UInt (dataGenerateConfig.CHANNEL_WIDTH bits)
        val rowNumIn = in UInt (dataGenerateConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (dataGenerateConfig.FEATURE_WIDTH bits)
        val zeroDara = in Bits (dataGenerateConfig.DATA_WIDTH bits)   // ？？？？
        val zeroNum = in UInt (dataGenerateConfig.paddingConfig.ZERO_NUM_WIDTH bits)  // ？？？？
        //        val mData = master(FeaturePort(dataGenerateConfig.STREAM_DATA_WIDTH, dataGenerateConfig.KERNEL_NUM))
        val mData = GenerateMatrixPort(dataGenerateConfig.featureGenerateConfig.STREAM_DATA_WIDTH, dataGenerateConfig.featureGenerateConfig.KERNEL_NUM)
        val convType = in Bits (2 bits)
//        val last = out Bool()  //2.23用来TB测试，可以不用
    }
    noIoPrefix()

    val padding = new Padding(dataGenerateConfig.paddingConfig)
    padding.io.enPadding <> io.enPadding
    padding.io.channelIn <> io.channelIn
    padding.io.rowNumIn <> io.rowNumIn
    padding.io.colNumIn <> io.colNumIn
    padding.io.zeroNum <> io.zeroNum
    padding.io.zeroDara <> io.zeroDara
    val featureGenerate = new FeatureGenerate(dataGenerateConfig.featureGenerateConfig)
    val featureWidthConvert = new FeatureWidthConvert(dataGenerateConfig.featureGenerateConfig)
    val featureConv11Convert = new FeatureConv11Convert(dataGenerateConfig.featureGenerateConfig)

    featureWidthConvert.io.channelIn <> io.channelIn
    featureWidthConvert.io.colNumIn <> io.colNumIn
    featureWidthConvert.io.rowNumIn <> io.rowNumIn

    featureConv11Convert.io.channelIn <> io.channelIn
    featureConv11Convert.io.colNumIn <> io.colNumIn
    featureConv11Convert.io.rowNumIn <> io.rowNumIn
    //    when(io.convType === CONV_STATE.CONV33) {
    //        padding.io.sData <> io.sData
    //        padding.io.start <> io.start
    //        featureGenerate.io.mData <> io.mData
    //        featureWidthConvert.io.sData.valid := False
    //        featureWidthConvert.io.sData.payload := 0
    //        featureWidthConvert.io.mData.ready := False
    //        featureWidthConvert.io.start := False
    //
    //    } elsewhen (io.convType === CONV_STATE.CONV11_8X) {
    //        featureWidthConvert.io.sData <> io.sData
    //        featureWidthConvert.io.mData <> io.mData
    //        featureWidthConvert.io.start <> io.start
    //
    //        featureGenerate.io.mData.ready := False
    //        padding.io.start <> False
    //        padding.io.sData.valid := False
    //        padding.io.sData.payload := 0
    //    } elsewhen (io.convType === CONV_STATE.CONV11) {
    //
    //    } otherwise {
    //
    //    }
//    val tmp_last = Vec(Bool(),3)
    switch(io.convType) {
        is(CONV_STATE.CONV33) {  //0
            padding.io.sData <> io.sData
            padding.io.start <> io.start
            featureGenerate.io.mData <> io.mData
            featureWidthConvert.io.sData.valid := False
            featureWidthConvert.io.sData.payload := 0
            featureWidthConvert.io.mData.ready := False
            featureWidthConvert.io.start := False

            featureConv11Convert.io.sData.valid := False
            featureConv11Convert.io.sData.payload := 0
            featureConv11Convert.io.mData.ready := False
            featureConv11Convert.io.start := False
//            tmp_last := featureGenerate.io.
        }
        is(CONV_STATE.CONV11_8X) {   //将8个8通道点集成到3*3中，第9个点数据为0  //1
            featureWidthConvert.io.sData <> io.sData
            featureWidthConvert.io.mData <> io.mData
            featureWidthConvert.io.start <> io.start

            featureGenerate.io.mData.ready := False
            padding.io.start <> False
            padding.io.sData.valid := False
            padding.io.sData.payload := 0

            featureConv11Convert.io.sData.valid := False
            featureConv11Convert.io.sData.payload := 0
            featureConv11Convert.io.mData.ready := False
            featureConv11Convert.io.start := False
        }
        is(CONV_STATE.CONV11) {  //出普通的9个点，只有第一个点是正常的8通道数据，其他8个点是0  //小于64通道情况下的11用这个 //2

            featureConv11Convert.io.sData <> io.sData
            featureConv11Convert.io.mData <> io.mData
            featureConv11Convert.io.start <> io.start

            padding.io.start <> False
            padding.io.sData.valid := False
            padding.io.sData.payload := 0
            featureGenerate.io.mData.ready := False

            featureWidthConvert.io.sData.valid := False
            featureWidthConvert.io.sData.payload := 0
            featureWidthConvert.io.mData.ready := False
            featureWidthConvert.io.start := False
        }
        default {
            padding.io.start <> False
            padding.io.sData.valid := False
            padding.io.sData.payload := 0
            featureGenerate.io.mData.ready := False

            featureWidthConvert.io.sData.valid := False
            featureWidthConvert.io.sData.payload := 0
            featureWidthConvert.io.mData.ready := False
            featureWidthConvert.io.start := False

            featureConv11Convert.io.sData.valid := False
            featureConv11Convert.io.sData.payload := 0
            featureConv11Convert.io.mData.ready := False
            featureConv11Convert.io.start := False

            io.mData.mData.foreach(i => {
                i.valid := False
                i.payload := 0
            })
            io.sData.ready := False
        }
    }

    padding >> featureGenerate
    //    featureGenerate.io.last <> io.last
}

object DataGenerate extends App {
//    def main(args: Array[String]): Unit = {
//        SpinalConfig(
//        ).generateVerilog(new DataGenerate(DataGenerateConfig(8, 12, 8, 10, 9, 11, 1)))
//    }

    SimConfig
            .withXSimSourcesPaths(ArrayBuffer("D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt/"),ArrayBuffer("")) //第二个参数是bd的参数
            .withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
      .withXSim.withWave.compile(new DataGenerate(DataGenerateConfig(8,10,8,10,9,2048,1)))
      .doSim{   dut =>
          dut.clockDomain.forkStimulus(10) //10ns为周期 100MHz  //改成10ps 应该能减少编译时间 不能
          dut.clockDomain.waitSampling(10)

          dut.io.rowNumIn #= 320  //Padding后+2    图片数据320*320*32
          dut.io.colNumIn #= 320
          dut.io.channelIn #= 32  //256/8 = 32
          dut.io.enPadding #= true
          dut.io.zeroDara #= 1
          dut.io.zeroNum #= 1
          dut.io.convType #= 0  //3*3

          dut.io.sData.payload #= 0
          dut.io.sData.valid #= false
          dut.io.mData.ready #= false
          dut.io.start #= false
          dut.clockDomain.waitSampling(10)
          dut.io.mData.ready #= true
          dut.io.start #= true
          dut.clockDomain.waitSampling()
          dut.io.start #= false

          for(i <- 0 until 320*320*4){  //channelIn = 256
              dut.io.sData.valid #= true
              //            dut.io.sData.payload #= (U"8'd8"@@U"8'd7"@@U"8'd6"@@U"8'd5"@@U"8'd4"@@U"8'd3"@@U"8'd2"@@U"8'd1").toInt //sData 64bit
              //            dut.io.sData.payload #= BigInt("578437695752307201",10)
              dut.io.sData.payload #= i%255
              dut.clockDomain.waitSamplingWhere(dut.io.sData.valid.toBoolean && dut.io.sData.ready.toBoolean)
          }

          dut.io.sData.valid #= false
          //          dut.clockDomain.waitSampling(100)
//          dut.clockDomain.waitSamplingWhere()
          dut.clockDomain.waitSampling(10000)

      }
}
