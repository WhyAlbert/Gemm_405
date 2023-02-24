package tools
import config.Config.filePath

import org.apache.commons.io.FileUtils
import spinal.core._
import spinal.lib._

class PEadd(componentName: String) extends BlackBox {  //PEAdd
  val a = in UInt (32 bits)
  val b = in UInt (32 bits)
  val s = out UInt (32 bits)
  val CLK = in Bool()
  this.mapClockDomain(clock = CLK)

  setInlineVerilog(
    """module PEadd (
              input             [31:0] a       ,
              input             [31:0] b       ,
              output           [31:0] s      ,
              input             CLK
          );

            wire  signed       [31:0]   ain,bin;
            assign ain = $signed(a);
            assign bin = $signed(b);


          """ + "\r\n          " + componentName + " " + componentName + "_inst" +
      """ (
            .CLK(CLK),  // input wire CLK
            .A(ain),      // input wire [31 : 0] A
            .B(bin),      // input wire [31 : 0] B
            .S(s)      // output wire [31 : 0] P
          );

endmodule
      """.stripMargin)
}

object PEadd {
  private var genClk = true

  def genTcl(componentName: String): Unit = {
    import java.io._
    val createPEAddCmd = s"set PEaddExit [lsearch -exact [get_ips $componentName] $componentName]\n" +
      s"if { $$PEaddExit <0} {\n" +
      s"create_ip -name c_addsub -vendor xilinx.com -library ip -version 12.0 -module_name $componentName\n" +
      s"}\n" + s"set_property -dict [list CONFIG.Implementation {DSP48} CONFIG.A_Width {32} CONFIG.B_Width {32} CONFIG.Latency_Configuration {Manual} CONFIG.Latency {1} CONFIG.CE {false} CONFIG.Out_Width {32} CONFIG.B_Value {00000000000000000000000000000000}] [get_ips $componentName]"

    FileUtils.forceMkdir(new File(filePath + File.separator + "tcl"))
    val tclHeader = new PrintWriter(new File(filePath + File.separator + "tcl" + File.separator + s"generate$componentName.tcl"))
    tclHeader.write(createPEAddCmd)
    tclHeader.write("\r\n")
    //        tclHeader.write(s"set_property generate_synth_checkpoint 0 [get_files $componentName.xci] \n")
    tclHeader.close()
  }

  def apply(componentName: String, myClockDomain: ClockDomain = null, genericTcl: Boolean = false) = {
    if (genericTcl) {
      genTcl(componentName)
    }
    val peadd = new PEadd(componentName)
    peadd
  }


}