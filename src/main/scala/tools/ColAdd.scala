package tools
import config.Config.filePath

import org.apache.commons.io.FileUtils
import spinal.core._
import spinal.lib._

class ColAdd(componentName: String) extends BlackBox {  //colAdd
  val a = in UInt (32 bits)
  val b = in UInt (32 bits)
  val s = out UInt (32 bits)
  val CLK = in Bool()
  this.mapClockDomain(clock = CLK)

  setInlineVerilog(
    """module ColAdd (
              input             [31:0] a       ,
              input             [31:0] b       ,
              output           [31:0] s      ,
              input             CLK
          );

          """ + "\r\n          " + componentName + " " + componentName + "_inst" +
      """ (
            .CLK(CLK),  // input wire CLK
            .A(a),      // input wire [31 : 0] A
            .B(b),      // input wire [31 : 0] B
            .S(s)      // output wire [31 : 0] P
          );

endmodule
      """.stripMargin)
}

object ColAdd {
  private var genClk = true

  def genTcl(componentName: String): Unit = {
    import java.io._
    val createColAddCmd = s"set ColaddExit [lsearch -exact [get_ips $componentName] $componentName]\n" +
      s"if { $$ColaddExit <0} {\n" +
      s"create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name $componentName\n" +
      s"}\n" + s"set_property -dict [list CONFIG.Implementation {DSP48} CONFIG.A_Width {32} CONFIG.B_Width {32} CONFIG.Latency_Configuration {Automatic} CONFIG.CE {false} CONFIG.Out_Width {32} CONFIG.Latency {2} CONFIG.B_Value {00000000000000000000000000000000}] [get_ips $componentName]"

    FileUtils.forceMkdir(new File(filePath + File.separator + "tcl"))
    val tclHeader = new PrintWriter(new File(filePath + File.separator + "tcl" + File.separator + s"generate$componentName.tcl"))
    tclHeader.write(createColAddCmd)
    tclHeader.write("\r\n")
    //        tclHeader.write(s"set_property generate_synth_checkpoint 0 [get_files $componentName.xci] \n")
    tclHeader.close()
  }

  def apply(componentName: String, myClockDomain: ClockDomain = null, genericTcl: Boolean = false) = {
    if (genericTcl) {
      genTcl(componentName)
    }
    val colAdd = new ColAdd(componentName)
    colAdd
  }


}