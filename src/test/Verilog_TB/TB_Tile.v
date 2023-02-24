`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2023 03:40:22 PM
// Design Name: 
// Module Name: TB_Tile
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


module TB_Tile();
reg clk;
reg reset;
reg Weight_CE,Feature_CE;
reg [63:0] TB_Feature;
wire firstColWeightChange;
reg [575:0]  TB_weight;

Tile Tile_ins(
.Weight_CE                  (Weight_CE),
.Feature_CE                 (Feature_CE),
.firstColWeightChange       (firstColWeightChange),
.TB_weight                  (TB_weight),
.TB_Feature_Array           (TB_Feature),
.clk                        (clk),
.reset                      (reset)
); 

always #5 clk = ~clk;
initial begin
    clk = 1'b1;
    reset = 1'b1;

    #20 reset = 1'b0;
end

initial begin
    #0
    Weight_CE <= 1'b0;
    Feature_CE <= 1'b0;
	TB_Feature<= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};	//Feature_rst

    #20
    Weight_CE <=  1'b1;
	TB_weight <=  {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column1
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	
	//进图像的9个点
	#10
	Weight_CE<= 1'b0;
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column2
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};	//input in column
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column3
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2};
	
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column4
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column5
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column6
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column7
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column8
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7};
	#10
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8};

	wait(firstColWeightChange) begin
	  	Feature_CE<= 1'b1;
		TB_Feature<= {8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9};
		
		Weight_CE<= 1'b1;
		TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column1
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	end
	
	//连续启动测试
	
	//进图像的9个点
	#10
	Weight_CE<= 1'b0;
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column2
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};	//input in column
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column3
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2};
	
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column4
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column5
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column6
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column7
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column8
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7};
	#10
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8};

	wait(firstColWeightChange) begin
	  	Feature_CE<= 1'b1;
		TB_Feature<= {8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9};
		
		Weight_CE<= 1'b1;
		TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column1
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	end

	#10
	Weight_CE<= 1'b0;
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column2
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};	//input in column
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column3
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2,8'd2};
	
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column4
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3,8'd3};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column5
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4,8'd4};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column6
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5,8'd5};
	#10
	TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column7
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
	8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6,8'd6};
	#10
	TB_weight<= {-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,    //一列的9个点，column8
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1,
	-8'sd9,-8'sd8,-8'sd7,-8'sd6,-8'sd5,-8'sd4,-8'sd3,-8'sd2,-8'sd1};
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7,8'd7};
	#10
	Feature_CE<= 1'b1;
	TB_Feature<= {8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8,8'd8};

	wait(firstColWeightChange) begin
	  	Feature_CE<= 1'b1;
		TB_Feature<= {8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9,8'd9};
		
		Weight_CE<= 1'b1;
		TB_weight<= {8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,    //一列的9个点，column1
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1,
		8'd9,8'd8,8'd7,8'd6,8'd5,8'd4,8'd3,8'd2,8'd1};
	end
	#10
	Weight_CE<= 1'b0;


	#200

    $finish;
    

end

    
endmodule
