package conv.compute

import spinal.core._
import config.Config._
import misc.TotalTcl
import spinal.lib.traversableOncePimped

import java.io.File
import tools.ColAdd

import scala.collection.mutable._


class Tile(systolicArrayCfg: SystolicArrayCfg) extends Component {
  val io = new Bundle {
    val Weight_CE = in Bool() //the same one use in the column
    val Feature_CE = in Bool()
        val Weight_Array = in Vec(Vec(UInt(8 bits), systolicArrayCfg.KERNEL_SIZE), systolicArrayCfg.TILE_SIZE) //one column   //
        val Feature_Array = in Vec(UInt(8 bits), systolicArrayCfg.TILE_SIZE) //one column
    //    val Tile_out = out Vec(Reg(UInt(32 bits)) init 0, systolicArrayCfg.TILE_SIZE) //one row //一个点一个点出？
    //    val Tile_out_valid = out(Reg(Bits(systolicArrayCfg.TILE_SIZE bits)) init 0)
//    val firstColComputeDone = out(Bool())
    val firstColWeightChange = out(Bool())

//    val TB_weight = in UInt (systolicArrayCfg.TILE_SIZE * systolicArrayCfg.KERNEL_SIZE  * systolicArrayCfg.DATA_WIDTH bits)
//    val TB_Feature_Array = in UInt (systolicArrayCfg.TILE_SIZE * systolicArrayCfg.DATA_WIDTH bits)
  }
  noIoPrefix()

//  val Weight_Array = Vec(Vec(UInt(8 bits), systolicArrayCfg.KERNEL_SIZE), systolicArrayCfg.TILE_SIZE) //one column   //
//  val Feature_Array = Vec(UInt(8 bits), systolicArrayCfg.TILE_SIZE) //one column
//
//  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach { a =>
//    Feature_Array(a) := io.TB_Feature_Array(((a * 8 + 8 - 1)) downto (a * 8)) //TB_test
//  }
//
//  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach { a =>
//    (0 to systolicArrayCfg.KERNEL_SIZE - 1).foreach { b =>
//      Weight_Array(a)(b) := io.TB_weight((a * 72 + b * 8 + 8 - 1) downto (a * 72 + b * 8)) //TB_test
//    }
//  }


  val Weight_CE_c = Reg(Bits((systolicArrayCfg.TILE_SIZE - 1) bits)) init 0
  val Feature_CE_c = Reg(Bits((systolicArrayCfg.TILE_SIZE - 1) bits)) init 0

  Weight_CE_c(0) := io.Weight_CE
  Feature_CE_c(0) := io.Feature_CE
  (0 to systolicArrayCfg.TILE_SIZE - 3).foreach { i =>
    Weight_CE_c(i + 1) := Weight_CE_c(i)
    Feature_CE_c(i + 1) := Feature_CE_c(i)
  }

  val Feature_cas = Vec(Vec(UInt(8 bits), systolicArrayCfg.TILE_SIZE), systolicArrayCfg.TILE_SIZE) //8 columns * 8 rows
  val result_c = Vec(Vec(UInt(32 bits), systolicArrayCfg.TILE_SIZE), systolicArrayCfg.TILE_SIZE) //8 * 8
  //  val computeDone_C = Vec(Bool(), systolicArrayCfg.TILE_SIZE)  //其实只开一个Vec代表列即可，一列的computeDone同时拉高  //？改成一维，用sFind
  //  val computeDone_C = Vec(Vec(Bool(), systolicArrayCfg.TILE_SIZE), systolicArrayCfg.TILE_SIZE) //其实只开一个Vec代表列即可，一列的computeDone同时拉高  //？改成一维，用sFind
  val computeDone_C = UInt(systolicArrayCfg.TILE_SIZE bits) //移位
  val colAddResult = UInt(systolicArrayCfg.COLADD_WIDTH bits)
  val colAddResult_Valid = Bool()

  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach { i => //i行,8行         //第一列的CE重点控制
    val PE_col0 = new PE( systolicArrayCfg,Tcl_gen = i == 0)
    PE_col0.io.weight_CE <> io.Weight_CE
    PE_col0.io.feature_CE <> io.Feature_CE
    PE_col0.io.weight <> io.Weight_Array(i)
    PE_col0.io.feature <> io.Feature_Array(i)
    PE_col0.io.feature_out <> Feature_cas(i)(0) //第一列不同行
    PE_col0.io.result <> result_c(0)(i) //第一列结果给到第一行
    PE_col0.io.computeDone <> computeDone_C(0) //第一列不同行
    if(i == 0){
      io.firstColWeightChange <> PE_col0.io.weightDone //其余信号悬空即可
    }
  }

  (0 to systolicArrayCfg.TILE_SIZE - 1).foreach { j => //j行,8行
    (0 to systolicArrayCfg.TILE_SIZE - 2).foreach { k => //k列,7列
      val PE_col1tosize = new PE(systolicArrayCfg, false) //if 16x16,rename PE8x7 to PE16x15 ,        Tcl_gen = false
      PE_col1tosize.io.weight_CE <> Weight_CE_c(k)
      PE_col1tosize.io.feature_CE <> Feature_CE_c(k)
      PE_col1tosize.io.weight <> io.Weight_Array(j)
      PE_col1tosize.io.feature <> Feature_cas(j)(k)
      PE_col1tosize.io.feature_out <> Feature_cas(j)(k + 1)
      PE_col1tosize.io.result <> result_c(k + 1)(j) //列结果给到行
      //      PE_col1tosize.io.result <> result_c(j)(k+1)
      //      PE_col1tosize.io.computeDone <> computeDone_C(k + 1)

      if (j == 0) {
        PE_col1tosize.io.computeDone <> computeDone_C(k + 1)
      }

    }
  }



    val colAdd = new columnAdd(systolicArrayCfg)

    when(computeDone_C(0)){
      colAdd.io.startAdd := True  //start信号只能给一下，不然会影响colAdd的计数器，从而影响使能错误
    }otherwise{
      colAdd.io.startAdd := False
    }

    var Tmap :Map[Int,Int] = Map()   //需要更改，这样阵列只能8/16
    if(systolicArrayCfg.TILE_SIZE == 8){
      Tmap += (1->0,2->1,4->2,8->3,16->4,32->5,64->6,128->7)
    }else if(systolicArrayCfg.TILE_SIZE == 16){
      Tmap += (1->0,2->1,4->2,8->3,16->4,32->5,64->6,128->7,256->8,512->9,1024->10,2048->11,4096->12,8192->13,16384->14,32768->15)
    }

  switch(computeDone_C){
    Tmap.iterator.foreach{ x =>
      is(x._1){
        colAdd.io.result_col <> result_c(x._2)
      }
    }
    default {
            (0 to systolicArrayCfg.TILE_SIZE - 1).foreach { j =>
              colAdd.io.result_col(j) <> U"32'd0"
            }
    }
  }

  colAddResult <> colAdd.io.colAddResult
  colAddResult_Valid <> colAdd.io.colAddResult_Valid

  //测试github上传

}

object Tile extends App {
  val clkcfg = ClockDomainConfig(resetKind = SYNC, resetActiveLevel = HIGH) //同步高复位
  SpinalConfig(
    targetDirectory = filePath + File.separator + "rtl",
    headerWithDate = true,
    defaultConfigForClockDomains = clkcfg,
    nameWhenByFile = false //更改when()内信号生成名称规则
//      genLineComments = true  //标注信号对应spinal文件对应行数
  ).generateVerilog(new Tile(SystolicArrayCfg(8,8,32,32,32,9)))
  TotalTcl(config.Config.filePath + File.separator + "tcl",config.Config.filePath).genTotalTcl
}