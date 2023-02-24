package conv.compute

import spinal.core._
import config.Config._
import spinal.lib.Delay
import tools.DSP
import tools.PEadd
import tools.PEmul

import java.io.File

class PE( systolicArrayCfg: SystolicArrayCfg,Tcl_gen : Boolean) extends Component { //systolicArrayCfg.KERNEL_SIZE is 9 or 1
  val io = new Bundle {
    val weight_CE = in Bool()
    val feature_CE = in Bool()
    val weight = in Vec(UInt(systolicArrayCfg.DATA_WIDTH bits), systolicArrayCfg.KERNEL_SIZE)
    val feature = in UInt (systolicArrayCfg.DATA_WIDTH bits)


    val feature_out = out(Reg(UInt(systolicArrayCfg.DATA_WIDTH bits)) init 0 )
    val result = out(Reg(UInt(systolicArrayCfg.COLADD_WIDTH bits)) init 0)
    val computeDone = out(Bool() ) //结果的valid
    val weightDone = out(Bool())  //更换权重信号
  }

  noIoPrefix()
  def DSP_Latency = 3 //现版本不用DSP了
  def Mul_Latency = 3
  def Add_Latency = 1


  val weight_reg = Vec(Reg(UInt(systolicArrayCfg.DATA_WIDTH bits)) init 0, systolicArrayCfg.KERNEL_SIZE) //寄存器在RAM口

  when(io.weight_CE) {
    (0 to systolicArrayCfg.KERNEL_SIZE - 1).foreach { i =>
      weight_reg(i) := io.weight(i)
    }
  }

  val counter = Reg(UInt(log2Up(systolicArrayCfg.KERNEL_SIZE) bits)) init 0 //count times //3bit计不到9
  val computeDoneTmp = Reg(Bool()) init False
  val mulOut = UInt(systolicArrayCfg.KERNELADD_WIDTH bits)
  val addBin = UInt(systolicArrayCfg.KERNELADD_WIDTH bits)
  val addBClear = Bool()
  val addOut = UInt(systolicArrayCfg.KERNELADD_WIDTH bits)

  when(io.feature_CE){
    when(counter === systolicArrayCfg.KERNEL_SIZE - 1){
      counter := 0
      computeDoneTmp := True
    }otherwise{
      counter := counter + 1
      computeDoneTmp := False
    }
  }

  when(addBClear){
    addBin := 0
  }otherwise{
    addBin := addOut
  }


  io.weightDone := (counter === systolicArrayCfg.KERNEL_SIZE - 1) ? True | False
  io.computeDone := Delay(computeDoneTmp,Mul_Latency+Add_Latency)
  addBClear := Delay(computeDoneTmp,Mul_Latency)

  val peMul = PEmul("PEMul",null,Tcl_gen)
  val peAdd =  PEadd("PEAdd",null,Tcl_gen)

  peMul.a <> io.feature
  peMul.b <> weight_reg(counter.resized)
  peMul.p <> mulOut

  peAdd.a <> mulOut
  peAdd.b <> addBin
  peAdd.s <> addOut


  io.result := addOut
  io.feature_out := io.feature

}

object PE extends App {
  val clkCfg = ClockDomainConfig(resetKind = SYNC, resetActiveLevel = HIGH) //同步高复位
  SpinalConfig(
    targetDirectory = filePath + File.separator + "rtl",
    headerWithDate = true,
    defaultConfigForClockDomains = clkCfg
  ).generateVerilog(new PE(SystolicArrayCfg(8,8,32,32,32,9),true))
}