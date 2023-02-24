// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : Padding
// Git hash  : bf6b72c5c8e76ae268422a73fd24319daa8c3c97

`timescale 1ns/1ps

module Padding (
  input               sData_valid,
  output              sData_ready,
  input      [63:0]   sData_payload,
  output              mData_valid,
  input               mData_ready,
  output     [63:0]   mData_payload,
  input               enPadding,
  input      [9:0]    channelIn,
  input               start,
  input      [9:0]    rowNumIn,
  output reg [9:0]    rowNumOut,
  input      [9:0]    colNumIn,
  output reg [9:0]    colNumOut,
  input      [7:0]    zeroDara,
  input      [0:0]    zeroNum,
  output reg          last,
  input               clk,
  input               reset
);
  localparam PaddingEnum_IDLE = 7'd1;
  localparam PaddingEnum_INIT = 7'd2;
  localparam PaddingEnum_UPDOWN = 7'd4;
  localparam PaddingEnum_LEFT = 7'd8;
  localparam PaddingEnum_CENTER = 7'd16;
  localparam PaddingEnum_RIGHT = 7'd32;
  localparam PaddingEnum_END_1 = 7'd64;

  reg                 fifo_push_valid;
  reg        [63:0]   fifo_push_payload;
  wire                fifo_push_ready;
  wire                fifo_pop_valid;
  wire       [63:0]   fifo_pop_payload;
  wire       [2:0]    fifo_occupancy;
  wire       [2:0]    fifo_availability;
  wire                fifo_almost_full;
  wire       [9:0]    _zz_rowNumOut;
  wire       [1:0]    _zz_rowNumOut_1;
  wire       [9:0]    _zz_colNumOut;
  wire       [1:0]    _zz_colNumOut_1;
  wire       [9:0]    _zz_when_WaCounter_l13_1;
  wire       [6:0]    _zz_when_WaCounter_l13_1_1;
  wire       [9:0]    _zz_when_WaCounter_l13_2;
  wire       [9:0]    _zz_when_WaCounter_l13_3;
  wire       [9:0]    _zz_when_Padding_l144_1;
  wire       [0:0]    _zz_when_Padding_l144_1_1;
  wire       [9:0]    _zz_when_Padding_l144_2;
  wire       [9:0]    _zz_when_Padding_l144_3;
  wire       [9:0]    _zz_when_Padding_l144_4;
  wire       [9:0]    _zz_when_Padding_l144_4_1;
  wire       [9:0]    _zz_when_Padding_l144_4_2;
  wire       [9:0]    _zz_when_Padding_l144_5;
  wire       [9:0]    _zz_when_Padding_l144_5_1;
  wire       [9:0]    _zz_when_Padding_l144_5_2;
  wire       [9:0]    _zz_when_Padding_l144_6;
  wire       [9:0]    _zz_when_Padding_l144_6_1;
  wire       [9:0]    _zz_when_Padding_l144_6_2;
  wire       [9:0]    _zz_when_Padding_l144_6_3;
  reg        [6:0]    channelTimes;
  wire                fsm_initEnd;
  reg                 fsm_leftEnd;
  reg                 fsm_rightEnd;
  reg                 fsm_upDownEnd;
  reg                 fsm_centerEnd;
  reg                 fsm_endEnd;
  wire                fsm_enPadding;
  reg                 fsm_enUpDown;
  reg        [6:0]    fsm_currentState;
  reg        [6:0]    fsm_nextState;
  reg                 initEn;
  wire                when_Padding_l151;
  wire                when_Padding_l151_1;
  reg        [4:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l13;
  wire                when_Padding_l153;
  reg                 zeroValid;
  wire                when_Padding_l160;
  wire       [7:0]    _zz_push_payload;
  wire                fifo_push_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l13_1;
  wire                when_Padding_l169;
  wire                fifo_push_fire_1;
  wire                when_WaCounter_l18;
  reg        [9:0]    colCnt_count;
  reg                 colCnt_valid;
  wire                when_WaCounter_l13_2;
  wire                when_Padding_l173;
  wire                when_WaCounter_l18_1;
  reg        [9:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l13_3;
  wire                when_Padding_l177;
  wire                when_Padding_l144;
  wire                fifo_push_fire_2;
  wire                when_Padding_l144_1;
  wire                fifo_push_fire_3;
  wire                when_Padding_l144_2;
  wire                when_Padding_l144_3;
  wire                fifo_push_fire_4;
  wire                when_Padding_l144_4;
  wire                fifo_push_fire_5;
  wire                when_Padding_l144_5;
  wire                when_Padding_l144_6;
  wire                when_Padding_l144_7;
  `ifndef SYNTHESIS
  reg [47:0] fsm_currentState_string;
  reg [47:0] fsm_nextState_string;
  `endif


  assign _zz_rowNumOut_1 = ({1'd0,zeroNum} <<< 1);
  assign _zz_rowNumOut = {8'd0, _zz_rowNumOut_1};
  assign _zz_colNumOut_1 = ({1'd0,zeroNum} <<< 1);
  assign _zz_colNumOut = {8'd0, _zz_colNumOut_1};
  assign _zz_when_WaCounter_l13_1_1 = (channelTimes - 7'h01);
  assign _zz_when_WaCounter_l13_1 = {3'd0, _zz_when_WaCounter_l13_1_1};
  assign _zz_when_WaCounter_l13_2 = (colNumOut - 10'h001);
  assign _zz_when_WaCounter_l13_3 = (rowNumOut - 10'h001);
  assign _zz_when_Padding_l144_1_1 = (zeroNum - 1'b1);
  assign _zz_when_Padding_l144_1 = {9'd0, _zz_when_Padding_l144_1_1};
  assign _zz_when_Padding_l144_2 = (colNumOut - 10'h001);
  assign _zz_when_Padding_l144_3 = (rowNumOut - 10'h001);
  assign _zz_when_Padding_l144_4 = (_zz_when_Padding_l144_4_1 - 10'h001);
  assign _zz_when_Padding_l144_4_1 = (colNumOut - _zz_when_Padding_l144_4_2);
  assign _zz_when_Padding_l144_4_2 = {9'd0, zeroNum};
  assign _zz_when_Padding_l144_5 = (_zz_when_Padding_l144_5_1 - 10'h001);
  assign _zz_when_Padding_l144_5_1 = (colNumOut - _zz_when_Padding_l144_5_2);
  assign _zz_when_Padding_l144_5_2 = {9'd0, zeroNum};
  assign _zz_when_Padding_l144_6 = {9'd0, zeroNum};
  assign _zz_when_Padding_l144_6_1 = (_zz_when_Padding_l144_6_2 - 10'h001);
  assign _zz_when_Padding_l144_6_2 = (rowNumOut - _zz_when_Padding_l144_6_3);
  assign _zz_when_Padding_l144_6_3 = {9'd0, zeroNum};
  WaStreamFifo fifo (
    .push_valid   (fifo_push_valid        ), //i
    .push_ready   (fifo_push_ready        ), //o
    .push_payload (fifo_push_payload[63:0]), //i
    .pop_valid    (fifo_pop_valid         ), //o
    .pop_ready    (mData_ready            ), //i
    .pop_payload  (fifo_pop_payload[63:0] ), //o
    .flush        (1'b0                   ), //i
    .occupancy    (fifo_occupancy[2:0]    ), //o
    .availability (fifo_availability[2:0] ), //o
    .almost_full  (fifo_almost_full       ), //o
    .clk          (clk                    ), //i
    .reset        (reset                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      PaddingEnum_IDLE : fsm_currentState_string = "IDLE  ";
      PaddingEnum_INIT : fsm_currentState_string = "INIT  ";
      PaddingEnum_UPDOWN : fsm_currentState_string = "UPDOWN";
      PaddingEnum_LEFT : fsm_currentState_string = "LEFT  ";
      PaddingEnum_CENTER : fsm_currentState_string = "CENTER";
      PaddingEnum_RIGHT : fsm_currentState_string = "RIGHT ";
      PaddingEnum_END_1 : fsm_currentState_string = "END_1 ";
      default : fsm_currentState_string = "??????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      PaddingEnum_IDLE : fsm_nextState_string = "IDLE  ";
      PaddingEnum_INIT : fsm_nextState_string = "INIT  ";
      PaddingEnum_UPDOWN : fsm_nextState_string = "UPDOWN";
      PaddingEnum_LEFT : fsm_nextState_string = "LEFT  ";
      PaddingEnum_CENTER : fsm_nextState_string = "CENTER";
      PaddingEnum_RIGHT : fsm_nextState_string = "RIGHT ";
      PaddingEnum_END_1 : fsm_nextState_string = "END_1 ";
      default : fsm_nextState_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    if(enPadding) begin
      rowNumOut = (_zz_rowNumOut + rowNumIn);
    end else begin
      rowNumOut = rowNumIn;
    end
  end

  always @(*) begin
    if(enPadding) begin
      colNumOut = (_zz_colNumOut + colNumIn);
    end else begin
      colNumOut = colNumIn;
    end
  end

  assign mData_valid = fifo_pop_valid;
  assign mData_payload = fifo_pop_payload;
  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & PaddingEnum_IDLE) == PaddingEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = PaddingEnum_INIT;
        end else begin
          fsm_nextState = PaddingEnum_IDLE;
        end
      end
      (((fsm_currentState) & PaddingEnum_INIT) == PaddingEnum_INIT) : begin
        if(fsm_initEnd) begin
          if(fsm_enPadding) begin
            fsm_nextState = PaddingEnum_LEFT;
          end else begin
            fsm_nextState = PaddingEnum_CENTER;
          end
        end else begin
          fsm_nextState = PaddingEnum_INIT;
        end
      end
      (((fsm_currentState) & PaddingEnum_UPDOWN) == PaddingEnum_UPDOWN) : begin
        if(fsm_upDownEnd) begin
          fsm_nextState = PaddingEnum_RIGHT;
        end else begin
          fsm_nextState = PaddingEnum_UPDOWN;
        end
      end
      (((fsm_currentState) & PaddingEnum_LEFT) == PaddingEnum_LEFT) : begin
        if(fsm_leftEnd) begin
          if(fsm_enUpDown) begin
            fsm_nextState = PaddingEnum_UPDOWN;
          end else begin
            fsm_nextState = PaddingEnum_CENTER;
          end
        end else begin
          fsm_nextState = PaddingEnum_LEFT;
        end
      end
      (((fsm_currentState) & PaddingEnum_CENTER) == PaddingEnum_CENTER) : begin
        if(fsm_centerEnd) begin
          if(fsm_enPadding) begin
            fsm_nextState = PaddingEnum_RIGHT;
          end else begin
            fsm_nextState = PaddingEnum_END_1;
          end
        end else begin
          fsm_nextState = PaddingEnum_CENTER;
        end
      end
      (((fsm_currentState) & PaddingEnum_RIGHT) == PaddingEnum_RIGHT) : begin
        if(fsm_rightEnd) begin
          fsm_nextState = PaddingEnum_END_1;
        end else begin
          fsm_nextState = PaddingEnum_RIGHT;
        end
      end
      default : begin
        if(fsm_endEnd) begin
          fsm_nextState = PaddingEnum_IDLE;
        end else begin
          if(fsm_enPadding) begin
            fsm_nextState = PaddingEnum_LEFT;
          end else begin
            fsm_nextState = PaddingEnum_CENTER;
          end
        end
      end
    endcase
  end

  assign fsm_enPadding = enPadding;
  assign sData_ready = (fifo_push_ready && ((fsm_currentState & PaddingEnum_CENTER) != 7'b0000000));
  assign when_Padding_l151 = ((fsm_currentState & PaddingEnum_INIT) != 7'b0000000);
  assign when_Padding_l151_1 = ((fsm_nextState & PaddingEnum_INIT) == 7'b0000000);
  assign when_WaCounter_l13 = (initCount_count == 5'h08);
  always @(*) begin
    if(when_WaCounter_l13) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
    if(when_Padding_l153) begin
      initCount_valid = 1'b0;
    end
  end

  assign when_Padding_l153 = ((fsm_currentState & PaddingEnum_IDLE) != 7'b0000000);
  assign fsm_initEnd = initCount_valid;
  assign when_Padding_l160 = ((fsm_currentState & PaddingEnum_CENTER) != 7'b0000000);
  always @(*) begin
    if(when_Padding_l160) begin
      fifo_push_valid = sData_valid;
    end else begin
      fifo_push_valid = zeroValid;
    end
  end

  always @(*) begin
    if(when_Padding_l160) begin
      fifo_push_payload = sData_payload;
    end else begin
      fifo_push_payload[7 : 0] = _zz_push_payload;
      fifo_push_payload[15 : 8] = _zz_push_payload;
      fifo_push_payload[23 : 16] = _zz_push_payload;
      fifo_push_payload[31 : 24] = _zz_push_payload;
      fifo_push_payload[39 : 32] = _zz_push_payload;
      fifo_push_payload[47 : 40] = _zz_push_payload;
      fifo_push_payload[55 : 48] = _zz_push_payload;
      fifo_push_payload[63 : 56] = _zz_push_payload;
    end
  end

  assign _zz_push_payload = zeroDara;
  assign fifo_push_fire = (fifo_push_valid && fifo_push_ready);
  assign when_WaCounter_l13_1 = (channelCnt_count == _zz_when_WaCounter_l13_1);
  always @(*) begin
    if(when_WaCounter_l13_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
    if(when_Padding_l169) begin
      channelCnt_valid = 1'b0;
    end
  end

  assign when_Padding_l169 = ((fsm_currentState & PaddingEnum_IDLE) != 7'b0000000);
  assign fifo_push_fire_1 = (fifo_push_valid && fifo_push_ready);
  assign when_WaCounter_l18 = (channelCnt_valid && fifo_push_fire_1);
  assign when_WaCounter_l13_2 = (colCnt_count == _zz_when_WaCounter_l13_2);
  always @(*) begin
    if(when_WaCounter_l13_2) begin
      colCnt_valid = 1'b1;
    end else begin
      colCnt_valid = 1'b0;
    end
    if(when_Padding_l173) begin
      colCnt_valid = 1'b0;
    end
  end

  assign when_Padding_l173 = ((fsm_currentState & PaddingEnum_IDLE) != 7'b0000000);
  assign when_WaCounter_l18_1 = ((fsm_nextState & PaddingEnum_END_1) != 7'b0000000);
  assign when_WaCounter_l13_3 = (rowCnt_count == _zz_when_WaCounter_l13_3);
  always @(*) begin
    if(when_WaCounter_l13_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
    if(when_Padding_l177) begin
      rowCnt_valid = 1'b0;
    end
  end

  assign when_Padding_l177 = ((fsm_currentState & PaddingEnum_IDLE) != 7'b0000000);
  assign when_Padding_l144 = ((((fsm_currentState & PaddingEnum_LEFT) != 7'b0000000) || ((fsm_currentState & PaddingEnum_RIGHT) != 7'b0000000)) || ((fsm_currentState & PaddingEnum_UPDOWN) != 7'b0000000));
  always @(*) begin
    if(when_Padding_l144) begin
      zeroValid = 1'b1;
    end else begin
      zeroValid = 1'b0;
    end
  end

  assign fifo_push_fire_2 = (fifo_push_valid && fifo_push_ready);
  assign when_Padding_l144_1 = (((colCnt_count == _zz_when_Padding_l144_1) && channelCnt_valid) && fifo_push_fire_2);
  always @(*) begin
    if(when_Padding_l144_1) begin
      fsm_leftEnd = 1'b1;
    end else begin
      fsm_leftEnd = 1'b0;
    end
  end

  assign fifo_push_fire_3 = (fifo_push_valid && fifo_push_ready);
  assign when_Padding_l144_2 = (((colCnt_count == _zz_when_Padding_l144_2) && channelCnt_valid) && fifo_push_fire_3);
  always @(*) begin
    if(when_Padding_l144_2) begin
      fsm_rightEnd = 1'b1;
    end else begin
      fsm_rightEnd = 1'b0;
    end
  end

  assign when_Padding_l144_3 = (rowCnt_count == _zz_when_Padding_l144_3);
  assign fifo_push_fire_4 = (fifo_push_valid && fifo_push_ready);
  assign when_Padding_l144_4 = (((colCnt_count == _zz_when_Padding_l144_4) && channelCnt_valid) && fifo_push_fire_4);
  always @(*) begin
    if(when_Padding_l144_4) begin
      fsm_upDownEnd = 1'b1;
    end else begin
      fsm_upDownEnd = 1'b0;
    end
  end

  assign fifo_push_fire_5 = (fifo_push_valid && fifo_push_ready);
  assign when_Padding_l144_5 = (((colCnt_count == _zz_when_Padding_l144_5) && channelCnt_valid) && fifo_push_fire_5);
  always @(*) begin
    if(when_Padding_l144_5) begin
      fsm_centerEnd = 1'b1;
    end else begin
      fsm_centerEnd = 1'b0;
    end
  end

  assign when_Padding_l144_6 = ((rowCnt_count < _zz_when_Padding_l144_6) || (_zz_when_Padding_l144_6_1 < rowCnt_count));
  always @(*) begin
    if(when_Padding_l144_6) begin
      fsm_enUpDown = 1'b1;
    end else begin
      fsm_enUpDown = 1'b0;
    end
  end

  assign when_Padding_l144_7 = (((fsm_currentState & PaddingEnum_END_1) != 7'b0000000) && ((fsm_nextState & PaddingEnum_IDLE) != 7'b0000000));
  always @(*) begin
    if(when_Padding_l144_7) begin
      last = 1'b1;
    end else begin
      last = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      channelTimes <= 7'h0;
      fsm_currentState <= PaddingEnum_IDLE;
      initEn <= 1'b0;
      initCount_count <= 5'h0;
      channelCnt_count <= 10'h0;
      colCnt_count <= 10'h0;
      rowCnt_count <= 10'h0;
    end else begin
      channelTimes <= (channelIn >>> 3);
      fsm_currentState <= fsm_nextState;
      if(when_Padding_l151) begin
        initEn <= 1'b1;
      end
      if(when_Padding_l151_1) begin
        initEn <= 1'b0;
      end
      if(initEn) begin
        initCount_count <= (initCount_count + 5'h01);
        if(initCount_valid) begin
          initCount_count <= 5'h0;
        end
      end
      if(when_Padding_l153) begin
        initCount_count <= 5'h0;
      end
      if(fifo_push_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_Padding_l169) begin
        channelCnt_count <= 10'h0;
      end
      if(when_WaCounter_l18) begin
        colCnt_count <= (colCnt_count + 10'h001);
        if(colCnt_valid) begin
          colCnt_count <= 10'h0;
        end
      end
      if(when_Padding_l173) begin
        colCnt_count <= 10'h0;
      end
      if(when_WaCounter_l18_1) begin
        rowCnt_count <= (rowCnt_count + 10'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 10'h0;
        end
      end
      if(when_Padding_l177) begin
        rowCnt_count <= 10'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(when_Padding_l144_3) begin
      fsm_endEnd <= 1'b1;
    end else begin
      fsm_endEnd <= 1'b0;
    end
  end


endmodule

module WaStreamFifo (
  input               push_valid,
  output              push_ready,
  input      [63:0]   push_payload,
  output              pop_valid,
  input               pop_ready,
  output     [63:0]   pop_payload,
  input               flush,
  output reg [2:0]    occupancy,
  output reg [2:0]    availability,
  output reg          almost_full,
  input               clk,
  input               reset
);

  reg        [63:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_pop_payload;
  wire       [63:0]   _zz_logic_ram_port_1;
  wire       [2:0]    _zz_occupancy;
  wire       [2:0]    _zz_availability;
  wire       [2:0]    _zz_availability_1;
  wire       [2:0]    _zz_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_pop_valid;
  wire                when_Stream_l1075;
  wire       [2:0]    logic_ptrDif;
  wire                when_WaFifo_l23;
  reg [63:0] logic_ram [0:4];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_occupancy = (3'b101 + logic_ptrDif);
  assign _zz_availability = (3'b101 + _zz_availability_1);
  assign _zz_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_pop_payload = 1'b1;
  assign _zz_logic_ram_port_1 = push_payload;
  always @(posedge clk) begin
    if(_zz_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_logic_ram_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b100);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 3'b000;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b100);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 3'b000;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (push_valid && push_ready);
  assign logic_popping = (pop_valid && pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign push_ready = (! logic_full);
  assign pop_valid = ((! logic_empty) && (! (_zz_pop_valid && (! logic_full))));
  assign pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l1075 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      occupancy = (logic_risingOccupancy ? 3'b101 : 3'b000);
    end else begin
      occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      availability = (logic_risingOccupancy ? 3'b000 : 3'b101);
    end else begin
      availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_availability : _zz_availability_2);
    end
  end

  assign when_WaFifo_l23 = (availability <= 3'b001);
  always @(*) begin
    if(when_WaFifo_l23) begin
      almost_full = 1'b1;
    end else begin
      almost_full = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l1075) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule
