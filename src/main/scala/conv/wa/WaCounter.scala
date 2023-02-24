package conv.wa

import spinal.core.{Area, Bool, False, IntToBuilder, Reg, True, UInt, when}

object WaCounter {
  def apply(en: Bool, width: Int, end: UInt) = new WaCounter(en, width, end)
//  def apply() = new  specialCounter()
}

class WaCounter(en: Bool, width: Int, cnt: UInt) extends Area {
  val count = Reg(UInt(width bits)) init 0
  val valid = Bool()
  when(count === cnt) {
    valid := True
  } otherwise {
    valid := False
  }
  when(en) {
    count := count + 1
    when(valid) {
      count := 0
    }
  }

  def clear = {
    count := 0
    valid := False
  }
}

//class specialCounter(en: Bool,width: Int, end: UInt) extends Area{
//    val count = Reg(UInt(width bits)) init 0
//
//
//
//}