`timescale 1ns / 1ps

module dsp48e2 #(
    parameter A_WIDTH               = 2,
    parameter B_WIDTH               = 16,
    parameter C_WIDTH               = 16,
    parameter D_WIDTH               = 27,
    parameter P_WIDTH               = 16,
    parameter A_SIGNED              = 0,
    parameter B_SIGNED              = 0,
    parameter C_SIGNED              = 0,
    parameter D_SIGNED              = 0,
    parameter CASCADE_A             = 0,
    parameter CASCADE_B             = 0,
    parameter A_REG                 = 0,
    parameter AD_REG                = 0,
    parameter B_REG                 = 0,
    parameter C_REG                 = 0,
    parameter D_REG                 = 0,
    parameter M_REG                 = 0,
    parameter P_REG                 = 0,
    parameter OP_REG                = 0,
    parameter INMODE_REG            = 0,
    parameter A_CASCADE_REG         = -1,
    parameter B_CASCADE_REG         = -1,
    parameter USE_DPORT             = 0,
    parameter USE_MULTIPLY          = 0,
    parameter USE_PATTERN_DETECT    = 0,
    parameter MASK                  = 48'h3fffffffffff,
    parameter MASK_FROM_C           = 0,
    parameter USE_SIMD              = "ONE48"
)(
    input clk,
    input ce,
    input [A_WIDTH-1:0] A_IN,
    input [B_WIDTH-1:0] B_IN,
    input [C_WIDTH-1:0] C_IN,
    input [D_WIDTH-1:0] D_IN,
    input               CARRY_IN,
    input [8:0]         OP_MODE, 
    input [3:0]         ALU_MODE,
    input [4:0]         IN_MODE,
    
    output [3:0]        CARRY_OUT,
    output [P_WIDTH-1:0] P_OUT
);

    wire [29:0] a_int;
    wire [17:0] b_int;
    wire [47:0] c_int;
    wire [26:0] d_int;
    wire [47:0] p_out_int;
    wire carry_in_del;
    wire [C_WIDTH-1:0] c_in_del;
    wire [A_WIDTH-1:0] a_in_del;
    wire [B_WIDTH-1:0] b_in_del;
    wire [D_WIDTH-1:0] d_in_del;

    wire cea1      ;
    wire cea2      ;
    wire cealumode ;
    wire cead      ;
    wire ceinmode  ;
    wire ceb1      ;
    wire ceb2      ;
    wire cec       ;
    wire ced       ;
    wire cecarryin ;
    wire cectrl    ;
    wire cem       ;
    wire cep       ;

    localparam USE_MULT = USE_MULTIPLY ? "MULTIPLY" : "NONE";
    localparam AMULTSEL = USE_DPORT ? "AD" : "A";

    localparam delay_C_REG = (C_REG < 1) ? C_REG : 1;
    localparam delay_A_REG = (A_REG < 2) ? A_REG : 2;
    localparam delay_B_REG = (B_REG < 2) ? B_REG : 2;
    localparam delay_D_REG = (D_REG < 1) ? D_REG : 1;

    flt_delay#(
        .WIDTH  (1),
        .LENGTH (C_REG-delay_C_REG)
    )delay_carry_in_del(
        .clk    (clk),
        .ce     (ce),
        .D      (CARRY_IN), 
        .Q      (carry_in_del)
    );

    flt_delay#(
        .WIDTH  (C_WIDTH),
        .LENGTH (C_REG-delay_C_REG)
    )delay_c_int_del(
        .clk    (clk),
        .ce     (ce),
        .D      (C_IN), 
        .Q      (c_in_del)
    );

    flt_delay#(
        .WIDTH  (A_WIDTH),
        .LENGTH (A_REG-delay_A_REG)
    )delay_a_in_del(
        .clk    (clk),
        .ce     (ce),
        .D      (A_IN), 
        .Q      (a_in_del)
    );

    flt_delay#(
        .WIDTH  (B_WIDTH),
        .LENGTH (B_REG-delay_B_REG)
    )delay_b_in_del(
        .clk    (clk),
        .ce     (ce),
        .D      (B_IN), 
        .Q      (b_in_del)
    );

    flt_delay#(
        .WIDTH  (D_WIDTH),
        .LENGTH (D_REG-delay_D_REG)
    )delay_d_in_del(
        .clk    (clk),
        .ce     (ce),
        .D      (D_IN), 
        .Q      (d_in_del)
    );

    assign P_OUT = p_out_int[P_WIDTH-1:0];

    assign a_int = A_SIGNED ? {{30-A_WIDTH{a_in_del[A_WIDTH-1]}},a_in_del} : {{30-A_WIDTH{1'b0}},a_in_del};
    assign b_int = B_SIGNED ? {{18-B_WIDTH{b_in_del[B_WIDTH-1]}},b_in_del} : {{18-B_WIDTH{1'b0}},b_in_del};
    assign c_int = C_SIGNED ? {{48-C_WIDTH{c_in_del[C_WIDTH-1]}},c_in_del} : {{48-C_WIDTH{1'b0}},c_in_del};
    assign d_int = D_SIGNED ? {{27-D_WIDTH{d_in_del[D_WIDTH-1]}},d_in_del} : {{27-D_WIDTH{1'b0}},d_in_del};

    assign cea1      = (A_REG == 2'd2)?     ce : 1'b0;
    assign cea2      = (A_REG > 1'b0)?      ce : 1'b0;
    assign cealumode = (OP_REG > 1'b0)?     ce : 1'b0;
    assign cead      = (AD_REG > 1'b0)?     ce : 1'b0;
    assign ceinmode  = (INMODE_REG > 1'b0)? ce : 1'b0;
    assign ceb1      = (B_REG == 2'd2)?     ce : 1'b0;
    assign ceb2      = (B_REG > 1'b0)?      ce : 1'b0;
    assign cec       = (C_REG > 1'b0)?      ce : 1'b0;
    assign ced       = (D_REG > 1'b0)?      ce : 1'b0;
    assign cecarryin = (OP_REG > 1'b0)?     ce : 1'b0;
    assign cectrl    = (OP_REG > 1'b0)?     ce : 1'b0;
    assign cem       = (M_REG > 1'b0 && USE_MULTIPLY)? ce : 1'b0;
    assign cep       = (P_REG > 1'b0)?      ce : 1'b0;


   DSP48E2 #(
      // Feature Control Attributes: Data Path Selection
      .AMULTSEL(AMULTSEL),                    // Selects A input to multiplier (A, AD)
      .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
      .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
      .RND(48'h000000000000),            // Rounding Constant
      .USE_MULT(USE_MULT),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
      .USE_SIMD(USE_SIMD),                // SIMD selection (FOUR12, ONE48, TWO24)
      .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
      .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
      // Pattern Detector Attributes: Pattern Detection Configuration
      .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
      .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
      .MASK(MASK),                       // 48-bit mask value for pattern detect (1=ignore)
      .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
      .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
      .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
      .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
      // Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
      .IS_ALUMODE_INVERTED(4'b0000),     // Optional inversion for ALUMODE
      .IS_CARRYIN_INVERTED(1'b0),        // Optional inversion for CARRYIN
      .IS_CLK_INVERTED(1'b0),            // Optional inversion for CLK
      .IS_INMODE_INVERTED(5'b00000),     // Optional inversion for INMODE
      .IS_OPMODE_INVERTED(9'b000000000), // Optional inversion for OPMODE
      .IS_RSTALLCARRYIN_INVERTED(1'b0),  // Optional inversion for RSTALLCARRYIN
      .IS_RSTALUMODE_INVERTED(1'b0),     // Optional inversion for RSTALUMODE
      .IS_RSTA_INVERTED(1'b0),           // Optional inversion for RSTA
      .IS_RSTB_INVERTED(1'b0),           // Optional inversion for RSTB
      .IS_RSTCTRL_INVERTED(1'b0),        // Optional inversion for RSTCTRL
      .IS_RSTC_INVERTED(1'b0),           // Optional inversion for RSTC
      .IS_RSTD_INVERTED(1'b0),           // Optional inversion for RSTD
      .IS_RSTINMODE_INVERTED(1'b0),      // Optional inversion for RSTINMODE
      .IS_RSTM_INVERTED(1'b0),           // Optional inversion for RSTM
      .IS_RSTP_INVERTED(1'b0),           // Optional inversion for RSTP
      // Register Control Attributes: Pipeline Register Configuration
      .ACASCREG(delay_A_REG),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
      .ADREG(AD_REG),                         // Pipeline stages for pre-adder (0-1)
      .ALUMODEREG(OP_REG),                    // Pipeline stages for ALUMODE (0-1)
      .AREG(delay_A_REG),                          // Pipeline stages for A (0-2)
      .BCASCREG(delay_B_REG),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
      .BREG(delay_B_REG),                          // Pipeline stages for B (0-2)
      .CARRYINREG(OP_REG),                    // Pipeline stages for CARRYIN (0-1)
      .CARRYINSELREG(OP_REG),                 // Pipeline stages for CARRYINSEL (0-1)
      .CREG(delay_C_REG),                          // Pipeline stages for C (0-1)
      .DREG(delay_D_REG),                          // Pipeline stages for D (0-1)
      .INMODEREG(INMODE_REG),                     // Pipeline stages for INMODE (0-1)
      .MREG(M_REG),                          // Multiplier pipeline stages (0-1)
      .OPMODEREG(OP_REG),                     // Pipeline stages for OPMODE (0-1)
      .PREG(P_REG)                           // Number of pipeline stages for P (0-1)
   )
   DSP48E2_inst (
      // Cascade outputs: Cascade Ports
      .ACOUT(),                   // 30-bit output: A port cascade
      .BCOUT(),                   // 18-bit output: B cascade
      .CARRYCASCOUT(),     // 1-bit output: Cascade carry
      .MULTSIGNOUT(),       // 1-bit output: Multiplier sign cascade
      .PCOUT(),                   // 48-bit output: Cascade output
      // Control outputs: Control Inputs/Status Bits
      .OVERFLOW(),             // 1-bit output: Overflow in add/acc
      .PATTERNBDETECT(), // 1-bit output: Pattern bar detect
      .PATTERNDETECT(),   // 1-bit output: Pattern detect
      .UNDERFLOW(),           // 1-bit output: Underflow in add/acc
      // Data outputs: Data Ports
      .CARRYOUT(CARRY_OUT),             // 4-bit output: Carry
      .P(p_out_int),                           // 48-bit output: Primary data
      .XOROUT(),                 // 8-bit output: XOR data
      // Cascade inputs: Cascade Ports
      .ACIN(30'd0),                     // 30-bit input: A cascade data
      .BCIN(18'd0),                     // 18-bit input: B cascade
      .CARRYCASCIN(1'b0),       // 1-bit input: Cascade carry
      .MULTSIGNIN(1'b0),         // 1-bit input: Multiplier sign cascade
      .PCIN(48'b0),                     // 48-bit input: P cascade
      // Control inputs: Control Inputs/Status Bits
      .ALUMODE(ALU_MODE),               // 4-bit input: ALU control
      .CARRYINSEL(3'b000),         // 3-bit input: Carry select
      .CLK(clk),                       // 1-bit input: Clock
      .INMODE(IN_MODE),                 // 5-bit input: INMODE control
      .OPMODE(OP_MODE),                 // 9-bit input: Operation mode
      // Data inputs: Data Ports
      .A(a_int),                           // 30-bit input: A data
      .B(b_int),                           // 18-bit input: B data
      .C(c_int),                           // 48-bit input: C data
      .CARRYIN(carry_in_del),               // 1-bit input: Carry-in
      .D(d_int),                           // 27-bit input: D data
      // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
      .CEA1(cea1),                     // 1-bit input: Clock enable for 1st stage AREG
      .CEA2(cea2),                     // 1-bit input: Clock enable for 2nd stage AREG
      .CEAD(cead),                     // 1-bit input: Clock enable for ADREG
      .CEALUMODE(cealumode),           // 1-bit input: Clock enable for ALUMODE
      .CEB1(ceb1),                     // 1-bit input: Clock enable for 1st stage BREG
      .CEB2(ceb2),                     // 1-bit input: Clock enable for 2nd stage BREG
      .CEC(cec),                       // 1-bit input: Clock enable for CREG
      .CECARRYIN(cecarryin),           // 1-bit input: Clock enable for CARRYINREG
      .CECTRL(cectrl),                 // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
      .CED(ced),                       // 1-bit input: Clock enable for DREG
      .CEINMODE(ceinmode),             // 1-bit input: Clock enable for INMODEREG
      .CEM(cem),                       // 1-bit input: Clock enable for MREG
      .CEP(cep),                       // 1-bit input: Clock enable for PREG
      .RSTA(1'b0),                     // 1-bit input: Reset for AREG
      .RSTALLCARRYIN(1'b0),   // 1-bit input: Reset for CARRYINREG
      .RSTALUMODE(1'b0),         // 1-bit input: Reset for ALUMODEREG
      .RSTB(1'b0),                     // 1-bit input: Reset for BREG
      .RSTC(1'b0),                     // 1-bit input: Reset for CREG
      .RSTCTRL(1'b0),               // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
      .RSTD(1'b0),                     // 1-bit input: Reset for DREG and ADREG
      .RSTINMODE(1'b0),           // 1-bit input: Reset for INMODEREG
      .RSTM(1'b0),                     // 1-bit input: Reset for MREG
      .RSTP(1'b0)                      // 1-bit input: Reset for PREG
   );

   // End of DSP48E2_inst instantiation

endmodule

