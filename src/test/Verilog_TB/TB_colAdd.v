`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2023 11:13:16 AM
// Design Name: 
// Module Name: TB_colAdd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_colAdd( );

reg clk,reset;
reg [31:0]result_col_0,result_col_1,result_col_2,result_col_3,result_col_4,result_col_5,result_col_6,result_col_7;
reg startAdd;
wire [31:0]colAddResult;
wire colAddResult_Valid;



always #5 clk = ~clk;
initial begin
    clk = 1'b1;
    reset = 1'b1;

    #20 reset = 1'b0;
end

columnAdd columnAdd_ins(
.result_col_0           (result_col_0),
.result_col_1           (result_col_1),
.result_col_2           (result_col_2),
.result_col_3           (result_col_3),
.result_col_4           (result_col_4),
.result_col_5           (result_col_5),
.result_col_6           (result_col_6),
.result_col_7           (result_col_7),
.startAdd               (startAdd),
.colAddResult           (colAddResult),
.colAddResult_Valid     (colAddResult_Valid),
.clk                    (clk),
.reset                  (reset)
);


initial begin
    #0
    startAdd <= 1'b0;
    
    #20
    startAdd <= 1'b1;           //第一列
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;
    
    #10                         //two col
    startAdd <= 1'b0;
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    #10                         //3
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //4
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;
    
    #10                         //5
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //6
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    #10                         //7
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //8
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    #30                         //连续启动
    startAdd <= 1'b1;           //第一列
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;
    
    #10                         //two col
    startAdd <= 1'b0;
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    #10                         //3
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //4
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;
    
    #10                         //5
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //6
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    #10                         //7
    result_col_0 <= 32'd1;  
    result_col_1 <= 32'd2;
    result_col_2 <= 32'd3;
    result_col_3 <= 32'd4;
    result_col_4 <= 32'd5;
    result_col_5 <= 32'd6;
    result_col_6 <= 32'd7;
    result_col_7 <= 32'd8;

    #10                         //8
    result_col_0 <= -32'sd1;  
    result_col_1 <= -32'sd2;
    result_col_2 <= -32'sd3;
    result_col_3 <= -32'sd4;
    result_col_4 <= -32'sd5;
    result_col_5 <= -32'sd6;
    result_col_6 <= -32'sd7;
    result_col_7 <= -32'sd8;

    


    #100
    $finish;
end


endmodule
