// Generator : SpinalHDL v1.7.3    git head : ed8004c489ee8a38c2cab309d0447b543fe9d5b8
// Component : DataGenerate
// Git hash  : bf6b72c5c8e76ae268422a73fd24319daa8c3c97

`timescale 1ns/1ps

module DataGenerate (
  input               sData_valid,
  output reg          sData_ready,
  input      [63:0]   sData_payload,
  input               start,
  input               enPadding,
  input      [9:0]    channelIn,
  input      [9:0]    rowNumIn,
  input      [9:0]    colNumIn,
  input      [7:0]    zeroDara,
  input      [0:0]    zeroNum,
  output reg          mData_mData_0_valid,
  output reg [63:0]   mData_mData_0_payload,
  output reg          mData_mData_1_valid,
  output reg [63:0]   mData_mData_1_payload,
  output reg          mData_mData_2_valid,
  output reg [63:0]   mData_mData_2_payload,
  output reg          mData_mData_3_valid,
  output reg [63:0]   mData_mData_3_payload,
  output reg          mData_mData_4_valid,
  output reg [63:0]   mData_mData_4_payload,
  output reg          mData_mData_5_valid,
  output reg [63:0]   mData_mData_5_payload,
  output reg          mData_mData_6_valid,
  output reg [63:0]   mData_mData_6_payload,
  output reg          mData_mData_7_valid,
  output reg [63:0]   mData_mData_7_payload,
  output reg          mData_mData_8_valid,
  output reg [63:0]   mData_mData_8_payload,
  input               mData_ready,
  input      [1:0]    convType,
  input               reset,
  input               clk
);

  reg                 padding_1_sData_valid;
  reg        [63:0]   padding_1_sData_payload;
  reg                 padding_1_start;
  reg                 featureGenerate_1_mData_ready;
  reg                 featureWidthConvert_1_sData_valid;
  reg        [63:0]   featureWidthConvert_1_sData_payload;
  reg                 featureWidthConvert_1_mData_ready;
  reg                 featureWidthConvert_1_start;
  reg                 featureConv11Convert_1_io_sData_valid;
  reg        [63:0]   featureConv11Convert_1_io_sData_payload;
  reg                 featureConv11Convert_1_io_mData_ready;
  reg                 featureConv11Convert_1_io_start;
  wire                padding_1_sData_ready;
  wire                padding_1_mData_valid;
  wire       [63:0]   padding_1_mData_payload;
  wire       [9:0]    padding_1_rowNumOut;
  wire       [9:0]    padding_1_colNumOut;
  wire                padding_1_last;
  wire                featureGenerate_1_sData_ready;
  wire                featureGenerate_1_mData_mData_0_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_0_payload;
  wire                featureGenerate_1_mData_mData_1_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_1_payload;
  wire                featureGenerate_1_mData_mData_2_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_2_payload;
  wire                featureGenerate_1_mData_mData_3_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_3_payload;
  wire                featureGenerate_1_mData_mData_4_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_4_payload;
  wire                featureGenerate_1_mData_mData_5_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_5_payload;
  wire                featureGenerate_1_mData_mData_6_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_6_payload;
  wire                featureGenerate_1_mData_mData_7_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_7_payload;
  wire                featureGenerate_1_mData_mData_8_valid;
  wire       [63:0]   featureGenerate_1_mData_mData_8_payload;
  wire                featureWidthConvert_1_sData_ready;
  wire                featureWidthConvert_1_mData_mData_0_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_0_payload;
  wire                featureWidthConvert_1_mData_mData_1_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_1_payload;
  wire                featureWidthConvert_1_mData_mData_2_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_2_payload;
  wire                featureWidthConvert_1_mData_mData_3_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_3_payload;
  wire                featureWidthConvert_1_mData_mData_4_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_4_payload;
  wire                featureWidthConvert_1_mData_mData_5_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_5_payload;
  wire                featureWidthConvert_1_mData_mData_6_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_6_payload;
  wire                featureWidthConvert_1_mData_mData_7_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_7_payload;
  wire                featureWidthConvert_1_mData_mData_8_valid;
  wire       [63:0]   featureWidthConvert_1_mData_mData_8_payload;
  wire                featureConv11Convert_1_io_sData_ready;
  wire                featureConv11Convert_1_io_mData_mData_0_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_0_payload;
  wire                featureConv11Convert_1_io_mData_mData_1_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_1_payload;
  wire                featureConv11Convert_1_io_mData_mData_2_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_2_payload;
  wire                featureConv11Convert_1_io_mData_mData_3_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_3_payload;
  wire                featureConv11Convert_1_io_mData_mData_4_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_4_payload;
  wire                featureConv11Convert_1_io_mData_mData_5_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_5_payload;
  wire                featureConv11Convert_1_io_mData_mData_6_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_6_payload;
  wire                featureConv11Convert_1_io_mData_mData_7_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_7_payload;
  wire                featureConv11Convert_1_io_mData_mData_8_valid;
  wire       [63:0]   featureConv11Convert_1_io_mData_mData_8_payload;

  Padding padding_1 (
    .sData_valid   (padding_1_sData_valid        ), //i
    .sData_ready   (padding_1_sData_ready        ), //o
    .sData_payload (padding_1_sData_payload[63:0]), //i
    .mData_valid   (padding_1_mData_valid        ), //o
    .mData_ready   (featureGenerate_1_sData_ready), //i
    .mData_payload (padding_1_mData_payload[63:0]), //o
    .enPadding     (enPadding                    ), //i
    .channelIn     (channelIn[9:0]               ), //i
    .start         (padding_1_start              ), //i
    .rowNumIn      (rowNumIn[9:0]                ), //i
    .rowNumOut     (padding_1_rowNumOut[9:0]     ), //o
    .colNumIn      (colNumIn[9:0]                ), //i
    .colNumOut     (padding_1_colNumOut[9:0]     ), //o
    .zeroDara      (zeroDara[7:0]                ), //i
    .zeroNum       (zeroNum                      ), //i
    .last          (padding_1_last               ), //o
    .clk           (clk                          ), //i
    .reset         (reset                        )  //i
  );
  FeatureGenerate featureGenerate_1 (
    .sData_valid           (padding_1_mData_valid                        ), //i
    .sData_ready           (featureGenerate_1_sData_ready                ), //o
    .sData_payload         (padding_1_mData_payload[63:0]                ), //i
    .mData_mData_0_valid   (featureGenerate_1_mData_mData_0_valid        ), //o
    .mData_mData_0_payload (featureGenerate_1_mData_mData_0_payload[63:0]), //o
    .mData_mData_1_valid   (featureGenerate_1_mData_mData_1_valid        ), //o
    .mData_mData_1_payload (featureGenerate_1_mData_mData_1_payload[63:0]), //o
    .mData_mData_2_valid   (featureGenerate_1_mData_mData_2_valid        ), //o
    .mData_mData_2_payload (featureGenerate_1_mData_mData_2_payload[63:0]), //o
    .mData_mData_3_valid   (featureGenerate_1_mData_mData_3_valid        ), //o
    .mData_mData_3_payload (featureGenerate_1_mData_mData_3_payload[63:0]), //o
    .mData_mData_4_valid   (featureGenerate_1_mData_mData_4_valid        ), //o
    .mData_mData_4_payload (featureGenerate_1_mData_mData_4_payload[63:0]), //o
    .mData_mData_5_valid   (featureGenerate_1_mData_mData_5_valid        ), //o
    .mData_mData_5_payload (featureGenerate_1_mData_mData_5_payload[63:0]), //o
    .mData_mData_6_valid   (featureGenerate_1_mData_mData_6_valid        ), //o
    .mData_mData_6_payload (featureGenerate_1_mData_mData_6_payload[63:0]), //o
    .mData_mData_7_valid   (featureGenerate_1_mData_mData_7_valid        ), //o
    .mData_mData_7_payload (featureGenerate_1_mData_mData_7_payload[63:0]), //o
    .mData_mData_8_valid   (featureGenerate_1_mData_mData_8_valid        ), //o
    .mData_mData_8_payload (featureGenerate_1_mData_mData_8_payload[63:0]), //o
    .mData_ready           (featureGenerate_1_mData_ready                ), //i
    .rowNumIn              (padding_1_rowNumOut[9:0]                     ), //i
    .colNumIn              (padding_1_colNumOut[9:0]                     ), //i
    .start                 (padding_1_start                              ), //i
    .channelIn             (channelIn[9:0]                               ), //i
    .clk                   (clk                                          ), //i
    .reset                 (reset                                        )  //i
  );
  FeatureWidthConvert featureWidthConvert_1 (
    .sData_valid           (featureWidthConvert_1_sData_valid                ), //i
    .sData_ready           (featureWidthConvert_1_sData_ready                ), //o
    .sData_payload         (featureWidthConvert_1_sData_payload[63:0]        ), //i
    .mData_mData_0_valid   (featureWidthConvert_1_mData_mData_0_valid        ), //o
    .mData_mData_0_payload (featureWidthConvert_1_mData_mData_0_payload[63:0]), //o
    .mData_mData_1_valid   (featureWidthConvert_1_mData_mData_1_valid        ), //o
    .mData_mData_1_payload (featureWidthConvert_1_mData_mData_1_payload[63:0]), //o
    .mData_mData_2_valid   (featureWidthConvert_1_mData_mData_2_valid        ), //o
    .mData_mData_2_payload (featureWidthConvert_1_mData_mData_2_payload[63:0]), //o
    .mData_mData_3_valid   (featureWidthConvert_1_mData_mData_3_valid        ), //o
    .mData_mData_3_payload (featureWidthConvert_1_mData_mData_3_payload[63:0]), //o
    .mData_mData_4_valid   (featureWidthConvert_1_mData_mData_4_valid        ), //o
    .mData_mData_4_payload (featureWidthConvert_1_mData_mData_4_payload[63:0]), //o
    .mData_mData_5_valid   (featureWidthConvert_1_mData_mData_5_valid        ), //o
    .mData_mData_5_payload (featureWidthConvert_1_mData_mData_5_payload[63:0]), //o
    .mData_mData_6_valid   (featureWidthConvert_1_mData_mData_6_valid        ), //o
    .mData_mData_6_payload (featureWidthConvert_1_mData_mData_6_payload[63:0]), //o
    .mData_mData_7_valid   (featureWidthConvert_1_mData_mData_7_valid        ), //o
    .mData_mData_7_payload (featureWidthConvert_1_mData_mData_7_payload[63:0]), //o
    .mData_mData_8_valid   (featureWidthConvert_1_mData_mData_8_valid        ), //o
    .mData_mData_8_payload (featureWidthConvert_1_mData_mData_8_payload[63:0]), //o
    .mData_ready           (featureWidthConvert_1_mData_ready                ), //i
    .rowNumIn              (rowNumIn[9:0]                                    ), //i
    .colNumIn              (colNumIn[9:0]                                    ), //i
    .start                 (featureWidthConvert_1_start                      ), //i
    .channelIn             (channelIn[9:0]                                   ), //i
    .reset                 (reset                                            ), //i
    .clk                   (clk                                              )  //i
  );
  FeatureConv11Convert featureConv11Convert_1 (
    .io_sData_valid           (featureConv11Convert_1_io_sData_valid                ), //i
    .io_sData_ready           (featureConv11Convert_1_io_sData_ready                ), //o
    .io_sData_payload         (featureConv11Convert_1_io_sData_payload[63:0]        ), //i
    .io_mData_mData_0_valid   (featureConv11Convert_1_io_mData_mData_0_valid        ), //o
    .io_mData_mData_0_payload (featureConv11Convert_1_io_mData_mData_0_payload[63:0]), //o
    .io_mData_mData_1_valid   (featureConv11Convert_1_io_mData_mData_1_valid        ), //o
    .io_mData_mData_1_payload (featureConv11Convert_1_io_mData_mData_1_payload[63:0]), //o
    .io_mData_mData_2_valid   (featureConv11Convert_1_io_mData_mData_2_valid        ), //o
    .io_mData_mData_2_payload (featureConv11Convert_1_io_mData_mData_2_payload[63:0]), //o
    .io_mData_mData_3_valid   (featureConv11Convert_1_io_mData_mData_3_valid        ), //o
    .io_mData_mData_3_payload (featureConv11Convert_1_io_mData_mData_3_payload[63:0]), //o
    .io_mData_mData_4_valid   (featureConv11Convert_1_io_mData_mData_4_valid        ), //o
    .io_mData_mData_4_payload (featureConv11Convert_1_io_mData_mData_4_payload[63:0]), //o
    .io_mData_mData_5_valid   (featureConv11Convert_1_io_mData_mData_5_valid        ), //o
    .io_mData_mData_5_payload (featureConv11Convert_1_io_mData_mData_5_payload[63:0]), //o
    .io_mData_mData_6_valid   (featureConv11Convert_1_io_mData_mData_6_valid        ), //o
    .io_mData_mData_6_payload (featureConv11Convert_1_io_mData_mData_6_payload[63:0]), //o
    .io_mData_mData_7_valid   (featureConv11Convert_1_io_mData_mData_7_valid        ), //o
    .io_mData_mData_7_payload (featureConv11Convert_1_io_mData_mData_7_payload[63:0]), //o
    .io_mData_mData_8_valid   (featureConv11Convert_1_io_mData_mData_8_valid        ), //o
    .io_mData_mData_8_payload (featureConv11Convert_1_io_mData_mData_8_payload[63:0]), //o
    .io_mData_ready           (featureConv11Convert_1_io_mData_ready                ), //i
    .io_rowNumIn              (rowNumIn[9:0]                                        ), //i
    .io_colNumIn              (colNumIn[9:0]                                        ), //i
    .io_start                 (featureConv11Convert_1_io_start                      ), //i
    .io_channelIn             (channelIn[9:0]                                       ), //i
    .clk                      (clk                                                  ), //i
    .reset                    (reset                                                )  //i
  );
  always @(*) begin
    case(convType)
      2'b00 : begin
        padding_1_sData_valid = sData_valid;
      end
      2'b01 : begin
        padding_1_sData_valid = 1'b0;
      end
      2'b10 : begin
        padding_1_sData_valid = 1'b0;
      end
      default : begin
        padding_1_sData_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        sData_ready = padding_1_sData_ready;
      end
      2'b01 : begin
        sData_ready = featureWidthConvert_1_sData_ready;
      end
      2'b10 : begin
        sData_ready = featureConv11Convert_1_io_sData_ready;
      end
      default : begin
        sData_ready = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        padding_1_sData_payload = sData_payload;
      end
      2'b01 : begin
        padding_1_sData_payload = 64'h0;
      end
      2'b10 : begin
        padding_1_sData_payload = 64'h0;
      end
      default : begin
        padding_1_sData_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        padding_1_start = start;
      end
      2'b01 : begin
        padding_1_start = 1'b0;
      end
      2'b10 : begin
        padding_1_start = 1'b0;
      end
      default : begin
        padding_1_start = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_0_valid = featureGenerate_1_mData_mData_0_valid;
      end
      2'b01 : begin
        mData_mData_0_valid = featureWidthConvert_1_mData_mData_0_valid;
      end
      2'b10 : begin
        mData_mData_0_valid = featureConv11Convert_1_io_mData_mData_0_valid;
      end
      default : begin
        mData_mData_0_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_0_payload = featureGenerate_1_mData_mData_0_payload;
      end
      2'b01 : begin
        mData_mData_0_payload = featureWidthConvert_1_mData_mData_0_payload;
      end
      2'b10 : begin
        mData_mData_0_payload = featureConv11Convert_1_io_mData_mData_0_payload;
      end
      default : begin
        mData_mData_0_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_1_valid = featureGenerate_1_mData_mData_1_valid;
      end
      2'b01 : begin
        mData_mData_1_valid = featureWidthConvert_1_mData_mData_1_valid;
      end
      2'b10 : begin
        mData_mData_1_valid = featureConv11Convert_1_io_mData_mData_1_valid;
      end
      default : begin
        mData_mData_1_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_1_payload = featureGenerate_1_mData_mData_1_payload;
      end
      2'b01 : begin
        mData_mData_1_payload = featureWidthConvert_1_mData_mData_1_payload;
      end
      2'b10 : begin
        mData_mData_1_payload = featureConv11Convert_1_io_mData_mData_1_payload;
      end
      default : begin
        mData_mData_1_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_2_valid = featureGenerate_1_mData_mData_2_valid;
      end
      2'b01 : begin
        mData_mData_2_valid = featureWidthConvert_1_mData_mData_2_valid;
      end
      2'b10 : begin
        mData_mData_2_valid = featureConv11Convert_1_io_mData_mData_2_valid;
      end
      default : begin
        mData_mData_2_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_2_payload = featureGenerate_1_mData_mData_2_payload;
      end
      2'b01 : begin
        mData_mData_2_payload = featureWidthConvert_1_mData_mData_2_payload;
      end
      2'b10 : begin
        mData_mData_2_payload = featureConv11Convert_1_io_mData_mData_2_payload;
      end
      default : begin
        mData_mData_2_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_3_valid = featureGenerate_1_mData_mData_3_valid;
      end
      2'b01 : begin
        mData_mData_3_valid = featureWidthConvert_1_mData_mData_3_valid;
      end
      2'b10 : begin
        mData_mData_3_valid = featureConv11Convert_1_io_mData_mData_3_valid;
      end
      default : begin
        mData_mData_3_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_3_payload = featureGenerate_1_mData_mData_3_payload;
      end
      2'b01 : begin
        mData_mData_3_payload = featureWidthConvert_1_mData_mData_3_payload;
      end
      2'b10 : begin
        mData_mData_3_payload = featureConv11Convert_1_io_mData_mData_3_payload;
      end
      default : begin
        mData_mData_3_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_4_valid = featureGenerate_1_mData_mData_4_valid;
      end
      2'b01 : begin
        mData_mData_4_valid = featureWidthConvert_1_mData_mData_4_valid;
      end
      2'b10 : begin
        mData_mData_4_valid = featureConv11Convert_1_io_mData_mData_4_valid;
      end
      default : begin
        mData_mData_4_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_4_payload = featureGenerate_1_mData_mData_4_payload;
      end
      2'b01 : begin
        mData_mData_4_payload = featureWidthConvert_1_mData_mData_4_payload;
      end
      2'b10 : begin
        mData_mData_4_payload = featureConv11Convert_1_io_mData_mData_4_payload;
      end
      default : begin
        mData_mData_4_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_5_valid = featureGenerate_1_mData_mData_5_valid;
      end
      2'b01 : begin
        mData_mData_5_valid = featureWidthConvert_1_mData_mData_5_valid;
      end
      2'b10 : begin
        mData_mData_5_valid = featureConv11Convert_1_io_mData_mData_5_valid;
      end
      default : begin
        mData_mData_5_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_5_payload = featureGenerate_1_mData_mData_5_payload;
      end
      2'b01 : begin
        mData_mData_5_payload = featureWidthConvert_1_mData_mData_5_payload;
      end
      2'b10 : begin
        mData_mData_5_payload = featureConv11Convert_1_io_mData_mData_5_payload;
      end
      default : begin
        mData_mData_5_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_6_valid = featureGenerate_1_mData_mData_6_valid;
      end
      2'b01 : begin
        mData_mData_6_valid = featureWidthConvert_1_mData_mData_6_valid;
      end
      2'b10 : begin
        mData_mData_6_valid = featureConv11Convert_1_io_mData_mData_6_valid;
      end
      default : begin
        mData_mData_6_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_6_payload = featureGenerate_1_mData_mData_6_payload;
      end
      2'b01 : begin
        mData_mData_6_payload = featureWidthConvert_1_mData_mData_6_payload;
      end
      2'b10 : begin
        mData_mData_6_payload = featureConv11Convert_1_io_mData_mData_6_payload;
      end
      default : begin
        mData_mData_6_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_7_valid = featureGenerate_1_mData_mData_7_valid;
      end
      2'b01 : begin
        mData_mData_7_valid = featureWidthConvert_1_mData_mData_7_valid;
      end
      2'b10 : begin
        mData_mData_7_valid = featureConv11Convert_1_io_mData_mData_7_valid;
      end
      default : begin
        mData_mData_7_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_7_payload = featureGenerate_1_mData_mData_7_payload;
      end
      2'b01 : begin
        mData_mData_7_payload = featureWidthConvert_1_mData_mData_7_payload;
      end
      2'b10 : begin
        mData_mData_7_payload = featureConv11Convert_1_io_mData_mData_7_payload;
      end
      default : begin
        mData_mData_7_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_8_valid = featureGenerate_1_mData_mData_8_valid;
      end
      2'b01 : begin
        mData_mData_8_valid = featureWidthConvert_1_mData_mData_8_valid;
      end
      2'b10 : begin
        mData_mData_8_valid = featureConv11Convert_1_io_mData_mData_8_valid;
      end
      default : begin
        mData_mData_8_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        mData_mData_8_payload = featureGenerate_1_mData_mData_8_payload;
      end
      2'b01 : begin
        mData_mData_8_payload = featureWidthConvert_1_mData_mData_8_payload;
      end
      2'b10 : begin
        mData_mData_8_payload = featureConv11Convert_1_io_mData_mData_8_payload;
      end
      default : begin
        mData_mData_8_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureGenerate_1_mData_ready = mData_ready;
      end
      2'b01 : begin
        featureGenerate_1_mData_ready = 1'b0;
      end
      2'b10 : begin
        featureGenerate_1_mData_ready = 1'b0;
      end
      default : begin
        featureGenerate_1_mData_ready = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureWidthConvert_1_sData_valid = 1'b0;
      end
      2'b01 : begin
        featureWidthConvert_1_sData_valid = sData_valid;
      end
      2'b10 : begin
        featureWidthConvert_1_sData_valid = 1'b0;
      end
      default : begin
        featureWidthConvert_1_sData_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureWidthConvert_1_sData_payload = 64'h0;
      end
      2'b01 : begin
        featureWidthConvert_1_sData_payload = sData_payload;
      end
      2'b10 : begin
        featureWidthConvert_1_sData_payload = 64'h0;
      end
      default : begin
        featureWidthConvert_1_sData_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureWidthConvert_1_mData_ready = 1'b0;
      end
      2'b01 : begin
        featureWidthConvert_1_mData_ready = mData_ready;
      end
      2'b10 : begin
        featureWidthConvert_1_mData_ready = 1'b0;
      end
      default : begin
        featureWidthConvert_1_mData_ready = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureWidthConvert_1_start = 1'b0;
      end
      2'b01 : begin
        featureWidthConvert_1_start = start;
      end
      2'b10 : begin
        featureWidthConvert_1_start = 1'b0;
      end
      default : begin
        featureWidthConvert_1_start = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureConv11Convert_1_io_sData_valid = 1'b0;
      end
      2'b01 : begin
        featureConv11Convert_1_io_sData_valid = 1'b0;
      end
      2'b10 : begin
        featureConv11Convert_1_io_sData_valid = sData_valid;
      end
      default : begin
        featureConv11Convert_1_io_sData_valid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureConv11Convert_1_io_sData_payload = 64'h0;
      end
      2'b01 : begin
        featureConv11Convert_1_io_sData_payload = 64'h0;
      end
      2'b10 : begin
        featureConv11Convert_1_io_sData_payload = sData_payload;
      end
      default : begin
        featureConv11Convert_1_io_sData_payload = 64'h0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureConv11Convert_1_io_mData_ready = 1'b0;
      end
      2'b01 : begin
        featureConv11Convert_1_io_mData_ready = 1'b0;
      end
      2'b10 : begin
        featureConv11Convert_1_io_mData_ready = mData_ready;
      end
      default : begin
        featureConv11Convert_1_io_mData_ready = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(convType)
      2'b00 : begin
        featureConv11Convert_1_io_start = 1'b0;
      end
      2'b01 : begin
        featureConv11Convert_1_io_start = 1'b0;
      end
      2'b10 : begin
        featureConv11Convert_1_io_start = start;
      end
      default : begin
        featureConv11Convert_1_io_start = 1'b0;
      end
    endcase
  end


endmodule

module FeatureConv11Convert (
  input               io_sData_valid,
  output reg          io_sData_ready,
  input      [63:0]   io_sData_payload,
  output              io_mData_mData_0_valid,
  output     [63:0]   io_mData_mData_0_payload,
  output              io_mData_mData_1_valid,
  output     [63:0]   io_mData_mData_1_payload,
  output              io_mData_mData_2_valid,
  output     [63:0]   io_mData_mData_2_payload,
  output              io_mData_mData_3_valid,
  output     [63:0]   io_mData_mData_3_payload,
  output              io_mData_mData_4_valid,
  output     [63:0]   io_mData_mData_4_payload,
  output              io_mData_mData_5_valid,
  output     [63:0]   io_mData_mData_5_payload,
  output              io_mData_mData_6_valid,
  output     [63:0]   io_mData_mData_6_payload,
  output              io_mData_mData_7_valid,
  output     [63:0]   io_mData_mData_7_payload,
  output              io_mData_mData_8_valid,
  output     [63:0]   io_mData_mData_8_payload,
  input               io_mData_ready,
  input      [9:0]    io_rowNumIn,
  input      [9:0]    io_colNumIn,
  input               io_start,
  input      [9:0]    io_channelIn,
  input               clk,
  input               reset
);
  localparam FeatureWidthConvertEnum_IDLE = 5'd1;
  localparam FeatureWidthConvertEnum_INIT = 5'd2;
  localparam FeatureWidthConvertEnum_FIFO_READY = 5'd4;
  localparam FeatureWidthConvertEnum_SEND = 5'd8;
  localparam FeatureWidthConvertEnum_END_1 = 5'd16;

  wire       [9:0]    _zz_when_WaCounter_l13_1;
  wire       [6:0]    _zz_when_WaCounter_l13_1_1;
  wire       [9:0]    _zz_when_WaCounter_l13_2;
  wire       [9:0]    _zz_when_WaCounter_l13_3;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_sendEnd;
  reg                 fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                when_WaCounter_l18;
  reg        [2:0]    initCnt_count;
  reg                 initCnt_valid;
  wire                when_WaCounter_l13;
  reg        [6:0]    channelInTimes;
  wire                io_sData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l13_1;
  reg        [9:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l13_2;
  wire                when_WaCounter_l18_1;
  reg        [9:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l13_3;
  wire                io_sData_fire_1;
  wire                io_sData_fire_2;
  wire                io_sData_fire_3;
  wire                io_sData_fire_4;
  wire                io_sData_fire_5;
  wire                io_sData_fire_6;
  wire                io_sData_fire_7;
  wire                io_sData_fire_8;
  wire                io_sData_fire_9;
  wire                when_FeatureConv11Convert_l97;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l13_1_1 = (channelInTimes - 7'h01);
  assign _zz_when_WaCounter_l13_1 = {3'd0, _zz_when_WaCounter_l13_1_1};
  assign _zz_when_WaCounter_l13_2 = (io_colNumIn - 10'h001);
  assign _zz_when_WaCounter_l13_3 = (io_rowNumIn - 10'h001);
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
        if(io_start) begin
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

  assign when_WaCounter_l18 = ((fsm_currentState & FeatureWidthConvertEnum_INIT) != 5'b00000);
  assign when_WaCounter_l13 = (initCnt_count == 3'b111);
  always @(*) begin
    if(when_WaCounter_l13) begin
      initCnt_valid = 1'b1;
    end else begin
      initCnt_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCnt_valid;
  assign io_sData_fire = (io_sData_valid && io_sData_ready);
  assign when_WaCounter_l13_1 = (channelCnt_count == _zz_when_WaCounter_l13_1);
  always @(*) begin
    if(when_WaCounter_l13_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l13_2 = (columnCnt_count == _zz_when_WaCounter_l13_2);
  always @(*) begin
    if(when_WaCounter_l13_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l18_1 = ((fsm_currentState & FeatureWidthConvertEnum_END_1) != 5'b00000);
  assign when_WaCounter_l13_3 = (rowCnt_count == _zz_when_WaCounter_l13_3);
  always @(*) begin
    if(when_WaCounter_l13_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign fsm_fifoReady = io_mData_ready;
  assign fsm_sendEnd = (channelCnt_valid && columnCnt_valid);
  assign io_mData_mData_1_payload = 64'h0;
  assign io_sData_fire_1 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_1_valid = io_sData_fire_1;
  assign io_mData_mData_2_payload = 64'h0;
  assign io_sData_fire_2 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_2_valid = io_sData_fire_2;
  assign io_mData_mData_3_payload = 64'h0;
  assign io_sData_fire_3 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_3_valid = io_sData_fire_3;
  assign io_mData_mData_4_payload = 64'h0;
  assign io_sData_fire_4 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_4_valid = io_sData_fire_4;
  assign io_mData_mData_5_payload = 64'h0;
  assign io_sData_fire_5 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_5_valid = io_sData_fire_5;
  assign io_mData_mData_6_payload = 64'h0;
  assign io_sData_fire_6 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_6_valid = io_sData_fire_6;
  assign io_mData_mData_7_payload = 64'h0;
  assign io_sData_fire_7 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_7_valid = io_sData_fire_7;
  assign io_mData_mData_8_payload = 64'h0;
  assign io_sData_fire_8 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_8_valid = io_sData_fire_8;
  assign io_mData_mData_0_payload = io_sData_payload;
  assign io_sData_fire_9 = (io_sData_valid && io_sData_ready);
  assign io_mData_mData_0_valid = io_sData_fire_9;
  assign when_FeatureConv11Convert_l97 = ((fsm_currentState & FeatureWidthConvertEnum_SEND) != 5'b00000);
  always @(*) begin
    if(when_FeatureConv11Convert_l97) begin
      io_sData_ready = 1'b1;
    end else begin
      io_sData_ready = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_last <= 1'b0;
      fsm_currentState <= FeatureWidthConvertEnum_IDLE;
      initCnt_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 10'h0;
      rowCnt_count <= 10'h0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l18) begin
        initCnt_count <= (initCnt_count + 3'b001);
        if(initCnt_valid) begin
          initCnt_count <= 3'b000;
        end
      end
      if(io_sData_fire) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(channelCnt_valid) begin
        columnCnt_count <= (columnCnt_count + 10'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l18_1) begin
        rowCnt_count <= (rowCnt_count + 10'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 10'h0;
        end
      end
      fsm_last <= ((rowCnt_valid && channelCnt_valid) && columnCnt_valid);
    end
  end

  always @(posedge clk) begin
    channelInTimes <= (io_channelIn >>> 3);
  end


endmodule

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
  input      [9:0]    rowNumIn,
  input      [9:0]    colNumIn,
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
  wire       [9:0]    _zz_when_WaCounter_l13_1;
  wire       [3:0]    _zz_when_WaCounter_l13_1_1;
  wire       [9:0]    _zz_when_WaCounter_l13_2;
  wire       [9:0]    _zz_when_WaCounter_l13_3;
  wire                fsm_initEnd;
  wire                fsm_fifoReady;
  wire                fsm_sendEnd;
  reg                 fsm_last;
  reg        [4:0]    fsm_currentState;
  reg        [4:0]    fsm_nextState;
  wire                when_WaCounter_l18;
  reg        [2:0]    initCnt_count;
  reg                 initCnt_valid;
  wire                when_WaCounter_l13;
  reg        [3:0]    channelInTimes;
  wire                dataCvt_mData_fire;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l13_1;
  wire                dataCvt_mData_fire_1;
  wire                when_WaCounter_l18_1;
  reg        [9:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l13_2;
  wire                when_WaCounter_l18_2;
  reg        [9:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l13_3;
  wire                dataCvt_mData_fire_2;
  wire                dataCvt_mData_fire_3;
  wire                dataCvt_mData_fire_4;
  wire                dataCvt_mData_fire_5;
  wire                dataCvt_mData_fire_6;
  wire                dataCvt_mData_fire_7;
  wire                dataCvt_mData_fire_8;
  wire                dataCvt_mData_fire_9;
  wire                dataCvt_mData_fire_10;
  wire                dataCvt_mData_fire_11;
  wire                dataCvt_mData_fire_12;
  wire                when_FeatureWidthConvert_l107;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif


  assign _zz_when_WaCounter_l13_1_1 = (channelInTimes - 4'b0001);
  assign _zz_when_WaCounter_l13_1 = {6'd0, _zz_when_WaCounter_l13_1_1};
  assign _zz_when_WaCounter_l13_2 = (colNumIn - 10'h001);
  assign _zz_when_WaCounter_l13_3 = (rowNumIn - 10'h001);
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

  assign when_WaCounter_l18 = ((fsm_currentState & FeatureWidthConvertEnum_INIT) != 5'b00000);
  assign when_WaCounter_l13 = (initCnt_count == 3'b111);
  always @(*) begin
    if(when_WaCounter_l13) begin
      initCnt_valid = 1'b1;
    end else begin
      initCnt_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCnt_valid;
  assign dataCvt_aresetn = (! reset);
  assign dataCvt_mData_fire = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign when_WaCounter_l13_1 = (channelCnt_count == _zz_when_WaCounter_l13_1);
  always @(*) begin
    if(when_WaCounter_l13_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign dataCvt_mData_fire_1 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign when_WaCounter_l18_1 = (channelCnt_valid && dataCvt_mData_fire_1);
  assign when_WaCounter_l13_2 = (columnCnt_count == _zz_when_WaCounter_l13_2);
  always @(*) begin
    if(when_WaCounter_l13_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l18_2 = ((fsm_currentState & FeatureWidthConvertEnum_END_1) != 5'b00000);
  assign when_WaCounter_l13_3 = (rowCnt_count == _zz_when_WaCounter_l13_3);
  always @(*) begin
    if(when_WaCounter_l13_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign fsm_fifoReady = mData_ready;
  assign dataCvt_mData_fire_2 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign fsm_sendEnd = ((channelCnt_valid && columnCnt_valid) && dataCvt_mData_fire_2);
  assign dataCvt_mData_fire_3 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign sData_ready = dataCvt_s_axis_tready;
  assign mData_mData_0_payload = dataCvt_m_axis_tdata[63 : 0];
  assign dataCvt_mData_fire_4 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_0_valid = dataCvt_mData_fire_4;
  assign mData_mData_1_payload = dataCvt_m_axis_tdata[127 : 64];
  assign dataCvt_mData_fire_5 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_1_valid = dataCvt_mData_fire_5;
  assign mData_mData_2_payload = dataCvt_m_axis_tdata[191 : 128];
  assign dataCvt_mData_fire_6 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_2_valid = dataCvt_mData_fire_6;
  assign mData_mData_3_payload = dataCvt_m_axis_tdata[255 : 192];
  assign dataCvt_mData_fire_7 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_3_valid = dataCvt_mData_fire_7;
  assign mData_mData_4_payload = dataCvt_m_axis_tdata[319 : 256];
  assign dataCvt_mData_fire_8 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_4_valid = dataCvt_mData_fire_8;
  assign mData_mData_5_payload = dataCvt_m_axis_tdata[383 : 320];
  assign dataCvt_mData_fire_9 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_5_valid = dataCvt_mData_fire_9;
  assign mData_mData_6_payload = dataCvt_m_axis_tdata[447 : 384];
  assign dataCvt_mData_fire_10 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_6_valid = dataCvt_mData_fire_10;
  assign mData_mData_7_payload = dataCvt_m_axis_tdata[511 : 448];
  assign dataCvt_mData_fire_11 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_7_valid = dataCvt_mData_fire_11;
  assign mData_mData_8_payload = 64'h0;
  assign dataCvt_mData_fire_12 = (dataCvt_m_axis_tvalid && dataCvt_m_axis_tready);
  assign mData_mData_8_valid = dataCvt_mData_fire_12;
  assign when_FeatureWidthConvert_l107 = ((fsm_currentState & FeatureWidthConvertEnum_SEND) != 5'b00000);
  always @(*) begin
    if(when_FeatureWidthConvert_l107) begin
      dataCvt_m_axis_tready = 1'b1;
    end else begin
      dataCvt_m_axis_tready = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      fsm_last <= 1'b0;
      fsm_currentState <= FeatureWidthConvertEnum_IDLE;
      initCnt_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 10'h0;
      rowCnt_count <= 10'h0;
    end else begin
      fsm_currentState <= fsm_nextState;
      if(when_WaCounter_l18) begin
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
      if(when_WaCounter_l18_1) begin
        columnCnt_count <= (columnCnt_count + 10'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l18_2) begin
        rowCnt_count <= (rowCnt_count + 10'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 10'h0;
        end
      end
      fsm_last <= (((rowCnt_valid && channelCnt_valid) && columnCnt_valid) && dataCvt_mData_fire_3);
    end
  end

  always @(posedge clk) begin
    channelInTimes <= (channelIn >>> 6);
  end


endmodule

module FeatureGenerate (
  input               sData_valid,
  output reg          sData_ready,
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
  input      [9:0]    rowNumIn,
  input      [9:0]    colNumIn,
  input               start,
  input      [9:0]    channelIn,
  input               clk,
  input               reset
);
  localparam FeatureGenerateEnum_IDLE = 6'd1;
  localparam FeatureGenerateEnum_INIT = 6'd2;
  localparam FeatureGenerateEnum_WAIT_1 = 6'd4;
  localparam FeatureGenerateEnum_FIFO_READY = 6'd8;
  localparam FeatureGenerateEnum_WR = 6'd16;
  localparam FeatureGenerateEnum_END_1 = 6'd32;

  reg        [63:0]   _zz_mem_0_port1;
  reg        [63:0]   _zz_mem_1_port1;
  wire       [16:0]   _zz_when_FeatureGenerate_l109;
  wire       [16:0]   _zz_when_FeatureGenerate_l109_1;
  wire       [63:0]   _zz_mem_0_port;
  wire                _zz_mem_0_port_1;
  wire                _zz_rdData_0;
  wire       [63:0]   _zz_mem_1_port;
  wire                _zz_mem_1_port_1;
  wire                _zz_rdData_1;
  wire       [9:0]    _zz_when_WaCounter_l13_1;
  wire       [6:0]    _zz_when_WaCounter_l13_1_1;
  wire       [9:0]    _zz_when_WaCounter_l13_2;
  wire       [9:0]    _zz_when_WaCounter_l13_3;
  wire       [9:0]    _zz_when_FeatureGenerate_l156;
  wire       [9:0]    _zz_when_FeatureGenerate_l165;
  reg        [6:0]    channelTimes;
  reg        [16:0]   totalCnt;
  wire                fsm_initEnd;
  wire                fsm_waitEnd;
  wire                fsm_wrEnd;
  wire                fsm_endEnd;
  wire                fsm_wait2;
  wire                fsm_fifoReady;
  reg        [5:0]    fsm_currentState;
  reg        [5:0]    fsm_nextState;
  reg        [10:0]   rdAddr;
  wire       [63:0]   wrData_0;
  wire       [63:0]   wrData_1;
  wire       [63:0]   rdData_0;
  wire       [63:0]   rdData_1;
  reg        [10:0]   wrAddr;
  wire                sData_fire;
  wire                when_FeatureGenerate_l109;
  reg        [63:0]   sData_payload_regNext;
  wire                sData_fire_1;
  reg                 sData_fire_1_regNext;
  wire                sData_fire_2;
  reg                 sData_fire_2_regNext;
  wire                when_WaCounter_l18;
  reg        [2:0]    initCount_count;
  reg                 initCount_valid;
  wire                when_WaCounter_l13;
  wire                sData_fire_3;
  reg        [9:0]    channelCnt_count;
  reg                 channelCnt_valid;
  wire                when_WaCounter_l13_1;
  wire                sData_fire_4;
  wire                when_WaCounter_l18_1;
  reg        [9:0]    columnCnt_count;
  reg                 columnCnt_valid;
  wire                when_WaCounter_l13_2;
  wire                when_WaCounter_l18_2;
  reg        [9:0]    rowCnt_count;
  reg                 rowCnt_valid;
  wire                when_WaCounter_l13_3;
  wire                when_FeatureGenerate_l137;
  reg                 valid_0;
  reg                 valid_1;
  reg                 valid_2;
  reg                 valid_3;
  reg                 valid_4;
  reg                 valid_5;
  reg                 valid_6;
  reg                 valid_7;
  reg                 valid_8;
  reg                 valid_0_delay_1;
  reg                 valid_0_delay_2;
  reg                 valid_0_delay_3;
  reg                 valid_3_delay_1;
  reg                 valid_3_delay_2;
  reg                 valid_3_delay_3;
  reg                 valid_6_delay_1;
  reg                 valid_6_delay_2;
  reg                 valid_6_delay_3;
  reg                 valid_1_delay_1;
  reg                 valid_1_delay_2;
  reg                 valid_4_delay_1;
  reg                 valid_4_delay_2;
  reg                 valid_7_delay_1;
  reg                 valid_7_delay_2;
  reg                 valid_2_delay_1;
  reg                 valid_5_delay_1;
  reg                 valid_8_delay_1;
  wire                when_FeatureGenerate_l155;
  wire                when_FeatureGenerate_l156;
  wire                when_FeatureGenerate_l165;
  wire                when_FeatureGenerate_l174;
  reg        [63:0]   mData_mData_1_payload_regNext;
  reg        [63:0]   mData_mData_2_payload_regNext;
  reg        [63:0]   rdData_1_regNext;
  reg        [63:0]   mData_mData_4_payload_regNext;
  reg        [63:0]   mData_mData_5_payload_regNext;
  reg        [63:0]   rdData_0_regNext;
  reg        [63:0]   mData_mData_7_payload_regNext;
  reg        [63:0]   mData_mData_8_payload_regNext;
  reg        [63:0]   sData_payload_regNext_1;
  reg        [63:0]   sData_payload_regNext_1_regNext;
  `ifndef SYNTHESIS
  reg [79:0] fsm_currentState_string;
  reg [79:0] fsm_nextState_string;
  `endif

  (* ram_style = "block" *) reg [63:0] mem_0 [0:2047];
  (* ram_style = "block" *) reg [63:0] mem_1 [0:2047];

  assign _zz_when_FeatureGenerate_l109 = {6'd0, rdAddr};
  assign _zz_when_FeatureGenerate_l109_1 = (totalCnt - 17'h00001);
  assign _zz_when_WaCounter_l13_1_1 = (channelTimes - 7'h01);
  assign _zz_when_WaCounter_l13_1 = {3'd0, _zz_when_WaCounter_l13_1_1};
  assign _zz_when_WaCounter_l13_2 = (colNumIn - 10'h001);
  assign _zz_when_WaCounter_l13_3 = (rowNumIn - 10'h001);
  assign _zz_when_FeatureGenerate_l156 = (colNumIn - 10'h002);
  assign _zz_when_FeatureGenerate_l165 = (colNumIn - 10'h001);
  assign _zz_mem_0_port = wrData_0;
  assign _zz_rdData_0 = 1'b1;
  assign _zz_mem_1_port = wrData_1;
  assign _zz_rdData_1 = 1'b1;
  always @(posedge clk) begin
    if(sData_fire_1_regNext) begin
      mem_0[wrAddr] <= _zz_mem_0_port;
    end
  end

  always @(posedge clk) begin
    if(_zz_rdData_0) begin
      _zz_mem_0_port1 <= mem_0[rdAddr];
    end
  end

  always @(posedge clk) begin
    if(sData_fire_2_regNext) begin
      mem_1[wrAddr] <= _zz_mem_1_port;
    end
  end

  always @(posedge clk) begin
    if(_zz_rdData_1) begin
      _zz_mem_1_port1 <= mem_1[rdAddr];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_currentState)
      FeatureGenerateEnum_IDLE : fsm_currentState_string = "IDLE      ";
      FeatureGenerateEnum_INIT : fsm_currentState_string = "INIT      ";
      FeatureGenerateEnum_WAIT_1 : fsm_currentState_string = "WAIT_1    ";
      FeatureGenerateEnum_FIFO_READY : fsm_currentState_string = "FIFO_READY";
      FeatureGenerateEnum_WR : fsm_currentState_string = "WR        ";
      FeatureGenerateEnum_END_1 : fsm_currentState_string = "END_1     ";
      default : fsm_currentState_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_nextState)
      FeatureGenerateEnum_IDLE : fsm_nextState_string = "IDLE      ";
      FeatureGenerateEnum_INIT : fsm_nextState_string = "INIT      ";
      FeatureGenerateEnum_WAIT_1 : fsm_nextState_string = "WAIT_1    ";
      FeatureGenerateEnum_FIFO_READY : fsm_nextState_string = "FIFO_READY";
      FeatureGenerateEnum_WR : fsm_nextState_string = "WR        ";
      FeatureGenerateEnum_END_1 : fsm_nextState_string = "END_1     ";
      default : fsm_nextState_string = "??????????";
    endcase
  end
  `endif

  always @(*) begin
    (* parallel_case *)
    case(1) // synthesis parallel_case
      (((fsm_currentState) & FeatureGenerateEnum_IDLE) == FeatureGenerateEnum_IDLE) : begin
        if(start) begin
          fsm_nextState = FeatureGenerateEnum_INIT;
        end else begin
          fsm_nextState = FeatureGenerateEnum_IDLE;
        end
      end
      (((fsm_currentState) & FeatureGenerateEnum_INIT) == FeatureGenerateEnum_INIT) : begin
        if(fsm_initEnd) begin
          fsm_nextState = FeatureGenerateEnum_WAIT_1;
        end else begin
          fsm_nextState = FeatureGenerateEnum_INIT;
        end
      end
      (((fsm_currentState) & FeatureGenerateEnum_WAIT_1) == FeatureGenerateEnum_WAIT_1) : begin
        if(fsm_waitEnd) begin
          fsm_nextState = FeatureGenerateEnum_END_1;
        end else begin
          fsm_nextState = FeatureGenerateEnum_WAIT_1;
        end
      end
      (((fsm_currentState) & FeatureGenerateEnum_FIFO_READY) == FeatureGenerateEnum_FIFO_READY) : begin
        if(fsm_fifoReady) begin
          fsm_nextState = FeatureGenerateEnum_WR;
        end else begin
          fsm_nextState = FeatureGenerateEnum_FIFO_READY;
        end
      end
      (((fsm_currentState) & FeatureGenerateEnum_WR) == FeatureGenerateEnum_WR) : begin
        if(fsm_wrEnd) begin
          fsm_nextState = FeatureGenerateEnum_END_1;
        end else begin
          fsm_nextState = FeatureGenerateEnum_WR;
        end
      end
      default : begin
        if(fsm_wait2) begin
          fsm_nextState = FeatureGenerateEnum_WAIT_1;
        end else begin
          if(fsm_endEnd) begin
            fsm_nextState = FeatureGenerateEnum_IDLE;
          end else begin
            fsm_nextState = FeatureGenerateEnum_FIFO_READY;
          end
        end
      end
    endcase
  end

  assign fsm_fifoReady = mData_ready;
  assign sData_fire = (sData_valid && sData_ready);
  assign when_FeatureGenerate_l109 = (_zz_when_FeatureGenerate_l109 == _zz_when_FeatureGenerate_l109_1);
  assign wrData_0 = sData_payload_regNext;
  assign wrData_1 = rdData_0;
  assign sData_fire_1 = (sData_valid && sData_ready);
  assign rdData_0 = _zz_mem_0_port1;
  assign sData_fire_2 = (sData_valid && sData_ready);
  assign rdData_1 = _zz_mem_1_port1;
  assign when_WaCounter_l18 = ((fsm_currentState & FeatureGenerateEnum_INIT) != 6'b000000);
  assign when_WaCounter_l13 = (initCount_count == 3'b101);
  always @(*) begin
    if(when_WaCounter_l13) begin
      initCount_valid = 1'b1;
    end else begin
      initCount_valid = 1'b0;
    end
  end

  assign fsm_initEnd = initCount_valid;
  assign sData_fire_3 = (sData_valid && sData_ready);
  assign when_WaCounter_l13_1 = (channelCnt_count == _zz_when_WaCounter_l13_1);
  always @(*) begin
    if(when_WaCounter_l13_1) begin
      channelCnt_valid = 1'b1;
    end else begin
      channelCnt_valid = 1'b0;
    end
  end

  assign sData_fire_4 = (sData_valid && sData_ready);
  assign when_WaCounter_l18_1 = (channelCnt_valid && sData_fire_4);
  assign when_WaCounter_l13_2 = (columnCnt_count == _zz_when_WaCounter_l13_2);
  always @(*) begin
    if(when_WaCounter_l13_2) begin
      columnCnt_valid = 1'b1;
    end else begin
      columnCnt_valid = 1'b0;
    end
  end

  assign when_WaCounter_l18_2 = ((fsm_currentState & FeatureGenerateEnum_END_1) != 6'b000000);
  assign when_WaCounter_l13_3 = (rowCnt_count == _zz_when_WaCounter_l13_3);
  always @(*) begin
    if(when_WaCounter_l13_3) begin
      rowCnt_valid = 1'b1;
    end else begin
      rowCnt_valid = 1'b0;
    end
  end

  assign fsm_waitEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_wrEnd = (channelCnt_valid && columnCnt_valid);
  assign fsm_endEnd = rowCnt_valid;
  assign fsm_wait2 = (rowCnt_count < 10'h001);
  assign when_FeatureGenerate_l137 = (((fsm_currentState & FeatureGenerateEnum_WAIT_1) != 6'b000000) || ((fsm_currentState & FeatureGenerateEnum_WR) != 6'b000000));
  always @(*) begin
    if(when_FeatureGenerate_l137) begin
      sData_ready = 1'b1;
    end else begin
      sData_ready = 1'b0;
    end
  end

  assign mData_mData_0_valid = valid_0_delay_3;
  assign mData_mData_3_valid = valid_3_delay_3;
  assign mData_mData_6_valid = valid_6_delay_3;
  assign mData_mData_1_valid = valid_1_delay_2;
  assign mData_mData_4_valid = valid_4_delay_2;
  assign mData_mData_7_valid = valid_7_delay_2;
  assign mData_mData_2_valid = valid_2_delay_1;
  assign mData_mData_5_valid = valid_5_delay_1;
  assign mData_mData_8_valid = valid_8_delay_1;
  assign when_FeatureGenerate_l155 = ((fsm_currentState & FeatureGenerateEnum_WR) != 6'b000000);
  assign when_FeatureGenerate_l156 = (columnCnt_count < _zz_when_FeatureGenerate_l156);
  assign when_FeatureGenerate_l165 = ((10'h0 < columnCnt_count) && (columnCnt_count < _zz_when_FeatureGenerate_l165));
  assign when_FeatureGenerate_l174 = ((10'h001 < columnCnt_count) && (columnCnt_count < colNumIn));
  assign mData_mData_0_payload = mData_mData_1_payload_regNext;
  assign mData_mData_1_payload = mData_mData_2_payload_regNext;
  assign mData_mData_2_payload = rdData_1_regNext;
  assign mData_mData_3_payload = mData_mData_4_payload_regNext;
  assign mData_mData_4_payload = mData_mData_5_payload_regNext;
  assign mData_mData_5_payload = rdData_0_regNext;
  assign mData_mData_6_payload = mData_mData_7_payload_regNext;
  assign mData_mData_7_payload = mData_mData_8_payload_regNext;
  assign mData_mData_8_payload = sData_payload_regNext_1_regNext;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      channelTimes <= 7'h0;
      fsm_currentState <= FeatureGenerateEnum_IDLE;
      rdAddr <= 11'h0;
      initCount_count <= 3'b000;
      channelCnt_count <= 10'h0;
      columnCnt_count <= 10'h0;
      rowCnt_count <= 10'h0;
      valid_0 <= 1'b0;
      valid_1 <= 1'b0;
      valid_2 <= 1'b0;
      valid_3 <= 1'b0;
      valid_4 <= 1'b0;
      valid_5 <= 1'b0;
      valid_6 <= 1'b0;
      valid_7 <= 1'b0;
      valid_8 <= 1'b0;
    end else begin
      channelTimes <= (channelIn >>> 3);
      fsm_currentState <= fsm_nextState;
      if(sData_fire) begin
        if(when_FeatureGenerate_l109) begin
          rdAddr <= 11'h0;
        end else begin
          rdAddr <= (rdAddr + 11'h001);
        end
      end
      if(when_WaCounter_l18) begin
        initCount_count <= (initCount_count + 3'b001);
        if(initCount_valid) begin
          initCount_count <= 3'b000;
        end
      end
      if(sData_fire_3) begin
        channelCnt_count <= (channelCnt_count + 10'h001);
        if(channelCnt_valid) begin
          channelCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l18_1) begin
        columnCnt_count <= (columnCnt_count + 10'h001);
        if(columnCnt_valid) begin
          columnCnt_count <= 10'h0;
        end
      end
      if(when_WaCounter_l18_2) begin
        rowCnt_count <= (rowCnt_count + 10'h001);
        if(rowCnt_valid) begin
          rowCnt_count <= 10'h0;
        end
      end
      if(when_FeatureGenerate_l155) begin
        if(when_FeatureGenerate_l156) begin
          valid_0 <= 1'b1;
          valid_3 <= 1'b1;
          valid_6 <= 1'b1;
        end else begin
          valid_0 <= 1'b0;
          valid_3 <= 1'b0;
          valid_6 <= 1'b0;
        end
        if(when_FeatureGenerate_l165) begin
          valid_1 <= 1'b1;
          valid_4 <= 1'b1;
          valid_7 <= 1'b1;
        end else begin
          valid_1 <= 1'b0;
          valid_4 <= 1'b0;
          valid_7 <= 1'b0;
        end
        if(when_FeatureGenerate_l174) begin
          valid_2 <= 1'b1;
          valid_5 <= 1'b1;
          valid_8 <= 1'b1;
        end else begin
          valid_2 <= 1'b0;
          valid_5 <= 1'b0;
          valid_8 <= 1'b0;
        end
      end else begin
        valid_0 <= 1'b0;
        valid_1 <= 1'b0;
        valid_2 <= 1'b0;
        valid_3 <= 1'b0;
        valid_4 <= 1'b0;
        valid_5 <= 1'b0;
        valid_6 <= 1'b0;
        valid_7 <= 1'b0;
        valid_8 <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    totalCnt <= (channelTimes * colNumIn);
    wrAddr <= rdAddr;
    sData_payload_regNext <= sData_payload;
    sData_fire_1_regNext <= sData_fire_1;
    sData_fire_2_regNext <= sData_fire_2;
    valid_0_delay_1 <= valid_0;
    valid_0_delay_2 <= valid_0_delay_1;
    valid_0_delay_3 <= valid_0_delay_2;
    valid_3_delay_1 <= valid_3;
    valid_3_delay_2 <= valid_3_delay_1;
    valid_3_delay_3 <= valid_3_delay_2;
    valid_6_delay_1 <= valid_6;
    valid_6_delay_2 <= valid_6_delay_1;
    valid_6_delay_3 <= valid_6_delay_2;
    valid_1_delay_1 <= valid_1;
    valid_1_delay_2 <= valid_1_delay_1;
    valid_4_delay_1 <= valid_4;
    valid_4_delay_2 <= valid_4_delay_1;
    valid_7_delay_1 <= valid_7;
    valid_7_delay_2 <= valid_7_delay_1;
    valid_2_delay_1 <= valid_2;
    valid_5_delay_1 <= valid_5;
    valid_8_delay_1 <= valid_8;
    mData_mData_1_payload_regNext <= mData_mData_1_payload;
    mData_mData_2_payload_regNext <= mData_mData_2_payload;
    rdData_1_regNext <= rdData_1;
    mData_mData_4_payload_regNext <= mData_mData_4_payload;
    mData_mData_5_payload_regNext <= mData_mData_5_payload;
    rdData_0_regNext <= rdData_0;
    mData_mData_7_payload_regNext <= mData_mData_7_payload;
    mData_mData_8_payload_regNext <= mData_mData_8_payload;
    sData_payload_regNext_1 <= sData_payload;
    sData_payload_regNext_1_regNext <= sData_payload_regNext_1;
  end


endmodule

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
