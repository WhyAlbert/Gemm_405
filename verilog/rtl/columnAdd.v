// Generator : SpinalHDL v1.7.0    git head : eca519e78d4e6022e34911ec300a432ed9db8220
// Component : columnAdd
// Date      : 11/02/2023, 16:35:26

`timescale 1ns/1ps

module columnAdd (
  input      [31:0]   result_col_0,
  input      [31:0]   result_col_1,
  input      [31:0]   result_col_2,
  input      [31:0]   result_col_3,
  input      [31:0]   result_col_4,
  input      [31:0]   result_col_5,
  input      [31:0]   result_col_6,
  input      [31:0]   result_col_7,
  input               startAdd,
  output reg [31:0]   colAddResult,
  output              colAddResult_Valid,
  input               clk,
  input               reset
);

  wire       [31:0]   add_1_s;
  wire       [31:0]   add_2_s;
  wire       [31:0]   add_3_s;
  wire       [31:0]   add_4_s;
  wire       [31:0]   add_5_s;
  wire       [31:0]   add_6_s;
  wire       [31:0]   add_7_s;
  reg        [4:0]    counter;
  reg        [7:0]    result_valid;
  wire                when_columnAdd_l41;
  wire                when_columnAdd_l42;

  Add add_1 (
    .a   (result_col_0[31:0]), //i
    .b   (result_col_1[31:0]), //i
    .s   (add_1_s[31:0]     ), //o
    .CLK (clk               )  //i
  );
  Add add_2 (
    .a   (result_col_2[31:0]), //i
    .b   (result_col_3[31:0]), //i
    .s   (add_2_s[31:0]     ), //o
    .CLK (clk               )  //i
  );
  Add add_3 (
    .a   (result_col_4[31:0]), //i
    .b   (result_col_5[31:0]), //i
    .s   (add_3_s[31:0]     ), //o
    .CLK (clk               )  //i
  );
  Add add_4 (
    .a   (result_col_6[31:0]), //i
    .b   (result_col_7[31:0]), //i
    .s   (add_4_s[31:0]     ), //o
    .CLK (clk               )  //i
  );
  Add add_5 (
    .a   (add_1_s[31:0]), //i
    .b   (add_2_s[31:0]), //i
    .s   (add_5_s[31:0]), //o
    .CLK (clk          )  //i
  );
  Add add_6 (
    .a   (add_3_s[31:0]), //i
    .b   (add_4_s[31:0]), //i
    .s   (add_6_s[31:0]), //o
    .CLK (clk          )  //i
  );
  Add add_7 (
    .a   (add_5_s[31:0]), //i
    .b   (add_6_s[31:0]), //i
    .s   (add_7_s[31:0]), //o
    .CLK (clk          )  //i
  );
  assign colAddResult_Valid = (^result_valid);
  assign when_columnAdd_l41 = (startAdd || (5'h0 < counter));
  assign when_columnAdd_l42 = (counter == 5'h06);
  always @(posedge clk) begin
    if(reset) begin
      colAddResult <= 32'h0;
      counter <= 5'h0;
      result_valid <= 8'h0;
    end else begin
      result_valid <= (result_valid <<< 1);
      if(when_columnAdd_l41) begin
        if(when_columnAdd_l42) begin
          result_valid[0] <= 1'b1;
          counter <= 5'h0;
        end else begin
          result_valid[0] <= 1'b0;
          counter <= (counter + 5'h01);
        end
      end else begin
        result_valid[0] <= 1'b0;
        counter <= 5'h0;
      end
      colAddResult <= add_7_s;
    end
  end


endmodule

module Add (
              input             [31:0] a       ,
              input             [31:0] b       ,
              output           [31:0] s      ,
              input             CLK
          );

          
          colAdd colAdd_inst (
            .CLK(CLK),  // input wire CLK
            .A(a),      // input wire [31 : 0] A
            .B(b),      // input wire [31 : 0] B
            .S(s)      // output wire [31 : 0] P
          );

endmodule
      
