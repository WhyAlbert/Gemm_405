package conv.compute
import spinal.core._
import config.Config._

import java.io.File

class channelAdd(systolicArrayCfg: SystolicArrayCfg) extends Component {
  val io = new Bundle{
    val ChannelAddData_Valid = in Bool()
    val dataIn = in UInt(systolicArrayCfg.COLADD_WIDTH bits)
    val init = in Bool()

    val dataOut = out(Vec(UInt(systolicArrayCfg.CHANNEL_ADD_WIDTH bits),systolicArrayCfg.TILE_SIZE)) //其实这里是一个点一个点算完的，开Vec是为了和刘伟项目对接
//    val channelAddDone = out(Reg(Bool()) init False) //受什么控制？ //这个信号理论上应该受computeCtrl来控制
  }
  noIoPrefix()

  val counter = Reg(UInt(log2Up(systolicArrayCfg.TILE_SIZE) bits) ) init 0

  val result_tmp = Vec(Reg(UInt(systolicArrayCfg.CHANNEL_ADD_WIDTH bits)).addAttribute("use_dsp","yes") init 0,systolicArrayCfg.TILE_SIZE)

  when(io.ChannelAddData_Valid){  //counter: 0~TileSize-1 对应Vec索引
    when(counter === systolicArrayCfg.TILE_SIZE - 1){
      counter := 0
    }otherwise{
      counter := counter + 1
    }
    result_tmp(counter) := result_tmp(counter) + io.dataIn
  }

  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach{ i =>
    io.dataOut(i) := result_tmp(i)
  }

  when(io.init){
    (0 to systolicArrayCfg.TILE_SIZE - 1).foreach{ i =>
      result_tmp(i) := 0
    }
  }

}

object channelAdd extends App {

  val clkCfg = ClockDomainConfig(resetKind = SYNC, resetActiveLevel = HIGH) //同步高复位
      SpinalConfig(
        targetDirectory = filePath + File.separator + "rtl",
        headerWithDate = true,
        defaultConfigForClockDomains = clkCfg
      ).generateVerilog(new channelAdd(SystolicArrayCfg(8,8,32,32,32,9)))
}