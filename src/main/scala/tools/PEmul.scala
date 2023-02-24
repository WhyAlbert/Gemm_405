package tools
import config.Config.filePath

import org.apache.commons.io.FileUtils
import spinal.core._
import spinal.lib._

class PEmul(componentName: String) extends BlackBox {
  val a = in UInt (8 bits)
  val b = in UInt (8 bits)
  val p = out UInt (32 bits)
  val CLK = in Bool()
  this.mapClockDomain(clock = CLK)

  setInlineVerilog(
    """module PEmul (
              input             [7:0] a       ,  //feature
              input             [7:0] b       ,  //weight
              output           [31:0] p      ,
              input             CLK
          );

          wire signed       [7:0]   bin;
          assign bin = $signed(b);

          """ + "\r\n          " + componentName + " " + componentName + "_inst" +
      """ (
            .CLK(CLK),  // input wire CLK
            .A(a),      // input wire [7 : 0] A
            .B(bin),      // input wire [7 : 0] B
            .P(p)      // output wire [31 : 0] P
          );

endmodule
      """.stripMargin)
}

object PEmul {
  private var genClk = true

  def genTcl(componentName: String): Unit = {
    import java.io._
    val createMulCmd = s"set mulExit [lsearch -exact [get_ips $componentName] $componentName]\n" +
      s"if { $$mulExit <0} {\n" +
      s"create_ip -name mult_gen -vendor xilinx.com -library ip -version 12.0 -module_name $componentName\n" +
      s"}\n" + s"set_property -dict [list CONFIG.PortAType {Unsigned} CONFIG.PortAWidth {8} CONFIG.PortBWidth {8} CONFIG.Multiplier_Construction {Use_Mults} CONFIG.Use_Custom_Output_Width {true} CONFIG.OutputWidthHigh {31} CONFIG.PipeStages {3}] [get_ips $componentName]"

    FileUtils.forceMkdir(new File(filePath + File.separator + "tcl"))
    val tclHeader = new PrintWriter(new File(filePath + File.separator + "tcl" + File.separator + s"generate$componentName.tcl"))
    tclHeader.write(createMulCmd)
    tclHeader.write("\r\n")
    //        tclHeader.write(s"set_property generate_synth_checkpoint 0 [get_files $componentName.xci] \n")
    tclHeader.close()
  }

  def apply(componentName: String, myClockDomain: ClockDomain = null, genericTcl: Boolean = false) = {
    if (genericTcl) {
      genTcl(componentName)
    }
    val pemul = new PEmul(componentName)
    pemul
  }
}