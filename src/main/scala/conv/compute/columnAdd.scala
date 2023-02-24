package conv.compute

import config.Config.filePath
import spinal.core._
import tools.ColAdd

import java.io.File

class columnAdd(systolicArrayCfg: SystolicArrayCfg) extends Component {
  val io = new Bundle {
    val result_col = in Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits), systolicArrayCfg.TILE_SIZE)
    val startAdd = in Bool()
    val colAddResult = out(Reg(UInt(systolicArrayCfg.COLADD_WIDTH bits)) init 0)
    val colAddResult_Valid = out((Bool()) ) //前面有寄存器
  }
  noIoPrefix()

  def AddIpLatency = 2
  val LevelNum = systolicArrayCfg.TILE_SIZE match {
    case 8 => 3
    case 16 => 4
    case _ => -1
  }

  val counter = Reg(UInt(log2Up(AddIpLatency*LevelNum)+1 bits)) init 0  //5bits 可以不写死
//  val result_valid = Vec(Reg(Bool()) init False,systolicArrayCfg.TILE_SIZE) //对第一次的valid进行systolicArrayCfg.TILE_SIZE次打拍，以保证io口的valid持续拉高且计数器能连续启动
  val result_valid = Reg(UInt(systolicArrayCfg.TILE_SIZE bits)) init 0//移位寄存器  清空问题

  result_valid := result_valid |<< 1
  io.colAddResult_Valid := result_valid.orR


//  (0 to systolicArrayCfg.TILE_SIZE - 2).foreach{ i =>
//    result_valid(i+1) := result_valid(i)
//  }

//  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach{ i =>    //写法有问题
//    io.colAddResult_Valid := io.colAddResult_Valid | result_valid(i)
//  }


  when(io.startAdd || counter > 0){    //valid 持续拉高systolicArrayCfg.TILE_SIZE个周期
    when(counter === AddIpLatency*LevelNum){
      result_valid(0) := True
      counter := 0
    }otherwise{
      result_valid(0) := False
      counter := counter + 1
    }
  }otherwise{
    result_valid(0) := False
    counter := 0
  }

  if(systolicArrayCfg.TILE_SIZE == 8){  ////需要更改，这样阵列只能8/16
    val firstLevel = Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits),4)
    val secondLevel = Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits),2)
    val thirdLevel = UInt(systolicArrayCfg.COLADD_WIDTH bits)

//    io.colAddResult_Valid := result_valid(0) | result_valid(1) | result_valid(2) | result_valid(3) | result_valid(4) | result_valid(5) | result_valid(6) | result_valid(7) //离谱

    (0 to 3).foreach{ i =>
      val addFirst = ColAdd("colAdd",genericTcl = i == 0)
      addFirst.a <> io.result_col(i*2)
      addFirst.b <> io.result_col(i*2+1)
      addFirst.s <> firstLevel(i)
    }
    (0 to 1).foreach{ i =>
      val addSecond = ColAdd("colAdd",genericTcl = false)
      addSecond.a <> firstLevel(i*2)
      addSecond.b <> firstLevel(i*2+1)
      addSecond.s <> secondLevel(i)
    }

    (0 to 0).foreach{ i =>
      val addThird = ColAdd("colAdd",genericTcl = false)
      addThird.a <> secondLevel(i*2)
      addThird.b <> secondLevel(i*2+1)
      addThird.s <> thirdLevel
    }
    io.colAddResult := thirdLevel
  }else if(systolicArrayCfg.TILE_SIZE == 16){

    val firstLevel = Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits),8)
    val secondLevel = Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits),4)
    val thirdLevel = Vec(UInt(systolicArrayCfg.COLADD_WIDTH bits),2)
    val fourthLevel = UInt(systolicArrayCfg.COLADD_WIDTH bits)
//    io.colAddResult_Valid := result_valid(0) | result_valid(1) | result_valid(2) | result_valid(3) | result_valid(4) | result_valid(5) | result_valid(6) | result_valid(7) | result_valid(8) | result_valid(9) | result_valid(10) | result_valid(11) | result_valid(12) | result_valid(13) | result_valid(14) | result_valid(15)


    (0 to 7).foreach{ i =>
      val addFirst = ColAdd("colAdd",genericTcl = false)
      addFirst.a <> io.result_col(i*2)
      addFirst.b <> io.result_col(i*2+1)
      addFirst.s <> firstLevel(i)
    }
    (0 to 3).foreach{ i =>
      val addSecond = ColAdd("colAdd",genericTcl = false)
      addSecond.a <> firstLevel(i*2)
      addSecond.b <> firstLevel(i*2+1)
      addSecond.s <> secondLevel(i)
    }
    (0 to 1).foreach{ i =>
      val addThird = ColAdd("colAdd",genericTcl = false)
      addThird.a <> secondLevel(i*2)
      addThird.b <> secondLevel(i*2+1)
      addThird.s <> thirdLevel(i)
    }
    (0 to 0).foreach{ i =>
      val addFourth = ColAdd("colAdd",genericTcl = false)
      addFourth.a <> thirdLevel(i*2)
      addFourth.b <> thirdLevel(i*2+1)
      addFourth.s <> fourthLevel
    }

    io.colAddResult := fourthLevel
  }
}

object columnAdd extends App {

    val clkCfg = ClockDomainConfig(resetKind = SYNC, resetActiveLevel = HIGH) //同步高复位
//    SpinalConfig(
//      targetDirectory = filePath + File.separator + "rtl",
//      headerWithDate = true,
//      defaultConfigForClockDomains = clkCfg
//    ).generateVerilog(new columnAdd(8,32))
}