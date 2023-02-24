package instruction

import config.Config._
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite._
import spinal.lib.bus.misc.SizeMapping
import spinal.lib.bus.regif._
import spinal.lib.bus.regif.AccessType._

object RegList extends Area{

  def ROW_NUM_IN = 10 downto 0

  def COL_NUM_IN = 21 downto 11

  def CHANNEL_IN = 31 downto 22

  def CHANNEL_OUT = 41 downto 32

  def EN_PADDING = 42 downto 42

  def EN_ACTIVATION = 43 downto 43

  def Z1 = 51 downto 44

  def Z1_NUM = 54 downto 52

  def Z3 = 62 downto 55

  def EN_STRIDE = 63 downto 63

  def CONV_TYPE = 65 downto 64

  def FIRST_LAYER = 66 downto 66

  def WEIGHT_NUM = 111 downto 96

  def QUAN_NUM = 127 downto 112

  def AMEND = 159 downto 128

  val Reg0 = ("ROW_NUM_IN", ROW_NUM_IN.length, "COL_NUM_IN", COL_NUM_IN.length, "CHANNEL_IN", CHANNEL_IN.length)
  val Reg1 = ("CHANNEL_OUT", CHANNEL_OUT.length, "EN_PADDING", EN_PADDING.length, "EN_ACTIVATION", EN_ACTIVATION.length, "Z1", Z1.length, "Z1_NUM", Z1_NUM.length, "Z3", Z3.length, "EN_STRIDE", EN_STRIDE.length)
  val Reg2 = ("CONV_TYPE", CONV_TYPE.length, "FIRST_LAYER", FIRST_LAYER.length)
  val Reg3 = ("WEIGHT_NUM", WEIGHT_NUM.length, "QUAN_NUM", QUAN_NUM.length)
  val Reg4 = ("AMEND", AMEND.length)
  val Reg = Seq(("Reg0", Reg0), ("Reg1", Reg1), ("Reg2", Reg2), ("Reg3", Reg3), ("Reg4", Reg4))

}

class Instruction extends Component {
    val io = new Bundle{
      val regSData = slave(AxiLite4(log2Up(registerAddrSize),32)) //地址线 1MB 20bit
      val convInstruction = out Vec(Reg(Bits(32 bits)) init 0, RegList.Reg.length)
    }
    noIoPrefix()
    AxiLite4SpecRenamer(io.regSData)

    val bus = BusInterface(io.regSData,SizeMapping(0,registerAddrSize)) //从0开始映射
    val convStateReg = bus.newReg(doc = "卷积状态指令")
    val convControlReg = bus.newReg(doc = "卷积控制指令")

    val convState = in Bits (4 bits)  //入

    val t1 = convStateReg.field(Bits(4 bits), RO, doc = "卷积的状态")
    t1 := convState
    val convControl = convControlReg.field(Bits(4 bits), WO, doc = "卷积的控制指令").asOutput()

    var index = 0
    val convInstruction = RegList.Reg.foreach(in => {
      val reg = bus.newReg(doc = "Conv" + in._1)
      var h = 0
      var l = 0
      for (i <- 0 until in._2.productArity if i % 2 == 0) {
        val w = in._2.productElement(i + 1).toString.toInt
        l = h
        h = h + w
        val regFiled = reg.field(Bits(w bits), WO, doc = in._2.productElement(i).toString)
        io.convInstruction(index)((h - 1) downto l) := regFiled
      }
      index = index + 1
    })


      val writeAddrReg = bus.newReg(doc = "dma写地址")
      val writeAddr = writeAddrReg.field(32 bits, WO, doc = " convDma写地址").setName("writeAddr").asOutput()
      val writeLenReg = bus.newReg(doc = "dma写长度,以字节为单位")
      val writeLen = writeLenReg.field(32 bits, WO, doc = " convDma写长度").setName("writeLen").asOutput()

      val readAddrReg = bus.newReg(doc = "dma读地址")
      val readAddr = readAddrReg.field(32 bits, WO, doc ="convDma读地址").setName("readAddr").asOutput()
      val readLenReg = bus.newReg(doc = "dma读长度，以字节为单位")
      val readLen = readLenReg.field(32 bits, WO, doc = "convDma读长度").setName("readLen").asOutput()
      

//    val s = List("conv", "shape") //shape待用
//    val dma = Array.tabulate(2) { i => {
//      def gen = {
//
//        val writeAddrReg = bus.newReg(doc = "dma写地址")
//        val writeAddr = writeAddrReg.field(32 bits, WO, doc = s(i) + " dma写地址").setName(s(i) + "writeAddr").asOutput()
//        val writeLenReg = bus.newReg(doc = "dma写长度,以字节为单位")
//        val writeLen = writeLenReg.field(32 bits, WO, doc = s(i) + " dma写长度").setName(s(i) + "writeLen").asOutput()
//
//        var addr = List(writeAddr)
//        var len = List(writeLen)
//        val readAddrReg = bus.newReg(doc = "dma读地址")
//        val readAddr = readAddrReg.field(32 bits, WO, doc = s(i) + " dma读地址").setName(s(i) + "readAddr").asOutput()
//        val readLenReg = bus.newReg(doc = "dma读长度，以字节为单位")
//        val readLen = readLenReg.field(32 bits, WO, doc = s(i) + " dma读长度").setName(s(i) + "readLen").asOutput()
//        addr = addr.::(readAddr)
//        len = len.::(readLen)
//        if (i == 1) {
//          val readAddrReg = bus.newReg(doc = "dma读地址")
//          val readAddr = readAddrReg.field(32 bits, WO, doc = s(i) + " dma读地址1").setName(s(i) + "readAddr1").asOutput()
//          val readLenReg = bus.newReg(doc = "dma读长度，以字节为单位")
//          val readLen = readLenReg.field(32 bits, WO, doc = s(i) + " dma读长度").setName(s(i) + "readLen1").asOutput()
//          addr = addr.::(readAddr)
//          len = len.::(readLen)
//        }
//        addr = addr.reverse
//        len = len.reverse
//        List(addr, len)
//      }
//
//      gen
//    }
//    }
    bus.accept(HtmlGenerator("Reg.html", "SystolicConv"))

}

object Instruction extends App{
  SpinalVerilog(new Instruction)
}