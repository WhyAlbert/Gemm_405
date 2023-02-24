// Generator : SpinalHDL v1.7.2    git head : 08fc866bebdc40c471ebe327bface63e34406489
// Component : channelAdd
// Git hash  : 12218cf40311e993d7fed1bbe77f3edc74090f8b
// Date      : 14/02/2023, 17:53:01

`timescale 1ns/1ps

module channelAdd (
  input               ChannelAddData_Valid,
  input      [31:0]   dataIn,
  input               init,
  output     [31:0]   dataOut_0,
  output     [31:0]   dataOut_1,
  output     [31:0]   dataOut_2,
  output     [31:0]   dataOut_3,
  output     [31:0]   dataOut_4,
  output     [31:0]   dataOut_5,
  output     [31:0]   dataOut_6,
  output     [31:0]   dataOut_7,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz__zz_result_tmp_0;
  reg        [2:0]    counter;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_0;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_1;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_2;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_3;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_4;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_5;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_6;
  (* use_dsp = "yes" *) reg        [31:0]   result_tmp_7;
  wire                when_channelAdd_l25;
  (* use_dsp = "yes" *) wire       [31:0]   _zz_result_tmp_0;
  wire       [7:0]    _zz_1;
  wire       [31:0]   _zz_result_tmp_0_1;

  always @(*) begin
    case(counter)
      3'b000 : _zz__zz_result_tmp_0 = result_tmp_0;
      3'b001 : _zz__zz_result_tmp_0 = result_tmp_1;
      3'b010 : _zz__zz_result_tmp_0 = result_tmp_2;
      3'b011 : _zz__zz_result_tmp_0 = result_tmp_3;
      3'b100 : _zz__zz_result_tmp_0 = result_tmp_4;
      3'b101 : _zz__zz_result_tmp_0 = result_tmp_5;
      3'b110 : _zz__zz_result_tmp_0 = result_tmp_6;
      default : _zz__zz_result_tmp_0 = result_tmp_7;
    endcase
  end

  assign when_channelAdd_l25 = (counter == 3'b111);
  assign _zz_result_tmp_0 = _zz__zz_result_tmp_0;
  assign _zz_1 = ({7'd0,1'b1} <<< counter);
  assign _zz_result_tmp_0_1 = (_zz_result_tmp_0 + dataIn);
  assign dataOut_0 = result_tmp_0;
  assign dataOut_1 = result_tmp_1;
  assign dataOut_2 = result_tmp_2;
  assign dataOut_3 = result_tmp_3;
  assign dataOut_4 = result_tmp_4;
  assign dataOut_5 = result_tmp_5;
  assign dataOut_6 = result_tmp_6;
  assign dataOut_7 = result_tmp_7;
  always @(posedge clk) begin
    if(reset) begin
      counter <= 3'b000;
      result_tmp_0 <= 32'h0;
      result_tmp_1 <= 32'h0;
      result_tmp_2 <= 32'h0;
      result_tmp_3 <= 32'h0;
      result_tmp_4 <= 32'h0;
      result_tmp_5 <= 32'h0;
      result_tmp_6 <= 32'h0;
      result_tmp_7 <= 32'h0;
    end else begin
      if(ChannelAddData_Valid) begin
        if(when_channelAdd_l25) begin
          counter <= 3'b000;
        end else begin
          counter <= (counter + 3'b001);
        end
        if(_zz_1[0]) begin
          result_tmp_0 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[1]) begin
          result_tmp_1 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[2]) begin
          result_tmp_2 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[3]) begin
          result_tmp_3 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[4]) begin
          result_tmp_4 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[5]) begin
          result_tmp_5 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[6]) begin
          result_tmp_6 <= _zz_result_tmp_0_1;
        end
        if(_zz_1[7]) begin
          result_tmp_7 <= _zz_result_tmp_0_1;
        end
      end
      if(init) begin
        result_tmp_0 <= 32'h0;
        result_tmp_1 <= 32'h0;
        result_tmp_2 <= 32'h0;
        result_tmp_3 <= 32'h0;
        result_tmp_4 <= 32'h0;
        result_tmp_5 <= 32'h0;
        result_tmp_6 <= 32'h0;
        result_tmp_7 <= 32'h0;
      end
    end
  end


endmodule
