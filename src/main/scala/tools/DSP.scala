package tools

//import config.Config.{dsp2x, filePath}

import config.Config.filePath

import org.apache.commons.io.FileUtils
import spinal.core._
import spinal.lib._


class DSP(componentName: String, clockDomain2X: ClockDomain = null) extends BlackBox {

  val a = in UInt (8 bits)
  val b = in UInt (8 bits)
  val CE = in Bool()
  val SCLR = in Bool()
  val p = out UInt (32 bits)
  val b_out = out UInt(8 bits)
  val CLK = in Bool()
  this.mapClockDomain(clock = CLK)

    setInlineVerilog(
      """module DSP (
              input             [7:0] a       ,
              input             [7:0] b       ,
              output           [31:0] p      ,
              input             CLK         ,
              input             CE,
              input             SCLR,
              output            [7:0]b_out
          );

        wire  signed       [7:0]   ain;
        assign ain = $signed(a);
        wire [47:0] pout;
        assign p = pout[31:0];

          """ + "\r\n          " + componentName + " " + componentName + "_inst" +
        """ (
            .CE(CE),        // input wire CE
            .SCLR(SCLR),    // input wire SCLR
            .CLK(CLK),  // input wire CLK
            .A(ain),      // input wire [7 : 0] A
            .B({1'b0,b}),      // input wire [8 : 0] B
            .P(pout),      // output wire [47 : 0] P
            .BCOUT(b_out)  // output wire [29 : 0] ACOUT
          );

endmodule
      """.stripMargin)


}

object DSP {
  private var genClk = true

  def genTcl(componentName: String): Unit = {
    import java.io._
    val createDspCmd = s"set dspExit [lsearch -exact [get_ips $componentName] $componentName]\n" +
      s"if { $$dspExit <0} {\n" +
      s"create_ip -name dsp_macro -vendor xilinx.com -library ip -version 1.0 -module_name $componentName\n" +
      //            s"}\n" + s"set_property -dict [list CONFIG.instruction1 {(A+D)*B} CONFIG.pipeline_options {By_Tier} CONFIG.tier_3 {true} CONFIG.tier_4 {true} CONFIG.tier_6 {true} CONFIG.d_width {26} CONFIG.a_width {8} CONFIG.b_width {9} CONFIG.dreg_3 {true} CONFIG.areg_3 {true} CONFIG.areg_4 {true} CONFIG.breg_3 {true} CONFIG.breg_4 {true} CONFIG.creg_3 {false} CONFIG.creg_4 {false} CONFIG.creg_5 {false} CONFIG.mreg_5 {false} CONFIG.preg_6 {true} CONFIG.d_binarywidth {0} CONFIG.a_binarywidth {0} CONFIG.b_binarywidth {0} CONFIG.concat_width {48} CONFIG.concat_binarywidth {0} CONFIG.c_width {48} CONFIG.c_binarywidth {0} CONFIG.pcin_binarywidth {0} CONFIG.p_full_width {36} CONFIG.p_width {35} CONFIG.p_binarywidth {0}] [get_ips $componentName]"
       s"}\n" + s"set_property -dict [list CONFIG.instruction1 {A*B+P} CONFIG.pipeline_options {By_Tier} CONFIG.tier_4 {true} CONFIG.tier_5 {true} CONFIG.a_width {8} CONFIG.b_width {9} CONFIG.has_bcout {true} CONFIG.has_ce {true} CONFIG.has_sclr {true} CONFIG.tier_6 {true} CONFIG.areg_3 {false} CONFIG.areg_4 {true} CONFIG.breg_3 {false} CONFIG.breg_4 {true} CONFIG.creg_3 {false} CONFIG.creg_4 {false} CONFIG.creg_5 {false} CONFIG.mreg_5 {true} CONFIG.preg_6 {true} CONFIG.d_width {18} CONFIG.a_binarywidth {0} CONFIG.b_binarywidth {0} CONFIG.concat_width {48} CONFIG.concat_binarywidth {0} CONFIG.c_binarywidth {0} CONFIG.pcin_binarywidth {0}] [get_ips $componentName]"

    FileUtils.forceMkdir(new File(filePath + File.separator + "tcl"))
    val tclHeader = new PrintWriter(new File(filePath + File.separator + "tcl" + File.separator + s"generate$componentName.tcl"))
    tclHeader.write(createDspCmd)
    tclHeader.write("\r\n")
    //        tclHeader.write(s"set_property generate_synth_checkpoint 0 [get_files $componentName.xci] \n")
    tclHeader.close()
  }

  def apply(componentName: String, myClockDomain: ClockDomain = null, genericTcl: Boolean = false) = {
    if (genericTcl) {
      genTcl(componentName)
    }
    val dsp = new DSP(componentName, clockDomain2X = myClockDomain)
    dsp
  }
}