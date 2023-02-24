// Generator : SpinalHDL v1.7.2    git head : 08fc866bebdc40c471ebe327bface63e34406489
// Component : PE
// Git hash  : 5e2f1eaabb24a7e970e29fb21b0730eca75ac8a1
// Date      : 15/02/2023, 16:44:36

`timescale 1ns/1ps

module PE (
  input               weight_CE,
  input               feature_CE,
  input      [7:0]    weight_0,
  input      [7:0]    weight_1,
  input      [7:0]    weight_2,
  input      [7:0]    weight_3,
  input      [7:0]    weight_4,
  input      [7:0]    weight_5,
  input      [7:0]    weight_6,
  input      [7:0]    weight_7,
  input      [7:0]    weight_8,
  input      [7:0]    feature,
  output reg [7:0]    feature_out,
  output reg [31:0]   result,
  output              computeDone,
  output              weightDone,
  input               clk,
  input               reset
);

  wire       [7:0]    peMul_1_b;
  wire       [31:0]   peMul_1_p;
  wire       [31:0]   peAdd_1_s;
  reg        [7:0]    _zz_b;
  reg        [7:0]    weight_reg_0;
  reg        [7:0]    weight_reg_1;
  reg        [7:0]    weight_reg_2;
  reg        [7:0]    weight_reg_3;
  reg        [7:0]    weight_reg_4;
  reg        [7:0]    weight_reg_5;
  reg        [7:0]    weight_reg_6;
  reg        [7:0]    weight_reg_7;
  reg        [7:0]    weight_reg_8;
  reg        [3:0]    counter;
  reg                 computeDoneTmp;
  wire       [31:0]   mulOut;
  reg        [31:0]   addBin;
  wire                addBClear;
  wire       [31:0]   addOut;
  wire                when_PE_l48;
  reg                 computeDoneTmp_delay_1;
  reg                 computeDoneTmp_delay_2;
  reg                 computeDoneTmp_delay_3;
  reg                 computeDoneTmp_delay_4;
  reg                 computeDoneTmp_delay_1_1;
  reg                 computeDoneTmp_delay_2_1;
  reg                 computeDoneTmp_delay_3_1;

  PEmul peMul_1 (
    .a   (feature[7:0]   ), //i
    .b   (peMul_1_b[7:0] ), //i
    .p   (peMul_1_p[31:0]), //o
    .CLK (clk            )  //i
  );
  PEadd peAdd_1 (
    .a   (mulOut[31:0]   ), //i
    .b   (addBin[31:0]   ), //i
    .s   (peAdd_1_s[31:0]), //o
    .CLK (clk            )  //i
  );
  always @(*) begin
    case(counter)
      4'b0000 : _zz_b = weight_reg_0;
      4'b0001 : _zz_b = weight_reg_1;
      4'b0010 : _zz_b = weight_reg_2;
      4'b0011 : _zz_b = weight_reg_3;
      4'b0100 : _zz_b = weight_reg_4;
      4'b0101 : _zz_b = weight_reg_5;
      4'b0110 : _zz_b = weight_reg_6;
      4'b0111 : _zz_b = weight_reg_7;
      default : _zz_b = weight_reg_8;
    endcase
  end

  assign when_PE_l48 = (counter == 4'b1000);
  always @(*) begin
    if(addBClear) begin
      addBin = 32'h0;
    end else begin
      addBin = addOut;
    end
  end

  assign weightDone = ((counter == 4'b1000) ? 1'b1 : 1'b0);
  assign computeDone = computeDoneTmp_delay_4;
  assign addBClear = computeDoneTmp_delay_3_1;
  assign peMul_1_b = _zz_b;
  assign mulOut = peMul_1_p;
  assign addOut = peAdd_1_s;
  always @(posedge clk) begin
    if(reset) begin
      feature_out <= 8'h0;
      result <= 32'h0;
      weight_reg_0 <= 8'h0;
      weight_reg_1 <= 8'h0;
      weight_reg_2 <= 8'h0;
      weight_reg_3 <= 8'h0;
      weight_reg_4 <= 8'h0;
      weight_reg_5 <= 8'h0;
      weight_reg_6 <= 8'h0;
      weight_reg_7 <= 8'h0;
      weight_reg_8 <= 8'h0;
      counter <= 4'b0000;
      computeDoneTmp <= 1'b0;
    end else begin
      if(weight_CE) begin
        weight_reg_0 <= weight_0;
        weight_reg_1 <= weight_1;
        weight_reg_2 <= weight_2;
        weight_reg_3 <= weight_3;
        weight_reg_4 <= weight_4;
        weight_reg_5 <= weight_5;
        weight_reg_6 <= weight_6;
        weight_reg_7 <= weight_7;
        weight_reg_8 <= weight_8;
      end
      if(feature_CE) begin
        if(when_PE_l48) begin
          counter <= 4'b0000;
          computeDoneTmp <= 1'b1;
        end else begin
          counter <= (counter + 4'b0001);
          computeDoneTmp <= 1'b0;
        end
      end
      result <= addOut;
      feature_out <= feature;
    end
  end

  always @(posedge clk) begin
    computeDoneTmp_delay_1 <= computeDoneTmp;
    computeDoneTmp_delay_2 <= computeDoneTmp_delay_1;
    computeDoneTmp_delay_3 <= computeDoneTmp_delay_2;
    computeDoneTmp_delay_4 <= computeDoneTmp_delay_3;
    computeDoneTmp_delay_1_1 <= computeDoneTmp;
    computeDoneTmp_delay_2_1 <= computeDoneTmp_delay_1_1;
    computeDoneTmp_delay_3_1 <= computeDoneTmp_delay_2_1;
  end


endmodule

module PEmul (
              input             [7:0] a       ,  //feature
              input             [7:0] b       ,  //weight
              output           [31:0] p      ,
              input             CLK
          );

          wire signed       [7:0]   bin;
          assign bin = $signed(b);

          
          PEMul PEMul_inst (
            .CLK(CLK),  // input wire CLK
            .A(a),      // input wire [7 : 0] A
            .B(bin),      // input wire [7 : 0] B
            .P(p)      // output wire [31 : 0] P
          );

endmodule
      

module PEadd (
              input             [31:0] a       ,
              input             [31:0] b       ,
              output           [31:0] s      ,
              input             CLK
          );

            wire  signed       [31:0]   ain,bin;
            assign ain = $signed(a);
            assign bin = $signed(b);


          
          PEAdd PEAdd_inst (
            .CLK(CLK),  // input wire CLK
            .A(ain),      // input wire [31 : 0] A
            .B(bin),      // input wire [31 : 0] B
            .S(s)      // output wire [31 : 0] P
          );

endmodule
      
