module TB_channelAdd();
reg clk;
reg reset;
reg init,ChannelAddData_Valid;
reg [31:0] dataIn;

wire [31:0] dataOut_0,dataOut_1,dataOut_2,dataOut_3,dataOut_4,dataOut_5,dataOut_6,dataOut_7;

channelAdd channelAdd_ins(
.ChannelAddData_Valid       (ChannelAddData_Valid),                                                  
.dataIn                     (dataIn),
.init                       (init),
.dataOut_0                  (dataOut_0),
.dataOut_1                  (dataOut_1),
.dataOut_2                  (dataOut_2),
.dataOut_3                  (dataOut_3),
.dataOut_4                  (dataOut_4),
.dataOut_5                  (dataOut_5),
.dataOut_6                  (dataOut_6),
.dataOut_7                  (dataOut_7),
.clk                        (clk),
.reset                      (reset)
);

always #5 clk = ~clk;
initial begin
    clk = 1'b1;
    reset = 1'b1;
    init <= 1'b0;

    #20 reset = 1'b0;
end

initial begin
    #20
    ChannelAddData_Valid <= 1'b1;
    dataIn <= 32'd1;
    #10
    dataIn <= 32'd2;
    #10
    dataIn <= 32'd3;
    #10
    dataIn <= 32'd4;
    #10
    dataIn <= 32'd5;
    #10
    dataIn <= 32'd6;
    #10
    dataIn <= 32'd7;
    #10
    dataIn <= 32'd8;

    //中间不停 持续累加

    #10
    init <= 1'b0;
    ChannelAddData_Valid <= 1'b1;
    dataIn <= -32'sd1;
    #10
    dataIn <= -32'sd2;
    #10
    dataIn <= -32'sd3;
    #10
    dataIn <= -32'sd4;
    #10
    dataIn <= -32'sd5;
    #10
    dataIn <= -32'sd6;
    #10
    dataIn <= -32'sd7;
    #10
    dataIn <= -32'sd8;
    #10
    ChannelAddData_Valid <= 1'b0;
    init <= 1'b1;   
    #100
    $finish;
end


endmodule