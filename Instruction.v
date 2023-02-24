// Generator : SpinalHDL v1.7.0    git head : eca519e78d4e6022e34911ec300a432ed9db8220
// Component : Instruction

`timescale 1ns/1ps

module Instruction (
  input               regSData_awvalid,
  output reg          regSData_awready,
  input      [19:0]   regSData_awaddr,
  input      [2:0]    regSData_awprot,
  input               regSData_wvalid,
  output reg          regSData_wready,
  input      [31:0]   regSData_wdata,
  input      [3:0]    regSData_wstrb,
  output              regSData_bvalid,
  input               regSData_bready,
  output     [1:0]    regSData_bresp,
  input               regSData_arvalid,
  output reg          regSData_arready,
  input      [19:0]   regSData_araddr,
  input      [2:0]    regSData_arprot,
  output              regSData_rvalid,
  input               regSData_rready,
  output     [31:0]   regSData_rdata,
  output     [1:0]    regSData_rresp,
  output reg [31:0]   convInstruction_0,
  output reg [31:0]   convInstruction_1,
  output reg [31:0]   convInstruction_2,
  output reg [31:0]   convInstruction_3,
  output reg [31:0]   convInstruction_4,
  input      [3:0]    convState,
  output     [3:0]    convControl,
  output reg [31:0]   writeAddr,
  output reg [31:0]   writeLen,
  output reg [31:0]   readAddr,
  output reg [31:0]   readLen,
  input               clk,
  input               reset
);

  reg                 bus_readError;
  reg        [31:0]   bus_readData;
  wire                bus_axiAr_valid;
  wire                bus_axiAr_ready;
  wire       [19:0]   bus_axiAr_payload_addr;
  wire       [2:0]    bus_axiAr_payload_prot;
  reg                 regSData_ar_rValid;
  reg        [19:0]   regSData_ar_rData_addr;
  reg        [2:0]    regSData_ar_rData_prot;
  wire                when_Stream_l368;
  wire                bus_axiR_valid;
  wire                bus_axiR_ready;
  wire       [31:0]   bus_axiR_payload_data;
  wire       [1:0]    bus_axiR_payload_resp;
  reg                 bus_axiRValid;
  wire                bus_axiAw_valid;
  wire                bus_axiAw_ready;
  wire       [19:0]   bus_axiAw_payload_addr;
  wire       [2:0]    bus_axiAw_payload_prot;
  reg                 regSData_aw_rValid;
  reg        [19:0]   regSData_aw_rData_addr;
  reg        [2:0]    regSData_aw_rData_prot;
  wire                when_Stream_l368_1;
  wire                bus_axiW_valid;
  wire                bus_axiW_ready;
  wire       [31:0]   bus_axiW_payload_data;
  wire       [3:0]    bus_axiW_payload_strb;
  reg                 regSData_w_rValid;
  reg        [31:0]   regSData_w_rData_data;
  reg        [3:0]    regSData_w_rData_strb;
  wire                when_Stream_l368_2;
  wire                bus_axiB_valid;
  wire                bus_axiB_ready;
  wire       [1:0]    bus_axiB_payload_resp;
  reg                 bus_axiBValid;
  wire                bus_doWrite;
  wire                bus_doRead;
  wire                when_RegInst_l281;
  wire       [3:0]    t1;
  reg        [3:0]    _zz_bus_readData;
  wire                when_RegInst_l281_1;
  reg        [10:0]   _zz_convInstruction_0;
  reg        [10:0]   _zz_convInstruction_0_1;
  reg        [9:0]    _zz_convInstruction_0_2;
  wire                when_RegInst_l281_2;
  reg        [9:0]    _zz_convInstruction_1;
  reg        [0:0]    _zz_convInstruction_1_1;
  reg        [0:0]    _zz_convInstruction_1_2;
  reg        [7:0]    _zz_convInstruction_1_3;
  reg        [2:0]    _zz_convInstruction_1_4;
  reg        [7:0]    _zz_convInstruction_1_5;
  reg        [0:0]    _zz_convInstruction_1_6;
  wire                when_RegInst_l281_3;
  reg        [1:0]    _zz_convInstruction_2;
  reg        [0:0]    _zz_convInstruction_2_1;
  wire                when_RegInst_l281_4;
  reg        [15:0]   _zz_convInstruction_3;
  reg        [15:0]   _zz_convInstruction_3_1;
  wire                when_RegInst_l281_5;
  reg        [31:0]   _zz_convInstruction_4;
  wire                when_RegInst_l281_6;
  wire                when_RegInst_l281_7;
  wire                when_RegInst_l281_8;
  wire                when_RegInst_l281_9;

  always @(*) begin
    regSData_arready = bus_axiAr_ready;
    if(when_Stream_l368) begin
      regSData_arready = 1'b1;
    end
  end

  assign when_Stream_l368 = (! bus_axiAr_valid);
  assign bus_axiAr_valid = regSData_ar_rValid;
  assign bus_axiAr_payload_addr = regSData_ar_rData_addr;
  assign bus_axiAr_payload_prot = regSData_ar_rData_prot;
  always @(*) begin
    regSData_awready = bus_axiAw_ready;
    if(when_Stream_l368_1) begin
      regSData_awready = 1'b1;
    end
  end

  assign when_Stream_l368_1 = (! bus_axiAw_valid);
  assign bus_axiAw_valid = regSData_aw_rValid;
  assign bus_axiAw_payload_addr = regSData_aw_rData_addr;
  assign bus_axiAw_payload_prot = regSData_aw_rData_prot;
  always @(*) begin
    regSData_wready = bus_axiW_ready;
    if(when_Stream_l368_2) begin
      regSData_wready = 1'b1;
    end
  end

  assign when_Stream_l368_2 = (! bus_axiW_valid);
  assign bus_axiW_valid = regSData_w_rValid;
  assign bus_axiW_payload_data = regSData_w_rData_data;
  assign bus_axiW_payload_strb = regSData_w_rData_strb;
  assign bus_axiAr_ready = ((! bus_axiRValid) || bus_axiR_ready);
  assign bus_axiR_payload_resp = 2'b00;
  assign bus_axiR_valid = bus_axiRValid;
  assign bus_axiR_payload_data = bus_readData;
  assign bus_axiAw_ready = (bus_axiAw_valid && bus_axiW_valid);
  assign bus_axiW_ready = (bus_axiAw_valid && bus_axiW_valid);
  assign bus_axiB_payload_resp = 2'b00;
  assign bus_axiB_valid = bus_axiBValid;
  assign regSData_rvalid = bus_axiR_valid;
  assign bus_axiR_ready = regSData_rready;
  assign regSData_rdata = bus_axiR_payload_data;
  assign regSData_rresp = bus_axiR_payload_resp;
  assign regSData_bvalid = bus_axiB_valid;
  assign bus_axiB_ready = regSData_bready;
  assign regSData_bresp = bus_axiB_payload_resp;
  assign bus_doWrite = (bus_axiAw_valid && bus_axiW_valid);
  assign bus_doRead = (bus_axiAr_valid && bus_axiAr_ready);
  assign when_RegInst_l281 = ((bus_axiAw_payload_addr == 20'h00004) && bus_doWrite);
  assign t1 = convState;
  assign convControl = _zz_bus_readData;
  assign when_RegInst_l281_1 = ((bus_axiAw_payload_addr == 20'h00008) && bus_doWrite);
  assign when_RegInst_l281_2 = ((bus_axiAw_payload_addr == 20'h0000c) && bus_doWrite);
  assign when_RegInst_l281_3 = ((bus_axiAw_payload_addr == 20'h00010) && bus_doWrite);
  assign when_RegInst_l281_4 = ((bus_axiAw_payload_addr == 20'h00014) && bus_doWrite);
  assign when_RegInst_l281_5 = ((bus_axiAw_payload_addr == 20'h00018) && bus_doWrite);
  assign when_RegInst_l281_6 = ((bus_axiAw_payload_addr == 20'h0001c) && bus_doWrite);
  assign when_RegInst_l281_7 = ((bus_axiAw_payload_addr == 20'h00020) && bus_doWrite);
  assign when_RegInst_l281_8 = ((bus_axiAw_payload_addr == 20'h00024) && bus_doWrite);
  assign when_RegInst_l281_9 = ((bus_axiAw_payload_addr == 20'h00028) && bus_doWrite);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      convInstruction_0 <= 32'h0;
      convInstruction_1 <= 32'h0;
      convInstruction_2 <= 32'h0;
      convInstruction_3 <= 32'h0;
      convInstruction_4 <= 32'h0;
      bus_readError <= 1'b0;
      bus_readData <= 32'h0;
      regSData_ar_rValid <= 1'b0;
      bus_axiRValid <= 1'b0;
      regSData_aw_rValid <= 1'b0;
      regSData_w_rValid <= 1'b0;
      bus_axiBValid <= 1'b0;
      _zz_bus_readData <= 4'b0000;
      _zz_convInstruction_0 <= 11'h0;
      _zz_convInstruction_0_1 <= 11'h0;
      _zz_convInstruction_0_2 <= 10'h0;
      _zz_convInstruction_1 <= 10'h0;
      _zz_convInstruction_1_1 <= 1'b0;
      _zz_convInstruction_1_2 <= 1'b0;
      _zz_convInstruction_1_3 <= 8'h0;
      _zz_convInstruction_1_4 <= 3'b000;
      _zz_convInstruction_1_5 <= 8'h0;
      _zz_convInstruction_1_6 <= 1'b0;
      _zz_convInstruction_2 <= 2'b00;
      _zz_convInstruction_2_1 <= 1'b0;
      _zz_convInstruction_3 <= 16'h0;
      _zz_convInstruction_3_1 <= 16'h0;
      _zz_convInstruction_4 <= 32'h0;
      writeAddr <= 32'h0;
      writeLen <= 32'h0;
      readAddr <= 32'h0;
      readLen <= 32'h0;
    end else begin
      if(regSData_arready) begin
        regSData_ar_rValid <= regSData_arvalid;
      end
      if(regSData_awready) begin
        regSData_aw_rValid <= regSData_awvalid;
      end
      if(regSData_wready) begin
        regSData_w_rValid <= regSData_wvalid;
      end
      bus_axiRValid <= bus_doRead;
      bus_axiBValid <= bus_doWrite;
      if(when_RegInst_l281) begin
        _zz_bus_readData <= bus_axiW_payload_data[3 : 0];
      end
      if(when_RegInst_l281_1) begin
        _zz_convInstruction_0 <= bus_axiW_payload_data[10 : 0];
      end
      convInstruction_0[10 : 0] <= _zz_convInstruction_0;
      if(when_RegInst_l281_1) begin
        _zz_convInstruction_0_1 <= bus_axiW_payload_data[21 : 11];
      end
      convInstruction_0[21 : 11] <= _zz_convInstruction_0_1;
      if(when_RegInst_l281_1) begin
        _zz_convInstruction_0_2 <= bus_axiW_payload_data[31 : 22];
      end
      convInstruction_0[31 : 22] <= _zz_convInstruction_0_2;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1 <= bus_axiW_payload_data[9 : 0];
      end
      convInstruction_1[9 : 0] <= _zz_convInstruction_1;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_1 <= bus_axiW_payload_data[10 : 10];
      end
      convInstruction_1[10 : 10] <= _zz_convInstruction_1_1;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_2 <= bus_axiW_payload_data[11 : 11];
      end
      convInstruction_1[11 : 11] <= _zz_convInstruction_1_2;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_3 <= bus_axiW_payload_data[19 : 12];
      end
      convInstruction_1[19 : 12] <= _zz_convInstruction_1_3;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_4 <= bus_axiW_payload_data[22 : 20];
      end
      convInstruction_1[22 : 20] <= _zz_convInstruction_1_4;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_5 <= bus_axiW_payload_data[30 : 23];
      end
      convInstruction_1[30 : 23] <= _zz_convInstruction_1_5;
      if(when_RegInst_l281_2) begin
        _zz_convInstruction_1_6 <= bus_axiW_payload_data[31 : 31];
      end
      convInstruction_1[31 : 31] <= _zz_convInstruction_1_6;
      if(when_RegInst_l281_3) begin
        _zz_convInstruction_2 <= bus_axiW_payload_data[1 : 0];
      end
      convInstruction_2[1 : 0] <= _zz_convInstruction_2;
      if(when_RegInst_l281_3) begin
        _zz_convInstruction_2_1 <= bus_axiW_payload_data[2 : 2];
      end
      convInstruction_2[2 : 2] <= _zz_convInstruction_2_1;
      if(when_RegInst_l281_4) begin
        _zz_convInstruction_3 <= bus_axiW_payload_data[15 : 0];
      end
      convInstruction_3[15 : 0] <= _zz_convInstruction_3;
      if(when_RegInst_l281_4) begin
        _zz_convInstruction_3_1 <= bus_axiW_payload_data[31 : 16];
      end
      convInstruction_3[31 : 16] <= _zz_convInstruction_3_1;
      if(when_RegInst_l281_5) begin
        _zz_convInstruction_4 <= bus_axiW_payload_data[31 : 0];
      end
      convInstruction_4[31 : 0] <= _zz_convInstruction_4;
      if(when_RegInst_l281_6) begin
        writeAddr <= bus_axiW_payload_data[31 : 0];
      end
      if(when_RegInst_l281_7) begin
        writeLen <= bus_axiW_payload_data[31 : 0];
      end
      if(when_RegInst_l281_8) begin
        readAddr <= bus_axiW_payload_data[31 : 0];
      end
      if(when_RegInst_l281_9) begin
        readLen <= bus_axiW_payload_data[31 : 0];
      end
      if(bus_axiAr_valid) begin
        case(bus_axiAr_payload_addr)
          20'h0 : begin
            bus_readData <= {28'h0,t1};
            bus_readError <= 1'b0;
          end
          20'h00004 : begin
            bus_readData <= {28'h0,_zz_bus_readData};
            bus_readError <= 1'b1;
          end
          20'h00008 : begin
            bus_readData <= {_zz_convInstruction_0_2,{_zz_convInstruction_0_1,_zz_convInstruction_0}};
            bus_readError <= 1'b1;
          end
          20'h0000c : begin
            bus_readData <= {_zz_convInstruction_1_6,{_zz_convInstruction_1_5,{_zz_convInstruction_1_4,{_zz_convInstruction_1_3,{_zz_convInstruction_1_2,{_zz_convInstruction_1_1,_zz_convInstruction_1}}}}}};
            bus_readError <= 1'b1;
          end
          20'h00010 : begin
            bus_readData <= {29'h0,{_zz_convInstruction_2_1,_zz_convInstruction_2}};
            bus_readError <= 1'b1;
          end
          20'h00014 : begin
            bus_readData <= {_zz_convInstruction_3_1,_zz_convInstruction_3};
            bus_readError <= 1'b1;
          end
          20'h00018 : begin
            bus_readData <= _zz_convInstruction_4;
            bus_readError <= 1'b1;
          end
          20'h0001c : begin
            bus_readData <= writeAddr;
            bus_readError <= 1'b1;
          end
          20'h00020 : begin
            bus_readData <= writeLen;
            bus_readError <= 1'b1;
          end
          20'h00024 : begin
            bus_readData <= readAddr;
            bus_readError <= 1'b1;
          end
          20'h00028 : begin
            bus_readData <= readLen;
            bus_readError <= 1'b1;
          end
          default : begin
            bus_readData <= 32'h0;
            bus_readError <= 1'b1;
          end
        endcase
      end
    end
  end

  always @(posedge clk) begin
    if(regSData_arready) begin
      regSData_ar_rData_addr <= regSData_araddr;
      regSData_ar_rData_prot <= regSData_arprot;
    end
    if(regSData_awready) begin
      regSData_aw_rData_addr <= regSData_awaddr;
      regSData_aw_rData_prot <= regSData_awprot;
    end
    if(regSData_wready) begin
      regSData_w_rData_data <= regSData_wdata;
      regSData_w_rData_strb <= regSData_wstrb;
    end
  end


endmodule
