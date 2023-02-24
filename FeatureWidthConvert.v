// Generator : SpinalHDL v1.7.2    git head : 08fc866bebdc40c471ebe327bface63e34406489
// Component : FeatureWidthConvert
// Git hash  : 2fcd2b11cb0dd73b12ad6c704850bbcbf21c69c9

`timescale 1ns/1ps

module FeatureWidthConvert (
  input               sData_valid,
  output              sData_ready,
  input      [63:0]   sData_payload,
  output              mData_mData_0_valid,
  output     [63:0]   mData_mData_0_payload,
  output              mData_mData_1_valid,
  output     [63:0]   mData_mData_1_payload,
  output              mData_mData_2_valid,
  output     [63:0]   mData_mData_2_payload,
  output              mData_mData_3_valid,
  output     [63:0]   mData_mData_3_payload,
  output              mData_mData_4_valid,
  output     [63:0]   mData_mData_4_payload,
  output              mData_mData_5_valid,
  output     [63:0]   mData_mData_5_payload,
  output              mData_mData_6_valid,
  output     [63:0]   mData_mData_6_payload,
  output              mData_mData_7_valid,
  output     [63:0]   mData_mData_7_payload,
  output              mData_mData_8_valid,
  output     [63:0]   mData_mData_8_payload,
  input               mData_ready,
  input      [7:0]    rowNumIn,
  input      [7:0]    colNumIn,
  input               start,
  input      [9:0]    channelIn,
  input               reset,
  input               clk
);
  localparam FeatureWidthConvertEnum_IDLE = 5'd1;
  localparam FeatureWidthConvertEnum_INIT = 5'd2;
  localparam FeatureWidthConvertEnum_FIFO_READY = 5'd4;
  localparam FeatureWidthConvertEnum_SEND = 5'd8;
  localparam FeatureWidthConvertEnum_END_1 = 5'd16;

  reg                 dataCvt_m_axis_tready;
  wire                dataCvt_aresetn;
  wire                dataCvt_s_axis_tready;
  wire                dataCvt_m_axis_tvalid;
  wire       [511:0]  dataCvt_m_axis_tdata;
  wire       [9:0]    _zz_when_WaCounter_l12_1;
  wire       [3:0]    _zz_when_WaCounter_l12_1_1;
  wire       [7:0]    _zz_when_WaCounter_l12_2;
  wire       [7:0]    _zz_when_WaCounter_l12_3;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_sendEnd;
  wire                fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                when_WaCounter_l17;
  reg        [2:0]    initCnt_count;
  reg                 initCnt_valid;
  wire                when_WaCounter_l12;
  reg        [3:0]    channelInTimes;
  wire                dataCvt_mData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l12_1;
  reg        [7:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l12_2;
  wire                when_WaCounter_l17_1;
  reg        [7:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l12_3;
  wire                dataCvt_mData_fire_1;
  wire                dataCvt_mData_fire_2;
  wire                dataCvt_mData_fire_3;
  wire                dataCvt_mData_fire_4;
  wire                dataCvt_mData_fire_5;
  wire                dataCvt_mData_fire_6;
  wire                dataCvt_mData_fire_7;
  wire                dataCvt_mData_fire_8;
  wire                dataCvt_mData_fire_9;
  wire                when_FeatureWidthConvert_l102;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l12_1_1 = (channelInTimes - 4'b0001);
  assign _zz_when_WaCounter_l12_1 = {6'd0, _zz_when_WaCounter_l12_1_1};
  assign _zz_when_WaCounter_l12_2 = (colNumIn - 8'h01);
  assign _zz_when_WaCounter_l12_3 = (rowNumIn - 8'h01);
  conv11DataCvt dataCvt (
    .s_axis_tvalid (sData_valid                ), //i
    .s_axis_tready (dataCvt_s_axis_tready      ), //o
    .s_axis_tdata  (sData_payload[63:0]        ), //i
    .m_axis_tvalid (dataCvt_m_axis_tvalid      ), //o
    .m_axis_tready (dataCvt_m_axis_tready      ), //i
    .m_axis_tdata  (dataCvt_m_axis_tdata[511:0]), //o
    .aclk          (clk                        ), //i
    .aresetn       (dataCvt_aresetn            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      FeatureWidthConvertEnum_IDLE : fsm_currentState_string = "IDLE      ";
      FeatureWidthConvertEnum_INIT : fsm_currentState_string = "INIT      ";
      FeatureWidthConvertEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      FeatureWidthConvertEnum_SEND : fsm_currentState_string = "SEND      ";
      FeatureWidthConvertEnum_END_1 : fsm_currentState_string = "END_1     ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      FeatureWidthConvertEnum_IDLE : fsm_nextState_string = "IDLE      ";
      FeatureWidthConvertEnum_INIT : fsm_nextState_string = "INIT      ";
      FeatureWidthConvertEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      FeatureWidthConvertEnum_SEND : fsm_nextState_string = "SEND      ";
      FeatureWidthConvertEnum_END_1 : fsm_nextState_string = "END_1     ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & FeatureWidthConvertEnum_IDLE) == FeatureWidthConvertEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = FeatureWidthConvertEnum_INIT;
        end else begin
          fsm_nextState = FeatureWidthConvertEnum_IDLE;
        end
      end
      (((fsm_currentState) & FeatureWidthConvertEnum_INIT) == FeatureWidthConvertEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = FeatureWidthConvertEnum_FIFO_READY;
        end else begin
          fsm_nextState = FeatureWidthConvertEnum_INIT;
        end
      end
      (((fsm_currentState) & FeatureWidthConvertEnum_FIFO_READY) == FeatureWidthConvertEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = FeatureWidthConvertEnum_SEND;
        end else begin
          fsm_nextState = FeatureWidthConvertEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & FeatureWidthConvertEnum_SEND) == FeatureWidthConvertEnum_SEND) : begin
        if(fsm_sendEnd) begin
          fsm_nextState = FeatureWidthConvertEnum_END_1;
        end else begin
          fsm_nextState = FeatureWidthConvertEnum_SEND;
        end
      end
      default : begin
        if(fsm_last) begin
          fsm_nextState = FeatureWidthConvertEnum_IDLE;
        end else begin
          fsm_nextState = FeatureWidthConvertEnum_FIFO_READY;
        end
      end
    endcase
  end

  assign when_WaCounter_l17 = ((fsm_currentState & FeatureWidthConvertEnum_INIT) != 5'b00000);
  assign when_WaCounter_l12 = (initCnt_count == 3'b111);
  always @(*) begin
    if(when_WaCounter_l12) begin
      initCnt_valid = 1'b1;
    end else begin
      initCnt_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCnt_valid;
  assign dataCvt_aresetn = (! reset);
  assign dataCvt_mData_fire = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign when_WaCounter_l12_1 = (channelCnt_count == _zz_when_WaCounter_l12_1);
  always @(*) begin
    if(when_WaCounter_l12_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l12_2 = (columnCnt_count == _zz_when_WaCounter_l12_2);
  always @(*) begin
    if(when_WaCounter_l12_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l17_1 = ((fsm_currentState & FeatureWidthConvertEnum_END_1) != 5'b00000);
  assign when_WaCounter_l12_3 = (rowCnt_count == _zz_when_WaCounter_l12_3);
  always @(*) begin
    if(when_WaCounter_l12_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign fsm_fifoReady = mData_ready;
  assign fsm_sendEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_last = ((rowCnt_valid && channelCnt_valid) && columnCnt_valid);
  assign sData_ready = dataCvt_s_axis_tready;
  assign mData_mData_0_payload = dataCvt_m_axis_tdata[63 : 0];
  assign dataCvt_mData_fire_1 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_0_valid = dataCvt_mData_fire_1;
  assign mData_mData_1_payload = dataCvt_m_axis_tdata[127 : 64];
  assign dataCvt_mData_fire_2 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_1_valid = dataCvt_mData_fire_2;
  assign mData_mData_2_payload = dataCvt_m_axis_tdata[191 : 128];
  assign dataCvt_mData_fire_3 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_2_valid = dataCvt_mData_fire_3;
  assign mData_mData_3_payload = dataCvt_m_axis_tdata[255 : 192];
  assign dataCvt_mData_fire_4 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_3_valid = dataCvt_mData_fire_4;
  assign mData_mData_4_payload = dataCvt_m_axis_tdata[319 : 256];
  assign dataCvt_mData_fire_5 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_4_valid = dataCvt_mData_fire_5;
  assign mData_mData_5_payload = dataCvt_m_axis_tdata[383 : 320];
  assign dataCvt_mData_fire_6 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_5_valid = dataCvt_mData_fire_6;
  assign mData_mData_6_payload = dataCvt_m_axis_tdata[447 : 384];
  assign dataCvt_mData_fire_7 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_6_valid = dataCvt_mData_fire_7;
  assign mData_mData_7_payload = dataCvt_m_axis_tdata[511 : 448];
  assign dataCvt_mData_fire_8 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_7_valid = dataCvt_mData_fire_8;
  assign mData_mData_8_payload = 64'h0;
  assign dataCvt_mData_fire_9 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_8_valid = dataCvt_mData_fire_9;
  assign when_FeatureWidthConvert_l102 = ((fsm_currentState & FeatureWidthConvertEnum_SEND) != 5'b00000);
  always @(*) begin
    if(when_FeatureWidthConvert_l102) begin
      dataCvt_m_axis_tready = 1'b1;
    end else begin
      dataCvt_m_axis_tready = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_currentState <= FeatureWidthConvertEnum_IDLE;
      initCnt_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 8'h0;
      rowCnt_count <= 8'h0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l17) begin
        initCnt_count <= (initCnt_count + 3'b001);
        if(initCnt_valid) begin
          initCnt_count <= 3'b000;
        end
      end
      if(dataCvt_mData_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(channelCnt_valid) begin
        columnCnt_count <= (columnCnt_count + 8'h01);
        if(columnCnt_valid) begin
          columnCnt_count <= 8'h0;
        end
      end
      if(when_WaCounter_l17_1) begin
        rowCnt_count <= (rowCnt_count + 8'h01);
        if(rowCnt_valid) begin
          rowCnt_count <= 8'h0;
        end
      end
    end
  end

  always @(posedge clk) begin
    channelInTimes <= (channelIn >>> 6);
  end


endmodule
