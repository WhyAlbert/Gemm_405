package conv.dataGenerate

import com.google.gson.JsonParser
import spinal.core.{Area, Bits, Bool, Bundle, ClockDomainConfig, Component, False, HIGH, IntToBuilder, Reg, RegInit, RegNext, SYNC, SpinalConfig, SpinalEnum, True, UInt, binaryOneHot, in, is, log2Up, out, switch, when}
import spinal.lib.{Counter, master, slave}
import conv.wa.{WaCounter, WaStreamFifo}
import spinal.core.sim._

import scala.io.Source

case class PaddingConfig(DATA_WIDTH: Int, CHANNEL_WIDTH: Int, COMPUTE_CHANNEL_NUM: Int, FEATURE_WIDTH: Int, ZERO_NUM: Int) {
    val PICTURE_NUM = 1
    val STREAM_DATA_WIDTH = DATA_WIDTH * PICTURE_NUM * COMPUTE_CHANNEL_NUM
    val ZERO_NUM_WIDTH = ZERO_NUM.toBinaryString.length
}

object PaddingEnum extends SpinalEnum(defaultEncoding = binaryOneHot) {
    val IDLE, INIT, UPDOWN, LEFT, CENTER, RIGHT, END = newElement
}

case class PaddingFsm(start: Bool) extends Area {

    val initEnd = Bool()
    val leftEnd = Bool()
    val rightEnd = Bool()
    val upDownEnd = Bool()
    val centerEnd = Bool()
    val endEnd = Reg(False)
    val enPadding = Bool()
    val enUpDown = Bool()
    val currentState = Reg(PaddingEnum()) init PaddingEnum.IDLE
    val nextState = PaddingEnum()
    currentState := nextState
    switch(currentState) {
        is(PaddingEnum.IDLE) {
            when(start) {
                nextState := PaddingEnum.INIT
            } otherwise {
                nextState := PaddingEnum.IDLE
            }
        }
        is(PaddingEnum.INIT) {
            when(initEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.LEFT
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }
            } otherwise {
                nextState := PaddingEnum.INIT
            }
        }
        is(PaddingEnum.UPDOWN) {
            when(upDownEnd) {
                nextState := PaddingEnum.RIGHT
            } otherwise {
                nextState := PaddingEnum.UPDOWN
            }
        }
        is(PaddingEnum.LEFT) {
            when(leftEnd) {
                when(enUpDown) {
                    nextState := PaddingEnum.UPDOWN
                } otherwise {
                    nextState := PaddingEnum.CENTER
                }

            } otherwise {
                nextState := PaddingEnum.LEFT
            }
        }
        is(PaddingEnum.CENTER) {
            when(centerEnd) {
                when(enPadding) {
                    nextState := PaddingEnum.RIGHT
                } otherwise {
                    nextState := PaddingEnum.END
                }
            } otherwise {
                nextState := PaddingEnum.CENTER
            }

        }
        is(PaddingEnum.RIGHT) {
            when(rightEnd) {
                nextState := PaddingEnum.END
            } otherwise {
                nextState := PaddingEnum.RIGHT
            }
        }
        is(PaddingEnum.END) {
            when(endEnd) {
                nextState := PaddingEnum.IDLE
            } elsewhen (enPadding) {
                nextState := PaddingEnum.LEFT
            } otherwise {
                nextState := PaddingEnum.CENTER
            }
        }
    }
}

class Padding(paddingConfig: PaddingConfig) extends Component {
    val io = new Bundle {
        val sData = slave Stream (UInt(paddingConfig.STREAM_DATA_WIDTH bits))
        val mData = master Stream (UInt(paddingConfig.STREAM_DATA_WIDTH bits))  simPublic()
        val enPadding = in Bool()
        val channelIn = in UInt (paddingConfig.CHANNEL_WIDTH bits)
        val start = in Bool()
        val rowNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)
        val rowNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)
        val colNumIn = in UInt (paddingConfig.FEATURE_WIDTH bits)
        val colNumOut = out UInt (paddingConfig.FEATURE_WIDTH bits)
        val zeroDara = in Bits (paddingConfig.DATA_WIDTH bits)
        val zeroNum = in UInt (paddingConfig.ZERO_NUM_WIDTH bits)
        val last = out Bool()
    }
    noIoPrefix()
    when(io.enPadding) {
        io.rowNumOut := (io.zeroNum << 1) + io.rowNumIn  //zeroNum有没有不是1的情况？
        io.colNumOut := (io.zeroNum << 1) + io.colNumIn
    } otherwise {
        io.rowNumOut := io.rowNumIn
        io.colNumOut := io.colNumIn
    }

    val channelTimes: UInt = RegNext(io.channelIn >> log2Up(paddingConfig.COMPUTE_CHANNEL_NUM), 0) //0是init的值  512/8=64
    val fifo = WaStreamFifo(UInt(paddingConfig.STREAM_DATA_WIDTH bits), 5)  //深度5 64bits
    fifo.io.pop <> io.mData

    val fsm = PaddingFsm(io.start)
    fsm.enPadding := io.enPadding
    io.sData.ready <> (fifo.io.push.ready && fsm.currentState === PaddingEnum.CENTER)

    private def assign(dst: UInt, src: UInt, dataWidth: Int): Unit = {  //递归每8bit赋值
        if (dst.getWidth == dataWidth) dst := src
        else {
            assign(dst(dataWidth - 1 downto 0), src, dataWidth)
            assign(dst(dst.getWidth - 1 downto dataWidth), src, dataWidth)
        }
    }

    private def selfClear(in: Bool, en: Bool): Unit = {
        when(en) {
            in := True
        } otherwise {
            in := False
        }
    }

    val initEn = RegInit(False) setWhen (fsm.currentState === PaddingEnum.INIT) clearWhen (fsm.nextState =/= PaddingEnum.INIT)
    val initCount = WaCounter(initEn, 5, 8)
    when(fsm.currentState === PaddingEnum.IDLE) {
        initCount.clear
    }
    fsm.initEnd := initCount.valid


    val zeroValid = Bool()
    when(fsm.currentState === PaddingEnum.CENTER) {
        fifo.io.push.valid := io.sData.valid
        fifo.io.push.payload := io.sData.payload
    } otherwise {
        fifo.io.push.valid := zeroValid
        assign(fifo.io.push.payload, io.zeroDara.asUInt, paddingConfig.DATA_WIDTH) //把64bit的8通道，每8bit赋值为zeroData
    }

    val channelCnt = WaCounter(fifo.io.push.fire, paddingConfig.CHANNEL_WIDTH, channelTimes - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        channelCnt.clear
    }
    val colCnt = WaCounter(channelCnt.valid && (fifo.io.push.fire), paddingConfig.FEATURE_WIDTH, io.colNumOut - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        colCnt.clear
    }
    val rowCnt = WaCounter(fsm.nextState === PaddingEnum.END, paddingConfig.FEATURE_WIDTH, io.rowNumOut - 1)
    when(fsm.currentState === PaddingEnum.IDLE) {
        rowCnt.clear
    }
    selfClear(zeroValid, fsm.currentState === PaddingEnum.LEFT || fsm.currentState === PaddingEnum.RIGHT || fsm.currentState === PaddingEnum.UPDOWN)
    selfClear(fsm.leftEnd, colCnt.count === io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.rightEnd, colCnt.count === io.colNumOut - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.endEnd, rowCnt.count === io.rowNumOut - 1)
    selfClear(fsm.upDownEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.centerEnd, colCnt.count === io.colNumOut - io.zeroNum - 1 && channelCnt.valid && fifo.io.push.fire)
    selfClear(fsm.enUpDown, rowCnt.count < io.zeroNum || rowCnt.count > io.rowNumOut - io.zeroNum - 1)
    selfClear(io.last, fsm.currentState === PaddingEnum.END && fsm.nextState === PaddingEnum.IDLE)

    def >>(featureGenerate: FeatureGenerate): Unit = {
        io.rowNumOut <> featureGenerate.io.rowNumIn
        io.colNumOut <> featureGenerate.io.colNumIn
        featureGenerate.io.channelIn := io.channelIn
        io.mData <> featureGenerate.io.sData
        featureGenerate.io.start := io.start //Padding和featureGenerate同时启动？ 好像没问题
    }
}

object Padding extends App {

    SimConfig
      //      withXSimSourcesPaths(ArrayBuffer("D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt/"),ArrayBuffer("")) //第二个参数是bd的参数
      //      .withXilinxDevice("xcvu9p-fsgd2104-2LV-e")
      .withXSim.withWave.compile(new Padding(PaddingConfig(8,10,8,10,1)))
      .doSim{   dut =>
          dut.clockDomain.forkStimulus(10) //10ns为周期 100MHz  //改成10ps 应该能减少编译时间 不能
          dut.clockDomain.waitSampling(10)

          dut.io.rowNumIn #= 416
          dut.io.colNumIn #= 416
          dut.io.channelIn #= 256  //256/8 = 32
          dut.io.enPadding #= true
          dut.io.zeroDara #= 1
          dut.io.zeroNum #= 1

          dut.io.sData.payload #= 0
          dut.io.sData.valid #= false
          dut.io.mData.ready #= false
          dut.io.start #= false
          dut.clockDomain.waitSampling(10)
          dut.io.mData.ready #= true
          dut.io.start #= true
          dut.clockDomain.waitSampling()
          dut.io.start #= false

          for(i <- 0 until 416*416*32){  //channelIn = 256
              dut.io.sData.valid #= true
              //            dut.io.sData.payload #= (U"8'd8"@@U"8'd7"@@U"8'd6"@@U"8'd5"@@U"8'd4"@@U"8'd3"@@U"8'd2"@@U"8'd1").toInt //sData 64bit
              //            dut.io.sData.payload #= BigInt("578437695752307201",10)
              dut.io.sData.payload #= i%255
              dut.clockDomain.waitSamplingWhere(dut.io.sData.valid.toBoolean && dut.io.sData.ready.toBoolean)
          }

          dut.io.sData.valid #= false
//          dut.clockDomain.waitSampling(100)
          dut.clockDomain.waitSamplingWhere(dut.io.last.toBoolean)
          dut.clockDomain.waitSampling(100)


      }


}
