module PE_tb();
reg clk;
reg reset;
reg weight_CE;
reg feature_CE;
reg [7:0] weight_0;
reg [7:0] weight_1;
reg [7:0] weight_2;
reg [7:0] weight_3;
reg [7:0] weight_4;
reg [7:0] weight_5;
reg [7:0] weight_6;
reg [7:0] weight_7;
reg [7:0] weight_8;
reg [7:0]		 feature;
wire [7:0]		 feature_cas;
wire [31:0]		 result;
wire computeDone;
wire weightDone;

PE PE_ins(
  .clk(clk),
  .reset(reset),
  .weight_CE(weight_CE),
  .feature_CE(feature_CE),
  .weight_0(weight_0),
  .weight_1(weight_1),
  .weight_2(weight_2),
  .weight_3(weight_3),
  .weight_4(weight_4),
  .weight_5(weight_5),
  .weight_6(weight_6),
  .weight_7(weight_7),
  .weight_8(weight_8),
  .feature(feature),
  .feature_out(feature_cas),
  .result(result),
  .computeDone(computeDone),
  .weightDone(weightDone)
);

always #5 clk = ~clk;
initial begin
    clk = 1'b1;
    reset = 1'b1;

    #20 reset = 1'b0;
end


initial begin
	weight_CE<= 1'b0;
	feature_CE<= 1'b0;
	feature<= 8'd0;
	weight_0<= 8'd0;
	weight_1<= 8'd0;
	weight_2<= 8'd0;
	weight_3<= 8'd0;
	weight_4<= 8'd0;
	weight_5<= 8'd0;
	weight_6<= 8'd0;
	weight_7<= 8'd0;
	weight_8<= 8'd0;


	#20
	weight_CE<= 1'b1;
	weight_0<= 8'd1;
	weight_1<= 8'd2;
	weight_2<= 8'd3;
	weight_3<= 8'd4;
	weight_4<= 8'd5;
	weight_5<= 8'd6;
	weight_6<= 8'd7;
	weight_7<= 8'd8;
	weight_8<= 8'd9;

	#10
	weight_CE<= 1'b0;
	weight_0<= 8'd0;
	weight_1<= 8'd0;
	weight_2<= 8'd0;
	weight_3<= 8'd0;
	weight_4<= 8'd0;
	weight_5<= 8'd0;
	weight_6<= 8'd0;
	weight_7<= 8'd0;
	weight_8<= 8'd0;
	feature_CE<= 1'b1;
	feature<= 8'd1;
//	feature<= 8'b11111111;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd2;
//    feature<= 8'b10000000;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd3;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd4;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd5;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd6;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd7;
	
	#10
	feature_CE<= 1'b1;
	feature<= 8'd8;

	wait(weightDone)begin
		feature_CE<= 1'b1;
		feature<= 8'd9;
		
	   	weight_CE<= 1'b1;
		weight_0<= -8'sd1;
		weight_1<= -8'sd2;
		weight_2<= -8'sd3;
		weight_3<= -8'sd4;
		weight_4<= -8'sd5;
		weight_5<= -8'sd6;
		weight_6<= -8'sd7;
		weight_7<= -8'sd8;
		weight_8<= -8'sd9;

	end

	#10
	weight_CE<= 1'b0;
	weight_0<= 8'd0;
	weight_1<= 8'd0;
	weight_2<= 8'd0;
	weight_3<= 8'd0;
	weight_4<= 8'd0;
	weight_5<= 8'd0;
	weight_6<= 8'd0;
	weight_7<= 8'd0;
	weight_8<= 8'd0;

	feature_CE<= 1'b1;
	feature<= 8'd1;

	#10
	feature_CE<= 1'b1;
	feature<= 8'd2;
//    feature<= 8'b10000000;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd3;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd4;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd5;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd6;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd7;
	#10
	feature_CE<= 1'b1;
	feature<= 8'd8;

	#0
	wait(weightDone)begin
	   	weight_CE<= 1'b1;
		weight_0<= 8'd1;
		weight_1<= 8'd2;
		weight_2<= 8'd3;
		weight_3<= 8'd4;
		weight_4<= 8'd5;
		weight_5<= 8'd6;
		weight_6<= 8'd7;
		weight_7<= 8'd8;
		weight_8<= 8'd9;

		feature_CE<= 1'b1;
		feature<= 8'd9;
	end
	#10
	weight_CE<= 1'b0;


	#100
	$finish;
end

endmodule