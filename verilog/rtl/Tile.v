// Generator : SpinalHDL v1.7.2    git head : 08fc866bebdc40c471ebe327bface63e34406489
// Component : Tile
// Git hash  : 87d3217b70f0fccaa4ef4bd012ac3c72200878d3
// Date      : 16/02/2023, 09:21:13

`timescale 1ns/1ps

module Tile (
  input               Weight_CE,
  input               Feature_CE,
  input      [7:0]    Weight_Array_0_0,
  input      [7:0]    Weight_Array_0_1,
  input      [7:0]    Weight_Array_0_2,
  input      [7:0]    Weight_Array_0_3,
  input      [7:0]    Weight_Array_0_4,
  input      [7:0]    Weight_Array_0_5,
  input      [7:0]    Weight_Array_0_6,
  input      [7:0]    Weight_Array_0_7,
  input      [7:0]    Weight_Array_0_8,
  input      [7:0]    Weight_Array_1_0,
  input      [7:0]    Weight_Array_1_1,
  input      [7:0]    Weight_Array_1_2,
  input      [7:0]    Weight_Array_1_3,
  input      [7:0]    Weight_Array_1_4,
  input      [7:0]    Weight_Array_1_5,
  input      [7:0]    Weight_Array_1_6,
  input      [7:0]    Weight_Array_1_7,
  input      [7:0]    Weight_Array_1_8,
  input      [7:0]    Weight_Array_2_0,
  input      [7:0]    Weight_Array_2_1,
  input      [7:0]    Weight_Array_2_2,
  input      [7:0]    Weight_Array_2_3,
  input      [7:0]    Weight_Array_2_4,
  input      [7:0]    Weight_Array_2_5,
  input      [7:0]    Weight_Array_2_6,
  input      [7:0]    Weight_Array_2_7,
  input      [7:0]    Weight_Array_2_8,
  input      [7:0]    Weight_Array_3_0,
  input      [7:0]    Weight_Array_3_1,
  input      [7:0]    Weight_Array_3_2,
  input      [7:0]    Weight_Array_3_3,
  input      [7:0]    Weight_Array_3_4,
  input      [7:0]    Weight_Array_3_5,
  input      [7:0]    Weight_Array_3_6,
  input      [7:0]    Weight_Array_3_7,
  input      [7:0]    Weight_Array_3_8,
  input      [7:0]    Weight_Array_4_0,
  input      [7:0]    Weight_Array_4_1,
  input      [7:0]    Weight_Array_4_2,
  input      [7:0]    Weight_Array_4_3,
  input      [7:0]    Weight_Array_4_4,
  input      [7:0]    Weight_Array_4_5,
  input      [7:0]    Weight_Array_4_6,
  input      [7:0]    Weight_Array_4_7,
  input      [7:0]    Weight_Array_4_8,
  input      [7:0]    Weight_Array_5_0,
  input      [7:0]    Weight_Array_5_1,
  input      [7:0]    Weight_Array_5_2,
  input      [7:0]    Weight_Array_5_3,
  input      [7:0]    Weight_Array_5_4,
  input      [7:0]    Weight_Array_5_5,
  input      [7:0]    Weight_Array_5_6,
  input      [7:0]    Weight_Array_5_7,
  input      [7:0]    Weight_Array_5_8,
  input      [7:0]    Weight_Array_6_0,
  input      [7:0]    Weight_Array_6_1,
  input      [7:0]    Weight_Array_6_2,
  input      [7:0]    Weight_Array_6_3,
  input      [7:0]    Weight_Array_6_4,
  input      [7:0]    Weight_Array_6_5,
  input      [7:0]    Weight_Array_6_6,
  input      [7:0]    Weight_Array_6_7,
  input      [7:0]    Weight_Array_6_8,
  input      [7:0]    Weight_Array_7_0,
  input      [7:0]    Weight_Array_7_1,
  input      [7:0]    Weight_Array_7_2,
  input      [7:0]    Weight_Array_7_3,
  input      [7:0]    Weight_Array_7_4,
  input      [7:0]    Weight_Array_7_5,
  input      [7:0]    Weight_Array_7_6,
  input      [7:0]    Weight_Array_7_7,
  input      [7:0]    Weight_Array_7_8,
  input      [7:0]    Feature_Array_0,
  input      [7:0]    Feature_Array_1,
  input      [7:0]    Feature_Array_2,
  input      [7:0]    Feature_Array_3,
  input      [7:0]    Feature_Array_4,
  input      [7:0]    Feature_Array_5,
  input      [7:0]    Feature_Array_6,
  input      [7:0]    Feature_Array_7,
  output              firstColWeightChange,
  input               clk,
  input               reset
);

  wire                pE_72_weight_CE;
  wire                pE_72_feature_CE;
  wire                pE_73_weight_CE;
  wire                pE_73_feature_CE;
  wire                pE_74_weight_CE;
  wire                pE_74_feature_CE;
  wire                pE_75_weight_CE;
  wire                pE_75_feature_CE;
  wire                pE_76_weight_CE;
  wire                pE_76_feature_CE;
  wire                pE_77_weight_CE;
  wire                pE_77_feature_CE;
  wire                pE_78_weight_CE;
  wire                pE_78_feature_CE;
  wire                pE_79_weight_CE;
  wire                pE_79_feature_CE;
  wire                pE_80_weight_CE;
  wire                pE_80_feature_CE;
  wire                pE_81_weight_CE;
  wire                pE_81_feature_CE;
  wire                pE_82_weight_CE;
  wire                pE_82_feature_CE;
  wire                pE_83_weight_CE;
  wire                pE_83_feature_CE;
  wire                pE_84_weight_CE;
  wire                pE_84_feature_CE;
  wire                pE_85_weight_CE;
  wire                pE_85_feature_CE;
  wire                pE_86_weight_CE;
  wire                pE_86_feature_CE;
  wire                pE_87_weight_CE;
  wire                pE_87_feature_CE;
  wire                pE_88_weight_CE;
  wire                pE_88_feature_CE;
  wire                pE_89_weight_CE;
  wire                pE_89_feature_CE;
  wire                pE_90_weight_CE;
  wire                pE_90_feature_CE;
  wire                pE_91_weight_CE;
  wire                pE_91_feature_CE;
  wire                pE_92_weight_CE;
  wire                pE_92_feature_CE;
  wire                pE_93_weight_CE;
  wire                pE_93_feature_CE;
  wire                pE_94_weight_CE;
  wire                pE_94_feature_CE;
  wire                pE_95_weight_CE;
  wire                pE_95_feature_CE;
  wire                pE_96_weight_CE;
  wire                pE_96_feature_CE;
  wire                pE_97_weight_CE;
  wire                pE_97_feature_CE;
  wire                pE_98_weight_CE;
  wire                pE_98_feature_CE;
  wire                pE_99_weight_CE;
  wire                pE_99_feature_CE;
  wire                pE_100_weight_CE;
  wire                pE_100_feature_CE;
  wire                pE_101_weight_CE;
  wire                pE_101_feature_CE;
  wire                pE_102_weight_CE;
  wire                pE_102_feature_CE;
  wire                pE_103_weight_CE;
  wire                pE_103_feature_CE;
  wire                pE_104_weight_CE;
  wire                pE_104_feature_CE;
  wire                pE_105_weight_CE;
  wire                pE_105_feature_CE;
  wire                pE_106_weight_CE;
  wire                pE_106_feature_CE;
  wire                pE_107_weight_CE;
  wire                pE_107_feature_CE;
  wire                pE_108_weight_CE;
  wire                pE_108_feature_CE;
  wire                pE_109_weight_CE;
  wire                pE_109_feature_CE;
  wire                pE_110_weight_CE;
  wire                pE_110_feature_CE;
  wire                pE_111_weight_CE;
  wire                pE_111_feature_CE;
  wire                pE_112_weight_CE;
  wire                pE_112_feature_CE;
  wire                pE_113_weight_CE;
  wire                pE_113_feature_CE;
  wire                pE_114_weight_CE;
  wire                pE_114_feature_CE;
  wire                pE_115_weight_CE;
  wire                pE_115_feature_CE;
  wire                pE_116_weight_CE;
  wire                pE_116_feature_CE;
  wire                pE_117_weight_CE;
  wire                pE_117_feature_CE;
  wire                pE_118_weight_CE;
  wire                pE_118_feature_CE;
  wire                pE_119_weight_CE;
  wire                pE_119_feature_CE;
  wire                pE_120_weight_CE;
  wire                pE_120_feature_CE;
  wire                pE_121_weight_CE;
  wire                pE_121_feature_CE;
  wire                pE_122_weight_CE;
  wire                pE_122_feature_CE;
  wire                pE_123_weight_CE;
  wire                pE_123_feature_CE;
  wire                pE_124_weight_CE;
  wire                pE_124_feature_CE;
  wire                pE_125_weight_CE;
  wire                pE_125_feature_CE;
  wire                pE_126_weight_CE;
  wire                pE_126_feature_CE;
  wire                pE_127_weight_CE;
  wire                pE_127_feature_CE;
  reg        [31:0]   colAdd_1_result_col_0;
  reg        [31:0]   colAdd_1_result_col_1;
  reg        [31:0]   colAdd_1_result_col_2;
  reg        [31:0]   colAdd_1_result_col_3;
  reg        [31:0]   colAdd_1_result_col_4;
  reg        [31:0]   colAdd_1_result_col_5;
  reg        [31:0]   colAdd_1_result_col_6;
  reg        [31:0]   colAdd_1_result_col_7;
  reg                 colAdd_1_startAdd;
  wire       [7:0]    pE_64_feature_out;
  wire       [31:0]   pE_64_result;
  wire                pE_64_computeDone;
  wire                pE_64_weightDone;
  wire       [7:0]    pE_65_feature_out;
  wire       [31:0]   pE_65_result;
  wire                pE_65_computeDone;
  wire                pE_65_weightDone;
  wire       [7:0]    pE_66_feature_out;
  wire       [31:0]   pE_66_result;
  wire                pE_66_computeDone;
  wire                pE_66_weightDone;
  wire       [7:0]    pE_67_feature_out;
  wire       [31:0]   pE_67_result;
  wire                pE_67_computeDone;
  wire                pE_67_weightDone;
  wire       [7:0]    pE_68_feature_out;
  wire       [31:0]   pE_68_result;
  wire                pE_68_computeDone;
  wire                pE_68_weightDone;
  wire       [7:0]    pE_69_feature_out;
  wire       [31:0]   pE_69_result;
  wire                pE_69_computeDone;
  wire                pE_69_weightDone;
  wire       [7:0]    pE_70_feature_out;
  wire       [31:0]   pE_70_result;
  wire                pE_70_computeDone;
  wire                pE_70_weightDone;
  wire       [7:0]    pE_71_feature_out;
  wire       [31:0]   pE_71_result;
  wire                pE_71_computeDone;
  wire                pE_71_weightDone;
  wire       [7:0]    pE_72_feature_out;
  wire       [31:0]   pE_72_result;
  wire                pE_72_computeDone;
  wire                pE_72_weightDone;
  wire       [7:0]    pE_73_feature_out;
  wire       [31:0]   pE_73_result;
  wire                pE_73_computeDone;
  wire                pE_73_weightDone;
  wire       [7:0]    pE_74_feature_out;
  wire       [31:0]   pE_74_result;
  wire                pE_74_computeDone;
  wire                pE_74_weightDone;
  wire       [7:0]    pE_75_feature_out;
  wire       [31:0]   pE_75_result;
  wire                pE_75_computeDone;
  wire                pE_75_weightDone;
  wire       [7:0]    pE_76_feature_out;
  wire       [31:0]   pE_76_result;
  wire                pE_76_computeDone;
  wire                pE_76_weightDone;
  wire       [7:0]    pE_77_feature_out;
  wire       [31:0]   pE_77_result;
  wire                pE_77_computeDone;
  wire                pE_77_weightDone;
  wire       [7:0]    pE_78_feature_out;
  wire       [31:0]   pE_78_result;
  wire                pE_78_computeDone;
  wire                pE_78_weightDone;
  wire       [7:0]    pE_79_feature_out;
  wire       [31:0]   pE_79_result;
  wire                pE_79_computeDone;
  wire                pE_79_weightDone;
  wire       [7:0]    pE_80_feature_out;
  wire       [31:0]   pE_80_result;
  wire                pE_80_computeDone;
  wire                pE_80_weightDone;
  wire       [7:0]    pE_81_feature_out;
  wire       [31:0]   pE_81_result;
  wire                pE_81_computeDone;
  wire                pE_81_weightDone;
  wire       [7:0]    pE_82_feature_out;
  wire       [31:0]   pE_82_result;
  wire                pE_82_computeDone;
  wire                pE_82_weightDone;
  wire       [7:0]    pE_83_feature_out;
  wire       [31:0]   pE_83_result;
  wire                pE_83_computeDone;
  wire                pE_83_weightDone;
  wire       [7:0]    pE_84_feature_out;
  wire       [31:0]   pE_84_result;
  wire                pE_84_computeDone;
  wire                pE_84_weightDone;
  wire       [7:0]    pE_85_feature_out;
  wire       [31:0]   pE_85_result;
  wire                pE_85_computeDone;
  wire                pE_85_weightDone;
  wire       [7:0]    pE_86_feature_out;
  wire       [31:0]   pE_86_result;
  wire                pE_86_computeDone;
  wire                pE_86_weightDone;
  wire       [7:0]    pE_87_feature_out;
  wire       [31:0]   pE_87_result;
  wire                pE_87_computeDone;
  wire                pE_87_weightDone;
  wire       [7:0]    pE_88_feature_out;
  wire       [31:0]   pE_88_result;
  wire                pE_88_computeDone;
  wire                pE_88_weightDone;
  wire       [7:0]    pE_89_feature_out;
  wire       [31:0]   pE_89_result;
  wire                pE_89_computeDone;
  wire                pE_89_weightDone;
  wire       [7:0]    pE_90_feature_out;
  wire       [31:0]   pE_90_result;
  wire                pE_90_computeDone;
  wire                pE_90_weightDone;
  wire       [7:0]    pE_91_feature_out;
  wire       [31:0]   pE_91_result;
  wire                pE_91_computeDone;
  wire                pE_91_weightDone;
  wire       [7:0]    pE_92_feature_out;
  wire       [31:0]   pE_92_result;
  wire                pE_92_computeDone;
  wire                pE_92_weightDone;
  wire       [7:0]    pE_93_feature_out;
  wire       [31:0]   pE_93_result;
  wire                pE_93_computeDone;
  wire                pE_93_weightDone;
  wire       [7:0]    pE_94_feature_out;
  wire       [31:0]   pE_94_result;
  wire                pE_94_computeDone;
  wire                pE_94_weightDone;
  wire       [7:0]    pE_95_feature_out;
  wire       [31:0]   pE_95_result;
  wire                pE_95_computeDone;
  wire                pE_95_weightDone;
  wire       [7:0]    pE_96_feature_out;
  wire       [31:0]   pE_96_result;
  wire                pE_96_computeDone;
  wire                pE_96_weightDone;
  wire       [7:0]    pE_97_feature_out;
  wire       [31:0]   pE_97_result;
  wire                pE_97_computeDone;
  wire                pE_97_weightDone;
  wire       [7:0]    pE_98_feature_out;
  wire       [31:0]   pE_98_result;
  wire                pE_98_computeDone;
  wire                pE_98_weightDone;
  wire       [7:0]    pE_99_feature_out;
  wire       [31:0]   pE_99_result;
  wire                pE_99_computeDone;
  wire                pE_99_weightDone;
  wire       [7:0]    pE_100_feature_out;
  wire       [31:0]   pE_100_result;
  wire                pE_100_computeDone;
  wire                pE_100_weightDone;
  wire       [7:0]    pE_101_feature_out;
  wire       [31:0]   pE_101_result;
  wire                pE_101_computeDone;
  wire                pE_101_weightDone;
  wire       [7:0]    pE_102_feature_out;
  wire       [31:0]   pE_102_result;
  wire                pE_102_computeDone;
  wire                pE_102_weightDone;
  wire       [7:0]    pE_103_feature_out;
  wire       [31:0]   pE_103_result;
  wire                pE_103_computeDone;
  wire                pE_103_weightDone;
  wire       [7:0]    pE_104_feature_out;
  wire       [31:0]   pE_104_result;
  wire                pE_104_computeDone;
  wire                pE_104_weightDone;
  wire       [7:0]    pE_105_feature_out;
  wire       [31:0]   pE_105_result;
  wire                pE_105_computeDone;
  wire                pE_105_weightDone;
  wire       [7:0]    pE_106_feature_out;
  wire       [31:0]   pE_106_result;
  wire                pE_106_computeDone;
  wire                pE_106_weightDone;
  wire       [7:0]    pE_107_feature_out;
  wire       [31:0]   pE_107_result;
  wire                pE_107_computeDone;
  wire                pE_107_weightDone;
  wire       [7:0]    pE_108_feature_out;
  wire       [31:0]   pE_108_result;
  wire                pE_108_computeDone;
  wire                pE_108_weightDone;
  wire       [7:0]    pE_109_feature_out;
  wire       [31:0]   pE_109_result;
  wire                pE_109_computeDone;
  wire                pE_109_weightDone;
  wire       [7:0]    pE_110_feature_out;
  wire       [31:0]   pE_110_result;
  wire                pE_110_computeDone;
  wire                pE_110_weightDone;
  wire       [7:0]    pE_111_feature_out;
  wire       [31:0]   pE_111_result;
  wire                pE_111_computeDone;
  wire                pE_111_weightDone;
  wire       [7:0]    pE_112_feature_out;
  wire       [31:0]   pE_112_result;
  wire                pE_112_computeDone;
  wire                pE_112_weightDone;
  wire       [7:0]    pE_113_feature_out;
  wire       [31:0]   pE_113_result;
  wire                pE_113_computeDone;
  wire                pE_113_weightDone;
  wire       [7:0]    pE_114_feature_out;
  wire       [31:0]   pE_114_result;
  wire                pE_114_computeDone;
  wire                pE_114_weightDone;
  wire       [7:0]    pE_115_feature_out;
  wire       [31:0]   pE_115_result;
  wire                pE_115_computeDone;
  wire                pE_115_weightDone;
  wire       [7:0]    pE_116_feature_out;
  wire       [31:0]   pE_116_result;
  wire                pE_116_computeDone;
  wire                pE_116_weightDone;
  wire       [7:0]    pE_117_feature_out;
  wire       [31:0]   pE_117_result;
  wire                pE_117_computeDone;
  wire                pE_117_weightDone;
  wire       [7:0]    pE_118_feature_out;
  wire       [31:0]   pE_118_result;
  wire                pE_118_computeDone;
  wire                pE_118_weightDone;
  wire       [7:0]    pE_119_feature_out;
  wire       [31:0]   pE_119_result;
  wire                pE_119_computeDone;
  wire                pE_119_weightDone;
  wire       [7:0]    pE_120_feature_out;
  wire       [31:0]   pE_120_result;
  wire                pE_120_computeDone;
  wire                pE_120_weightDone;
  wire       [7:0]    pE_121_feature_out;
  wire       [31:0]   pE_121_result;
  wire                pE_121_computeDone;
  wire                pE_121_weightDone;
  wire       [7:0]    pE_122_feature_out;
  wire       [31:0]   pE_122_result;
  wire                pE_122_computeDone;
  wire                pE_122_weightDone;
  wire       [7:0]    pE_123_feature_out;
  wire       [31:0]   pE_123_result;
  wire                pE_123_computeDone;
  wire                pE_123_weightDone;
  wire       [7:0]    pE_124_feature_out;
  wire       [31:0]   pE_124_result;
  wire                pE_124_computeDone;
  wire                pE_124_weightDone;
  wire       [7:0]    pE_125_feature_out;
  wire       [31:0]   pE_125_result;
  wire                pE_125_computeDone;
  wire                pE_125_weightDone;
  wire       [7:0]    pE_126_feature_out;
  wire       [31:0]   pE_126_result;
  wire                pE_126_computeDone;
  wire                pE_126_weightDone;
  wire       [7:0]    pE_127_feature_out;
  wire       [31:0]   pE_127_result;
  wire                pE_127_computeDone;
  wire                pE_127_weightDone;
  wire       [31:0]   colAdd_1_colAddResult;
  wire                colAdd_1_colAddResult_Valid;
  reg        [6:0]    Weight_CE_c;
  reg        [6:0]    Feature_CE_c;
  wire       [7:0]    Feature_cas_0_0;
  wire       [7:0]    Feature_cas_0_1;
  wire       [7:0]    Feature_cas_0_2;
  wire       [7:0]    Feature_cas_0_3;
  wire       [7:0]    Feature_cas_0_4;
  wire       [7:0]    Feature_cas_0_5;
  wire       [7:0]    Feature_cas_0_6;
  wire       [7:0]    Feature_cas_0_7;
  wire       [7:0]    Feature_cas_1_0;
  wire       [7:0]    Feature_cas_1_1;
  wire       [7:0]    Feature_cas_1_2;
  wire       [7:0]    Feature_cas_1_3;
  wire       [7:0]    Feature_cas_1_4;
  wire       [7:0]    Feature_cas_1_5;
  wire       [7:0]    Feature_cas_1_6;
  wire       [7:0]    Feature_cas_1_7;
  wire       [7:0]    Feature_cas_2_0;
  wire       [7:0]    Feature_cas_2_1;
  wire       [7:0]    Feature_cas_2_2;
  wire       [7:0]    Feature_cas_2_3;
  wire       [7:0]    Feature_cas_2_4;
  wire       [7:0]    Feature_cas_2_5;
  wire       [7:0]    Feature_cas_2_6;
  wire       [7:0]    Feature_cas_2_7;
  wire       [7:0]    Feature_cas_3_0;
  wire       [7:0]    Feature_cas_3_1;
  wire       [7:0]    Feature_cas_3_2;
  wire       [7:0]    Feature_cas_3_3;
  wire       [7:0]    Feature_cas_3_4;
  wire       [7:0]    Feature_cas_3_5;
  wire       [7:0]    Feature_cas_3_6;
  wire       [7:0]    Feature_cas_3_7;
  wire       [7:0]    Feature_cas_4_0;
  wire       [7:0]    Feature_cas_4_1;
  wire       [7:0]    Feature_cas_4_2;
  wire       [7:0]    Feature_cas_4_3;
  wire       [7:0]    Feature_cas_4_4;
  wire       [7:0]    Feature_cas_4_5;
  wire       [7:0]    Feature_cas_4_6;
  wire       [7:0]    Feature_cas_4_7;
  wire       [7:0]    Feature_cas_5_0;
  wire       [7:0]    Feature_cas_5_1;
  wire       [7:0]    Feature_cas_5_2;
  wire       [7:0]    Feature_cas_5_3;
  wire       [7:0]    Feature_cas_5_4;
  wire       [7:0]    Feature_cas_5_5;
  wire       [7:0]    Feature_cas_5_6;
  wire       [7:0]    Feature_cas_5_7;
  wire       [7:0]    Feature_cas_6_0;
  wire       [7:0]    Feature_cas_6_1;
  wire       [7:0]    Feature_cas_6_2;
  wire       [7:0]    Feature_cas_6_3;
  wire       [7:0]    Feature_cas_6_4;
  wire       [7:0]    Feature_cas_6_5;
  wire       [7:0]    Feature_cas_6_6;
  wire       [7:0]    Feature_cas_6_7;
  wire       [7:0]    Feature_cas_7_0;
  wire       [7:0]    Feature_cas_7_1;
  wire       [7:0]    Feature_cas_7_2;
  wire       [7:0]    Feature_cas_7_3;
  wire       [7:0]    Feature_cas_7_4;
  wire       [7:0]    Feature_cas_7_5;
  wire       [7:0]    Feature_cas_7_6;
  wire       [7:0]    Feature_cas_7_7;
  wire       [31:0]   result_c_0_0;
  wire       [31:0]   result_c_0_1;
  wire       [31:0]   result_c_0_2;
  wire       [31:0]   result_c_0_3;
  wire       [31:0]   result_c_0_4;
  wire       [31:0]   result_c_0_5;
  wire       [31:0]   result_c_0_6;
  wire       [31:0]   result_c_0_7;
  wire       [31:0]   result_c_1_0;
  wire       [31:0]   result_c_1_1;
  wire       [31:0]   result_c_1_2;
  wire       [31:0]   result_c_1_3;
  wire       [31:0]   result_c_1_4;
  wire       [31:0]   result_c_1_5;
  wire       [31:0]   result_c_1_6;
  wire       [31:0]   result_c_1_7;
  wire       [31:0]   result_c_2_0;
  wire       [31:0]   result_c_2_1;
  wire       [31:0]   result_c_2_2;
  wire       [31:0]   result_c_2_3;
  wire       [31:0]   result_c_2_4;
  wire       [31:0]   result_c_2_5;
  wire       [31:0]   result_c_2_6;
  wire       [31:0]   result_c_2_7;
  wire       [31:0]   result_c_3_0;
  wire       [31:0]   result_c_3_1;
  wire       [31:0]   result_c_3_2;
  wire       [31:0]   result_c_3_3;
  wire       [31:0]   result_c_3_4;
  wire       [31:0]   result_c_3_5;
  wire       [31:0]   result_c_3_6;
  wire       [31:0]   result_c_3_7;
  wire       [31:0]   result_c_4_0;
  wire       [31:0]   result_c_4_1;
  wire       [31:0]   result_c_4_2;
  wire       [31:0]   result_c_4_3;
  wire       [31:0]   result_c_4_4;
  wire       [31:0]   result_c_4_5;
  wire       [31:0]   result_c_4_6;
  wire       [31:0]   result_c_4_7;
  wire       [31:0]   result_c_5_0;
  wire       [31:0]   result_c_5_1;
  wire       [31:0]   result_c_5_2;
  wire       [31:0]   result_c_5_3;
  wire       [31:0]   result_c_5_4;
  wire       [31:0]   result_c_5_5;
  wire       [31:0]   result_c_5_6;
  wire       [31:0]   result_c_5_7;
  wire       [31:0]   result_c_6_0;
  wire       [31:0]   result_c_6_1;
  wire       [31:0]   result_c_6_2;
  wire       [31:0]   result_c_6_3;
  wire       [31:0]   result_c_6_4;
  wire       [31:0]   result_c_6_5;
  wire       [31:0]   result_c_6_6;
  wire       [31:0]   result_c_6_7;
  wire       [31:0]   result_c_7_0;
  wire       [31:0]   result_c_7_1;
  wire       [31:0]   result_c_7_2;
  wire       [31:0]   result_c_7_3;
  wire       [31:0]   result_c_7_4;
  wire       [31:0]   result_c_7_5;
  wire       [31:0]   result_c_7_6;
  wire       [31:0]   result_c_7_7;
  reg        [7:0]    computeDone_C;
  wire       [31:0]   colAddResult;
  wire                colAddResult_Valid;

  PE pE_64 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_Array_0[7:0]  ), //i
    .feature_out (pE_64_feature_out[7:0]), //o
    .result      (pE_64_result[31:0]    ), //o
    .computeDone (pE_64_computeDone     ), //o
    .weightDone  (pE_64_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_65 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_Array_1[7:0]  ), //i
    .feature_out (pE_65_feature_out[7:0]), //o
    .result      (pE_65_result[31:0]    ), //o
    .computeDone (pE_65_computeDone     ), //o
    .weightDone  (pE_65_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_66 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_Array_2[7:0]  ), //i
    .feature_out (pE_66_feature_out[7:0]), //o
    .result      (pE_66_result[31:0]    ), //o
    .computeDone (pE_66_computeDone     ), //o
    .weightDone  (pE_66_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_67 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_Array_3[7:0]  ), //i
    .feature_out (pE_67_feature_out[7:0]), //o
    .result      (pE_67_result[31:0]    ), //o
    .computeDone (pE_67_computeDone     ), //o
    .weightDone  (pE_67_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_68 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_4_0[7:0] ), //i
    .weight_1    (Weight_Array_4_1[7:0] ), //i
    .weight_2    (Weight_Array_4_2[7:0] ), //i
    .weight_3    (Weight_Array_4_3[7:0] ), //i
    .weight_4    (Weight_Array_4_4[7:0] ), //i
    .weight_5    (Weight_Array_4_5[7:0] ), //i
    .weight_6    (Weight_Array_4_6[7:0] ), //i
    .weight_7    (Weight_Array_4_7[7:0] ), //i
    .weight_8    (Weight_Array_4_8[7:0] ), //i
    .feature     (Feature_Array_4[7:0]  ), //i
    .feature_out (pE_68_feature_out[7:0]), //o
    .result      (pE_68_result[31:0]    ), //o
    .computeDone (pE_68_computeDone     ), //o
    .weightDone  (pE_68_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_69 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_5_0[7:0] ), //i
    .weight_1    (Weight_Array_5_1[7:0] ), //i
    .weight_2    (Weight_Array_5_2[7:0] ), //i
    .weight_3    (Weight_Array_5_3[7:0] ), //i
    .weight_4    (Weight_Array_5_4[7:0] ), //i
    .weight_5    (Weight_Array_5_5[7:0] ), //i
    .weight_6    (Weight_Array_5_6[7:0] ), //i
    .weight_7    (Weight_Array_5_7[7:0] ), //i
    .weight_8    (Weight_Array_5_8[7:0] ), //i
    .feature     (Feature_Array_5[7:0]  ), //i
    .feature_out (pE_69_feature_out[7:0]), //o
    .result      (pE_69_result[31:0]    ), //o
    .computeDone (pE_69_computeDone     ), //o
    .weightDone  (pE_69_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_70 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_6_0[7:0] ), //i
    .weight_1    (Weight_Array_6_1[7:0] ), //i
    .weight_2    (Weight_Array_6_2[7:0] ), //i
    .weight_3    (Weight_Array_6_3[7:0] ), //i
    .weight_4    (Weight_Array_6_4[7:0] ), //i
    .weight_5    (Weight_Array_6_5[7:0] ), //i
    .weight_6    (Weight_Array_6_6[7:0] ), //i
    .weight_7    (Weight_Array_6_7[7:0] ), //i
    .weight_8    (Weight_Array_6_8[7:0] ), //i
    .feature     (Feature_Array_6[7:0]  ), //i
    .feature_out (pE_70_feature_out[7:0]), //o
    .result      (pE_70_result[31:0]    ), //o
    .computeDone (pE_70_computeDone     ), //o
    .weightDone  (pE_70_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_71 (
    .weight_CE   (Weight_CE             ), //i
    .feature_CE  (Feature_CE            ), //i
    .weight_0    (Weight_Array_7_0[7:0] ), //i
    .weight_1    (Weight_Array_7_1[7:0] ), //i
    .weight_2    (Weight_Array_7_2[7:0] ), //i
    .weight_3    (Weight_Array_7_3[7:0] ), //i
    .weight_4    (Weight_Array_7_4[7:0] ), //i
    .weight_5    (Weight_Array_7_5[7:0] ), //i
    .weight_6    (Weight_Array_7_6[7:0] ), //i
    .weight_7    (Weight_Array_7_7[7:0] ), //i
    .weight_8    (Weight_Array_7_8[7:0] ), //i
    .feature     (Feature_Array_7[7:0]  ), //i
    .feature_out (pE_71_feature_out[7:0]), //o
    .result      (pE_71_result[31:0]    ), //o
    .computeDone (pE_71_computeDone     ), //o
    .weightDone  (pE_71_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_72 (
    .weight_CE   (pE_72_weight_CE       ), //i
    .feature_CE  (pE_72_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_0[7:0]  ), //i
    .feature_out (pE_72_feature_out[7:0]), //o
    .result      (pE_72_result[31:0]    ), //o
    .computeDone (pE_72_computeDone     ), //o
    .weightDone  (pE_72_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_73 (
    .weight_CE   (pE_73_weight_CE       ), //i
    .feature_CE  (pE_73_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_1[7:0]  ), //i
    .feature_out (pE_73_feature_out[7:0]), //o
    .result      (pE_73_result[31:0]    ), //o
    .computeDone (pE_73_computeDone     ), //o
    .weightDone  (pE_73_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_74 (
    .weight_CE   (pE_74_weight_CE       ), //i
    .feature_CE  (pE_74_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_2[7:0]  ), //i
    .feature_out (pE_74_feature_out[7:0]), //o
    .result      (pE_74_result[31:0]    ), //o
    .computeDone (pE_74_computeDone     ), //o
    .weightDone  (pE_74_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_75 (
    .weight_CE   (pE_75_weight_CE       ), //i
    .feature_CE  (pE_75_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_3[7:0]  ), //i
    .feature_out (pE_75_feature_out[7:0]), //o
    .result      (pE_75_result[31:0]    ), //o
    .computeDone (pE_75_computeDone     ), //o
    .weightDone  (pE_75_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_76 (
    .weight_CE   (pE_76_weight_CE       ), //i
    .feature_CE  (pE_76_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_4[7:0]  ), //i
    .feature_out (pE_76_feature_out[7:0]), //o
    .result      (pE_76_result[31:0]    ), //o
    .computeDone (pE_76_computeDone     ), //o
    .weightDone  (pE_76_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_77 (
    .weight_CE   (pE_77_weight_CE       ), //i
    .feature_CE  (pE_77_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_5[7:0]  ), //i
    .feature_out (pE_77_feature_out[7:0]), //o
    .result      (pE_77_result[31:0]    ), //o
    .computeDone (pE_77_computeDone     ), //o
    .weightDone  (pE_77_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_78 (
    .weight_CE   (pE_78_weight_CE       ), //i
    .feature_CE  (pE_78_feature_CE      ), //i
    .weight_0    (Weight_Array_0_0[7:0] ), //i
    .weight_1    (Weight_Array_0_1[7:0] ), //i
    .weight_2    (Weight_Array_0_2[7:0] ), //i
    .weight_3    (Weight_Array_0_3[7:0] ), //i
    .weight_4    (Weight_Array_0_4[7:0] ), //i
    .weight_5    (Weight_Array_0_5[7:0] ), //i
    .weight_6    (Weight_Array_0_6[7:0] ), //i
    .weight_7    (Weight_Array_0_7[7:0] ), //i
    .weight_8    (Weight_Array_0_8[7:0] ), //i
    .feature     (Feature_cas_0_6[7:0]  ), //i
    .feature_out (pE_78_feature_out[7:0]), //o
    .result      (pE_78_result[31:0]    ), //o
    .computeDone (pE_78_computeDone     ), //o
    .weightDone  (pE_78_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_79 (
    .weight_CE   (pE_79_weight_CE       ), //i
    .feature_CE  (pE_79_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_0[7:0]  ), //i
    .feature_out (pE_79_feature_out[7:0]), //o
    .result      (pE_79_result[31:0]    ), //o
    .computeDone (pE_79_computeDone     ), //o
    .weightDone  (pE_79_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_80 (
    .weight_CE   (pE_80_weight_CE       ), //i
    .feature_CE  (pE_80_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_1[7:0]  ), //i
    .feature_out (pE_80_feature_out[7:0]), //o
    .result      (pE_80_result[31:0]    ), //o
    .computeDone (pE_80_computeDone     ), //o
    .weightDone  (pE_80_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_81 (
    .weight_CE   (pE_81_weight_CE       ), //i
    .feature_CE  (pE_81_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_2[7:0]  ), //i
    .feature_out (pE_81_feature_out[7:0]), //o
    .result      (pE_81_result[31:0]    ), //o
    .computeDone (pE_81_computeDone     ), //o
    .weightDone  (pE_81_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_82 (
    .weight_CE   (pE_82_weight_CE       ), //i
    .feature_CE  (pE_82_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_3[7:0]  ), //i
    .feature_out (pE_82_feature_out[7:0]), //o
    .result      (pE_82_result[31:0]    ), //o
    .computeDone (pE_82_computeDone     ), //o
    .weightDone  (pE_82_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_83 (
    .weight_CE   (pE_83_weight_CE       ), //i
    .feature_CE  (pE_83_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_4[7:0]  ), //i
    .feature_out (pE_83_feature_out[7:0]), //o
    .result      (pE_83_result[31:0]    ), //o
    .computeDone (pE_83_computeDone     ), //o
    .weightDone  (pE_83_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_84 (
    .weight_CE   (pE_84_weight_CE       ), //i
    .feature_CE  (pE_84_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_5[7:0]  ), //i
    .feature_out (pE_84_feature_out[7:0]), //o
    .result      (pE_84_result[31:0]    ), //o
    .computeDone (pE_84_computeDone     ), //o
    .weightDone  (pE_84_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_85 (
    .weight_CE   (pE_85_weight_CE       ), //i
    .feature_CE  (pE_85_feature_CE      ), //i
    .weight_0    (Weight_Array_1_0[7:0] ), //i
    .weight_1    (Weight_Array_1_1[7:0] ), //i
    .weight_2    (Weight_Array_1_2[7:0] ), //i
    .weight_3    (Weight_Array_1_3[7:0] ), //i
    .weight_4    (Weight_Array_1_4[7:0] ), //i
    .weight_5    (Weight_Array_1_5[7:0] ), //i
    .weight_6    (Weight_Array_1_6[7:0] ), //i
    .weight_7    (Weight_Array_1_7[7:0] ), //i
    .weight_8    (Weight_Array_1_8[7:0] ), //i
    .feature     (Feature_cas_1_6[7:0]  ), //i
    .feature_out (pE_85_feature_out[7:0]), //o
    .result      (pE_85_result[31:0]    ), //o
    .computeDone (pE_85_computeDone     ), //o
    .weightDone  (pE_85_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_86 (
    .weight_CE   (pE_86_weight_CE       ), //i
    .feature_CE  (pE_86_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_0[7:0]  ), //i
    .feature_out (pE_86_feature_out[7:0]), //o
    .result      (pE_86_result[31:0]    ), //o
    .computeDone (pE_86_computeDone     ), //o
    .weightDone  (pE_86_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_87 (
    .weight_CE   (pE_87_weight_CE       ), //i
    .feature_CE  (pE_87_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_1[7:0]  ), //i
    .feature_out (pE_87_feature_out[7:0]), //o
    .result      (pE_87_result[31:0]    ), //o
    .computeDone (pE_87_computeDone     ), //o
    .weightDone  (pE_87_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_88 (
    .weight_CE   (pE_88_weight_CE       ), //i
    .feature_CE  (pE_88_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_2[7:0]  ), //i
    .feature_out (pE_88_feature_out[7:0]), //o
    .result      (pE_88_result[31:0]    ), //o
    .computeDone (pE_88_computeDone     ), //o
    .weightDone  (pE_88_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_89 (
    .weight_CE   (pE_89_weight_CE       ), //i
    .feature_CE  (pE_89_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_3[7:0]  ), //i
    .feature_out (pE_89_feature_out[7:0]), //o
    .result      (pE_89_result[31:0]    ), //o
    .computeDone (pE_89_computeDone     ), //o
    .weightDone  (pE_89_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_90 (
    .weight_CE   (pE_90_weight_CE       ), //i
    .feature_CE  (pE_90_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_4[7:0]  ), //i
    .feature_out (pE_90_feature_out[7:0]), //o
    .result      (pE_90_result[31:0]    ), //o
    .computeDone (pE_90_computeDone     ), //o
    .weightDone  (pE_90_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_91 (
    .weight_CE   (pE_91_weight_CE       ), //i
    .feature_CE  (pE_91_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_5[7:0]  ), //i
    .feature_out (pE_91_feature_out[7:0]), //o
    .result      (pE_91_result[31:0]    ), //o
    .computeDone (pE_91_computeDone     ), //o
    .weightDone  (pE_91_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_92 (
    .weight_CE   (pE_92_weight_CE       ), //i
    .feature_CE  (pE_92_feature_CE      ), //i
    .weight_0    (Weight_Array_2_0[7:0] ), //i
    .weight_1    (Weight_Array_2_1[7:0] ), //i
    .weight_2    (Weight_Array_2_2[7:0] ), //i
    .weight_3    (Weight_Array_2_3[7:0] ), //i
    .weight_4    (Weight_Array_2_4[7:0] ), //i
    .weight_5    (Weight_Array_2_5[7:0] ), //i
    .weight_6    (Weight_Array_2_6[7:0] ), //i
    .weight_7    (Weight_Array_2_7[7:0] ), //i
    .weight_8    (Weight_Array_2_8[7:0] ), //i
    .feature     (Feature_cas_2_6[7:0]  ), //i
    .feature_out (pE_92_feature_out[7:0]), //o
    .result      (pE_92_result[31:0]    ), //o
    .computeDone (pE_92_computeDone     ), //o
    .weightDone  (pE_92_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_93 (
    .weight_CE   (pE_93_weight_CE       ), //i
    .feature_CE  (pE_93_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_0[7:0]  ), //i
    .feature_out (pE_93_feature_out[7:0]), //o
    .result      (pE_93_result[31:0]    ), //o
    .computeDone (pE_93_computeDone     ), //o
    .weightDone  (pE_93_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_94 (
    .weight_CE   (pE_94_weight_CE       ), //i
    .feature_CE  (pE_94_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_1[7:0]  ), //i
    .feature_out (pE_94_feature_out[7:0]), //o
    .result      (pE_94_result[31:0]    ), //o
    .computeDone (pE_94_computeDone     ), //o
    .weightDone  (pE_94_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_95 (
    .weight_CE   (pE_95_weight_CE       ), //i
    .feature_CE  (pE_95_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_2[7:0]  ), //i
    .feature_out (pE_95_feature_out[7:0]), //o
    .result      (pE_95_result[31:0]    ), //o
    .computeDone (pE_95_computeDone     ), //o
    .weightDone  (pE_95_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_96 (
    .weight_CE   (pE_96_weight_CE       ), //i
    .feature_CE  (pE_96_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_3[7:0]  ), //i
    .feature_out (pE_96_feature_out[7:0]), //o
    .result      (pE_96_result[31:0]    ), //o
    .computeDone (pE_96_computeDone     ), //o
    .weightDone  (pE_96_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_97 (
    .weight_CE   (pE_97_weight_CE       ), //i
    .feature_CE  (pE_97_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_4[7:0]  ), //i
    .feature_out (pE_97_feature_out[7:0]), //o
    .result      (pE_97_result[31:0]    ), //o
    .computeDone (pE_97_computeDone     ), //o
    .weightDone  (pE_97_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_98 (
    .weight_CE   (pE_98_weight_CE       ), //i
    .feature_CE  (pE_98_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_5[7:0]  ), //i
    .feature_out (pE_98_feature_out[7:0]), //o
    .result      (pE_98_result[31:0]    ), //o
    .computeDone (pE_98_computeDone     ), //o
    .weightDone  (pE_98_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_99 (
    .weight_CE   (pE_99_weight_CE       ), //i
    .feature_CE  (pE_99_feature_CE      ), //i
    .weight_0    (Weight_Array_3_0[7:0] ), //i
    .weight_1    (Weight_Array_3_1[7:0] ), //i
    .weight_2    (Weight_Array_3_2[7:0] ), //i
    .weight_3    (Weight_Array_3_3[7:0] ), //i
    .weight_4    (Weight_Array_3_4[7:0] ), //i
    .weight_5    (Weight_Array_3_5[7:0] ), //i
    .weight_6    (Weight_Array_3_6[7:0] ), //i
    .weight_7    (Weight_Array_3_7[7:0] ), //i
    .weight_8    (Weight_Array_3_8[7:0] ), //i
    .feature     (Feature_cas_3_6[7:0]  ), //i
    .feature_out (pE_99_feature_out[7:0]), //o
    .result      (pE_99_result[31:0]    ), //o
    .computeDone (pE_99_computeDone     ), //o
    .weightDone  (pE_99_weightDone      ), //o
    .clk         (clk                   ), //i
    .reset       (reset                 )  //i
  );
  PE pE_100 (
    .weight_CE   (pE_100_weight_CE       ), //i
    .feature_CE  (pE_100_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_0[7:0]   ), //i
    .feature_out (pE_100_feature_out[7:0]), //o
    .result      (pE_100_result[31:0]    ), //o
    .computeDone (pE_100_computeDone     ), //o
    .weightDone  (pE_100_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_101 (
    .weight_CE   (pE_101_weight_CE       ), //i
    .feature_CE  (pE_101_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_1[7:0]   ), //i
    .feature_out (pE_101_feature_out[7:0]), //o
    .result      (pE_101_result[31:0]    ), //o
    .computeDone (pE_101_computeDone     ), //o
    .weightDone  (pE_101_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_102 (
    .weight_CE   (pE_102_weight_CE       ), //i
    .feature_CE  (pE_102_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_2[7:0]   ), //i
    .feature_out (pE_102_feature_out[7:0]), //o
    .result      (pE_102_result[31:0]    ), //o
    .computeDone (pE_102_computeDone     ), //o
    .weightDone  (pE_102_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_103 (
    .weight_CE   (pE_103_weight_CE       ), //i
    .feature_CE  (pE_103_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_3[7:0]   ), //i
    .feature_out (pE_103_feature_out[7:0]), //o
    .result      (pE_103_result[31:0]    ), //o
    .computeDone (pE_103_computeDone     ), //o
    .weightDone  (pE_103_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_104 (
    .weight_CE   (pE_104_weight_CE       ), //i
    .feature_CE  (pE_104_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_4[7:0]   ), //i
    .feature_out (pE_104_feature_out[7:0]), //o
    .result      (pE_104_result[31:0]    ), //o
    .computeDone (pE_104_computeDone     ), //o
    .weightDone  (pE_104_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_105 (
    .weight_CE   (pE_105_weight_CE       ), //i
    .feature_CE  (pE_105_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_5[7:0]   ), //i
    .feature_out (pE_105_feature_out[7:0]), //o
    .result      (pE_105_result[31:0]    ), //o
    .computeDone (pE_105_computeDone     ), //o
    .weightDone  (pE_105_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_106 (
    .weight_CE   (pE_106_weight_CE       ), //i
    .feature_CE  (pE_106_feature_CE      ), //i
    .weight_0    (Weight_Array_4_0[7:0]  ), //i
    .weight_1    (Weight_Array_4_1[7:0]  ), //i
    .weight_2    (Weight_Array_4_2[7:0]  ), //i
    .weight_3    (Weight_Array_4_3[7:0]  ), //i
    .weight_4    (Weight_Array_4_4[7:0]  ), //i
    .weight_5    (Weight_Array_4_5[7:0]  ), //i
    .weight_6    (Weight_Array_4_6[7:0]  ), //i
    .weight_7    (Weight_Array_4_7[7:0]  ), //i
    .weight_8    (Weight_Array_4_8[7:0]  ), //i
    .feature     (Feature_cas_4_6[7:0]   ), //i
    .feature_out (pE_106_feature_out[7:0]), //o
    .result      (pE_106_result[31:0]    ), //o
    .computeDone (pE_106_computeDone     ), //o
    .weightDone  (pE_106_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_107 (
    .weight_CE   (pE_107_weight_CE       ), //i
    .feature_CE  (pE_107_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_0[7:0]   ), //i
    .feature_out (pE_107_feature_out[7:0]), //o
    .result      (pE_107_result[31:0]    ), //o
    .computeDone (pE_107_computeDone     ), //o
    .weightDone  (pE_107_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_108 (
    .weight_CE   (pE_108_weight_CE       ), //i
    .feature_CE  (pE_108_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_1[7:0]   ), //i
    .feature_out (pE_108_feature_out[7:0]), //o
    .result      (pE_108_result[31:0]    ), //o
    .computeDone (pE_108_computeDone     ), //o
    .weightDone  (pE_108_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_109 (
    .weight_CE   (pE_109_weight_CE       ), //i
    .feature_CE  (pE_109_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_2[7:0]   ), //i
    .feature_out (pE_109_feature_out[7:0]), //o
    .result      (pE_109_result[31:0]    ), //o
    .computeDone (pE_109_computeDone     ), //o
    .weightDone  (pE_109_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_110 (
    .weight_CE   (pE_110_weight_CE       ), //i
    .feature_CE  (pE_110_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_3[7:0]   ), //i
    .feature_out (pE_110_feature_out[7:0]), //o
    .result      (pE_110_result[31:0]    ), //o
    .computeDone (pE_110_computeDone     ), //o
    .weightDone  (pE_110_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_111 (
    .weight_CE   (pE_111_weight_CE       ), //i
    .feature_CE  (pE_111_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_4[7:0]   ), //i
    .feature_out (pE_111_feature_out[7:0]), //o
    .result      (pE_111_result[31:0]    ), //o
    .computeDone (pE_111_computeDone     ), //o
    .weightDone  (pE_111_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_112 (
    .weight_CE   (pE_112_weight_CE       ), //i
    .feature_CE  (pE_112_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_5[7:0]   ), //i
    .feature_out (pE_112_feature_out[7:0]), //o
    .result      (pE_112_result[31:0]    ), //o
    .computeDone (pE_112_computeDone     ), //o
    .weightDone  (pE_112_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_113 (
    .weight_CE   (pE_113_weight_CE       ), //i
    .feature_CE  (pE_113_feature_CE      ), //i
    .weight_0    (Weight_Array_5_0[7:0]  ), //i
    .weight_1    (Weight_Array_5_1[7:0]  ), //i
    .weight_2    (Weight_Array_5_2[7:0]  ), //i
    .weight_3    (Weight_Array_5_3[7:0]  ), //i
    .weight_4    (Weight_Array_5_4[7:0]  ), //i
    .weight_5    (Weight_Array_5_5[7:0]  ), //i
    .weight_6    (Weight_Array_5_6[7:0]  ), //i
    .weight_7    (Weight_Array_5_7[7:0]  ), //i
    .weight_8    (Weight_Array_5_8[7:0]  ), //i
    .feature     (Feature_cas_5_6[7:0]   ), //i
    .feature_out (pE_113_feature_out[7:0]), //o
    .result      (pE_113_result[31:0]    ), //o
    .computeDone (pE_113_computeDone     ), //o
    .weightDone  (pE_113_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_114 (
    .weight_CE   (pE_114_weight_CE       ), //i
    .feature_CE  (pE_114_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_0[7:0]   ), //i
    .feature_out (pE_114_feature_out[7:0]), //o
    .result      (pE_114_result[31:0]    ), //o
    .computeDone (pE_114_computeDone     ), //o
    .weightDone  (pE_114_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_115 (
    .weight_CE   (pE_115_weight_CE       ), //i
    .feature_CE  (pE_115_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_1[7:0]   ), //i
    .feature_out (pE_115_feature_out[7:0]), //o
    .result      (pE_115_result[31:0]    ), //o
    .computeDone (pE_115_computeDone     ), //o
    .weightDone  (pE_115_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_116 (
    .weight_CE   (pE_116_weight_CE       ), //i
    .feature_CE  (pE_116_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_2[7:0]   ), //i
    .feature_out (pE_116_feature_out[7:0]), //o
    .result      (pE_116_result[31:0]    ), //o
    .computeDone (pE_116_computeDone     ), //o
    .weightDone  (pE_116_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_117 (
    .weight_CE   (pE_117_weight_CE       ), //i
    .feature_CE  (pE_117_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_3[7:0]   ), //i
    .feature_out (pE_117_feature_out[7:0]), //o
    .result      (pE_117_result[31:0]    ), //o
    .computeDone (pE_117_computeDone     ), //o
    .weightDone  (pE_117_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_118 (
    .weight_CE   (pE_118_weight_CE       ), //i
    .feature_CE  (pE_118_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_4[7:0]   ), //i
    .feature_out (pE_118_feature_out[7:0]), //o
    .result      (pE_118_result[31:0]    ), //o
    .computeDone (pE_118_computeDone     ), //o
    .weightDone  (pE_118_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_119 (
    .weight_CE   (pE_119_weight_CE       ), //i
    .feature_CE  (pE_119_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_5[7:0]   ), //i
    .feature_out (pE_119_feature_out[7:0]), //o
    .result      (pE_119_result[31:0]    ), //o
    .computeDone (pE_119_computeDone     ), //o
    .weightDone  (pE_119_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_120 (
    .weight_CE   (pE_120_weight_CE       ), //i
    .feature_CE  (pE_120_feature_CE      ), //i
    .weight_0    (Weight_Array_6_0[7:0]  ), //i
    .weight_1    (Weight_Array_6_1[7:0]  ), //i
    .weight_2    (Weight_Array_6_2[7:0]  ), //i
    .weight_3    (Weight_Array_6_3[7:0]  ), //i
    .weight_4    (Weight_Array_6_4[7:0]  ), //i
    .weight_5    (Weight_Array_6_5[7:0]  ), //i
    .weight_6    (Weight_Array_6_6[7:0]  ), //i
    .weight_7    (Weight_Array_6_7[7:0]  ), //i
    .weight_8    (Weight_Array_6_8[7:0]  ), //i
    .feature     (Feature_cas_6_6[7:0]   ), //i
    .feature_out (pE_120_feature_out[7:0]), //o
    .result      (pE_120_result[31:0]    ), //o
    .computeDone (pE_120_computeDone     ), //o
    .weightDone  (pE_120_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_121 (
    .weight_CE   (pE_121_weight_CE       ), //i
    .feature_CE  (pE_121_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_0[7:0]   ), //i
    .feature_out (pE_121_feature_out[7:0]), //o
    .result      (pE_121_result[31:0]    ), //o
    .computeDone (pE_121_computeDone     ), //o
    .weightDone  (pE_121_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_122 (
    .weight_CE   (pE_122_weight_CE       ), //i
    .feature_CE  (pE_122_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_1[7:0]   ), //i
    .feature_out (pE_122_feature_out[7:0]), //o
    .result      (pE_122_result[31:0]    ), //o
    .computeDone (pE_122_computeDone     ), //o
    .weightDone  (pE_122_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_123 (
    .weight_CE   (pE_123_weight_CE       ), //i
    .feature_CE  (pE_123_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_2[7:0]   ), //i
    .feature_out (pE_123_feature_out[7:0]), //o
    .result      (pE_123_result[31:0]    ), //o
    .computeDone (pE_123_computeDone     ), //o
    .weightDone  (pE_123_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_124 (
    .weight_CE   (pE_124_weight_CE       ), //i
    .feature_CE  (pE_124_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_3[7:0]   ), //i
    .feature_out (pE_124_feature_out[7:0]), //o
    .result      (pE_124_result[31:0]    ), //o
    .computeDone (pE_124_computeDone     ), //o
    .weightDone  (pE_124_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_125 (
    .weight_CE   (pE_125_weight_CE       ), //i
    .feature_CE  (pE_125_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_4[7:0]   ), //i
    .feature_out (pE_125_feature_out[7:0]), //o
    .result      (pE_125_result[31:0]    ), //o
    .computeDone (pE_125_computeDone     ), //o
    .weightDone  (pE_125_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_126 (
    .weight_CE   (pE_126_weight_CE       ), //i
    .feature_CE  (pE_126_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_5[7:0]   ), //i
    .feature_out (pE_126_feature_out[7:0]), //o
    .result      (pE_126_result[31:0]    ), //o
    .computeDone (pE_126_computeDone     ), //o
    .weightDone  (pE_126_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  PE pE_127 (
    .weight_CE   (pE_127_weight_CE       ), //i
    .feature_CE  (pE_127_feature_CE      ), //i
    .weight_0    (Weight_Array_7_0[7:0]  ), //i
    .weight_1    (Weight_Array_7_1[7:0]  ), //i
    .weight_2    (Weight_Array_7_2[7:0]  ), //i
    .weight_3    (Weight_Array_7_3[7:0]  ), //i
    .weight_4    (Weight_Array_7_4[7:0]  ), //i
    .weight_5    (Weight_Array_7_5[7:0]  ), //i
    .weight_6    (Weight_Array_7_6[7:0]  ), //i
    .weight_7    (Weight_Array_7_7[7:0]  ), //i
    .weight_8    (Weight_Array_7_8[7:0]  ), //i
    .feature     (Feature_cas_7_6[7:0]   ), //i
    .feature_out (pE_127_feature_out[7:0]), //o
    .result      (pE_127_result[31:0]    ), //o
    .computeDone (pE_127_computeDone     ), //o
    .weightDone  (pE_127_weightDone      ), //o
    .clk         (clk                    ), //i
    .reset       (reset                  )  //i
  );
  columnAdd colAdd_1 (
    .result_col_0       (colAdd_1_result_col_0[31:0]), //i
    .result_col_1       (colAdd_1_result_col_1[31:0]), //i
    .result_col_2       (colAdd_1_result_col_2[31:0]), //i
    .result_col_3       (colAdd_1_result_col_3[31:0]), //i
    .result_col_4       (colAdd_1_result_col_4[31:0]), //i
    .result_col_5       (colAdd_1_result_col_5[31:0]), //i
    .result_col_6       (colAdd_1_result_col_6[31:0]), //i
    .result_col_7       (colAdd_1_result_col_7[31:0]), //i
    .startAdd           (colAdd_1_startAdd          ), //i
    .colAddResult       (colAdd_1_colAddResult[31:0]), //o
    .colAddResult_Valid (colAdd_1_colAddResult_Valid), //o
    .clk                (clk                        ), //i
    .reset              (reset                      )  //i
  );
  assign Feature_cas_0_0 = pE_64_feature_out;
  assign result_c_0_0 = pE_64_result;
  always @(*) begin
    computeDone_C[0] = pE_64_computeDone;
    computeDone_C[0] = pE_65_computeDone;
    computeDone_C[0] = pE_66_computeDone;
    computeDone_C[0] = pE_67_computeDone;
    computeDone_C[0] = pE_68_computeDone;
    computeDone_C[0] = pE_69_computeDone;
    computeDone_C[0] = pE_70_computeDone;
    computeDone_C[0] = pE_71_computeDone;
    computeDone_C[1] = pE_72_computeDone;
    computeDone_C[2] = pE_73_computeDone;
    computeDone_C[3] = pE_74_computeDone;
    computeDone_C[4] = pE_75_computeDone;
    computeDone_C[5] = pE_76_computeDone;
    computeDone_C[6] = pE_77_computeDone;
    computeDone_C[7] = pE_78_computeDone;
  end

  assign firstColWeightChange = pE_64_weightDone;
  assign Feature_cas_1_0 = pE_65_feature_out;
  assign result_c_0_1 = pE_65_result;
  assign Feature_cas_2_0 = pE_66_feature_out;
  assign result_c_0_2 = pE_66_result;
  assign Feature_cas_3_0 = pE_67_feature_out;
  assign result_c_0_3 = pE_67_result;
  assign Feature_cas_4_0 = pE_68_feature_out;
  assign result_c_0_4 = pE_68_result;
  assign Feature_cas_5_0 = pE_69_feature_out;
  assign result_c_0_5 = pE_69_result;
  assign Feature_cas_6_0 = pE_70_feature_out;
  assign result_c_0_6 = pE_70_result;
  assign Feature_cas_7_0 = pE_71_feature_out;
  assign result_c_0_7 = pE_71_result;
  assign pE_72_weight_CE = Weight_CE_c[0];
  assign pE_72_feature_CE = Feature_CE_c[0];
  assign Feature_cas_0_1 = pE_72_feature_out;
  assign result_c_1_0 = pE_72_result;
  assign pE_73_weight_CE = Weight_CE_c[1];
  assign pE_73_feature_CE = Feature_CE_c[1];
  assign Feature_cas_0_2 = pE_73_feature_out;
  assign result_c_2_0 = pE_73_result;
  assign pE_74_weight_CE = Weight_CE_c[2];
  assign pE_74_feature_CE = Feature_CE_c[2];
  assign Feature_cas_0_3 = pE_74_feature_out;
  assign result_c_3_0 = pE_74_result;
  assign pE_75_weight_CE = Weight_CE_c[3];
  assign pE_75_feature_CE = Feature_CE_c[3];
  assign Feature_cas_0_4 = pE_75_feature_out;
  assign result_c_4_0 = pE_75_result;
  assign pE_76_weight_CE = Weight_CE_c[4];
  assign pE_76_feature_CE = Feature_CE_c[4];
  assign Feature_cas_0_5 = pE_76_feature_out;
  assign result_c_5_0 = pE_76_result;
  assign pE_77_weight_CE = Weight_CE_c[5];
  assign pE_77_feature_CE = Feature_CE_c[5];
  assign Feature_cas_0_6 = pE_77_feature_out;
  assign result_c_6_0 = pE_77_result;
  assign pE_78_weight_CE = Weight_CE_c[6];
  assign pE_78_feature_CE = Feature_CE_c[6];
  assign Feature_cas_0_7 = pE_78_feature_out;
  assign result_c_7_0 = pE_78_result;
  assign pE_79_weight_CE = Weight_CE_c[0];
  assign pE_79_feature_CE = Feature_CE_c[0];
  assign Feature_cas_1_1 = pE_79_feature_out;
  assign result_c_1_1 = pE_79_result;
  assign pE_80_weight_CE = Weight_CE_c[1];
  assign pE_80_feature_CE = Feature_CE_c[1];
  assign Feature_cas_1_2 = pE_80_feature_out;
  assign result_c_2_1 = pE_80_result;
  assign pE_81_weight_CE = Weight_CE_c[2];
  assign pE_81_feature_CE = Feature_CE_c[2];
  assign Feature_cas_1_3 = pE_81_feature_out;
  assign result_c_3_1 = pE_81_result;
  assign pE_82_weight_CE = Weight_CE_c[3];
  assign pE_82_feature_CE = Feature_CE_c[3];
  assign Feature_cas_1_4 = pE_82_feature_out;
  assign result_c_4_1 = pE_82_result;
  assign pE_83_weight_CE = Weight_CE_c[4];
  assign pE_83_feature_CE = Feature_CE_c[4];
  assign Feature_cas_1_5 = pE_83_feature_out;
  assign result_c_5_1 = pE_83_result;
  assign pE_84_weight_CE = Weight_CE_c[5];
  assign pE_84_feature_CE = Feature_CE_c[5];
  assign Feature_cas_1_6 = pE_84_feature_out;
  assign result_c_6_1 = pE_84_result;
  assign pE_85_weight_CE = Weight_CE_c[6];
  assign pE_85_feature_CE = Feature_CE_c[6];
  assign Feature_cas_1_7 = pE_85_feature_out;
  assign result_c_7_1 = pE_85_result;
  assign pE_86_weight_CE = Weight_CE_c[0];
  assign pE_86_feature_CE = Feature_CE_c[0];
  assign Feature_cas_2_1 = pE_86_feature_out;
  assign result_c_1_2 = pE_86_result;
  assign pE_87_weight_CE = Weight_CE_c[1];
  assign pE_87_feature_CE = Feature_CE_c[1];
  assign Feature_cas_2_2 = pE_87_feature_out;
  assign result_c_2_2 = pE_87_result;
  assign pE_88_weight_CE = Weight_CE_c[2];
  assign pE_88_feature_CE = Feature_CE_c[2];
  assign Feature_cas_2_3 = pE_88_feature_out;
  assign result_c_3_2 = pE_88_result;
  assign pE_89_weight_CE = Weight_CE_c[3];
  assign pE_89_feature_CE = Feature_CE_c[3];
  assign Feature_cas_2_4 = pE_89_feature_out;
  assign result_c_4_2 = pE_89_result;
  assign pE_90_weight_CE = Weight_CE_c[4];
  assign pE_90_feature_CE = Feature_CE_c[4];
  assign Feature_cas_2_5 = pE_90_feature_out;
  assign result_c_5_2 = pE_90_result;
  assign pE_91_weight_CE = Weight_CE_c[5];
  assign pE_91_feature_CE = Feature_CE_c[5];
  assign Feature_cas_2_6 = pE_91_feature_out;
  assign result_c_6_2 = pE_91_result;
  assign pE_92_weight_CE = Weight_CE_c[6];
  assign pE_92_feature_CE = Feature_CE_c[6];
  assign Feature_cas_2_7 = pE_92_feature_out;
  assign result_c_7_2 = pE_92_result;
  assign pE_93_weight_CE = Weight_CE_c[0];
  assign pE_93_feature_CE = Feature_CE_c[0];
  assign Feature_cas_3_1 = pE_93_feature_out;
  assign result_c_1_3 = pE_93_result;
  assign pE_94_weight_CE = Weight_CE_c[1];
  assign pE_94_feature_CE = Feature_CE_c[1];
  assign Feature_cas_3_2 = pE_94_feature_out;
  assign result_c_2_3 = pE_94_result;
  assign pE_95_weight_CE = Weight_CE_c[2];
  assign pE_95_feature_CE = Feature_CE_c[2];
  assign Feature_cas_3_3 = pE_95_feature_out;
  assign result_c_3_3 = pE_95_result;
  assign pE_96_weight_CE = Weight_CE_c[3];
  assign pE_96_feature_CE = Feature_CE_c[3];
  assign Feature_cas_3_4 = pE_96_feature_out;
  assign result_c_4_3 = pE_96_result;
  assign pE_97_weight_CE = Weight_CE_c[4];
  assign pE_97_feature_CE = Feature_CE_c[4];
  assign Feature_cas_3_5 = pE_97_feature_out;
  assign result_c_5_3 = pE_97_result;
  assign pE_98_weight_CE = Weight_CE_c[5];
  assign pE_98_feature_CE = Feature_CE_c[5];
  assign Feature_cas_3_6 = pE_98_feature_out;
  assign result_c_6_3 = pE_98_result;
  assign pE_99_weight_CE = Weight_CE_c[6];
  assign pE_99_feature_CE = Feature_CE_c[6];
  assign Feature_cas_3_7 = pE_99_feature_out;
  assign result_c_7_3 = pE_99_result;
  assign pE_100_weight_CE = Weight_CE_c[0];
  assign pE_100_feature_CE = Feature_CE_c[0];
  assign Feature_cas_4_1 = pE_100_feature_out;
  assign result_c_1_4 = pE_100_result;
  assign pE_101_weight_CE = Weight_CE_c[1];
  assign pE_101_feature_CE = Feature_CE_c[1];
  assign Feature_cas_4_2 = pE_101_feature_out;
  assign result_c_2_4 = pE_101_result;
  assign pE_102_weight_CE = Weight_CE_c[2];
  assign pE_102_feature_CE = Feature_CE_c[2];
  assign Feature_cas_4_3 = pE_102_feature_out;
  assign result_c_3_4 = pE_102_result;
  assign pE_103_weight_CE = Weight_CE_c[3];
  assign pE_103_feature_CE = Feature_CE_c[3];
  assign Feature_cas_4_4 = pE_103_feature_out;
  assign result_c_4_4 = pE_103_result;
  assign pE_104_weight_CE = Weight_CE_c[4];
  assign pE_104_feature_CE = Feature_CE_c[4];
  assign Feature_cas_4_5 = pE_104_feature_out;
  assign result_c_5_4 = pE_104_result;
  assign pE_105_weight_CE = Weight_CE_c[5];
  assign pE_105_feature_CE = Feature_CE_c[5];
  assign Feature_cas_4_6 = pE_105_feature_out;
  assign result_c_6_4 = pE_105_result;
  assign pE_106_weight_CE = Weight_CE_c[6];
  assign pE_106_feature_CE = Feature_CE_c[6];
  assign Feature_cas_4_7 = pE_106_feature_out;
  assign result_c_7_4 = pE_106_result;
  assign pE_107_weight_CE = Weight_CE_c[0];
  assign pE_107_feature_CE = Feature_CE_c[0];
  assign Feature_cas_5_1 = pE_107_feature_out;
  assign result_c_1_5 = pE_107_result;
  assign pE_108_weight_CE = Weight_CE_c[1];
  assign pE_108_feature_CE = Feature_CE_c[1];
  assign Feature_cas_5_2 = pE_108_feature_out;
  assign result_c_2_5 = pE_108_result;
  assign pE_109_weight_CE = Weight_CE_c[2];
  assign pE_109_feature_CE = Feature_CE_c[2];
  assign Feature_cas_5_3 = pE_109_feature_out;
  assign result_c_3_5 = pE_109_result;
  assign pE_110_weight_CE = Weight_CE_c[3];
  assign pE_110_feature_CE = Feature_CE_c[3];
  assign Feature_cas_5_4 = pE_110_feature_out;
  assign result_c_4_5 = pE_110_result;
  assign pE_111_weight_CE = Weight_CE_c[4];
  assign pE_111_feature_CE = Feature_CE_c[4];
  assign Feature_cas_5_5 = pE_111_feature_out;
  assign result_c_5_5 = pE_111_result;
  assign pE_112_weight_CE = Weight_CE_c[5];
  assign pE_112_feature_CE = Feature_CE_c[5];
  assign Feature_cas_5_6 = pE_112_feature_out;
  assign result_c_6_5 = pE_112_result;
  assign pE_113_weight_CE = Weight_CE_c[6];
  assign pE_113_feature_CE = Feature_CE_c[6];
  assign Feature_cas_5_7 = pE_113_feature_out;
  assign result_c_7_5 = pE_113_result;
  assign pE_114_weight_CE = Weight_CE_c[0];
  assign pE_114_feature_CE = Feature_CE_c[0];
  assign Feature_cas_6_1 = pE_114_feature_out;
  assign result_c_1_6 = pE_114_result;
  assign pE_115_weight_CE = Weight_CE_c[1];
  assign pE_115_feature_CE = Feature_CE_c[1];
  assign Feature_cas_6_2 = pE_115_feature_out;
  assign result_c_2_6 = pE_115_result;
  assign pE_116_weight_CE = Weight_CE_c[2];
  assign pE_116_feature_CE = Feature_CE_c[2];
  assign Feature_cas_6_3 = pE_116_feature_out;
  assign result_c_3_6 = pE_116_result;
  assign pE_117_weight_CE = Weight_CE_c[3];
  assign pE_117_feature_CE = Feature_CE_c[3];
  assign Feature_cas_6_4 = pE_117_feature_out;
  assign result_c_4_6 = pE_117_result;
  assign pE_118_weight_CE = Weight_CE_c[4];
  assign pE_118_feature_CE = Feature_CE_c[4];
  assign Feature_cas_6_5 = pE_118_feature_out;
  assign result_c_5_6 = pE_118_result;
  assign pE_119_weight_CE = Weight_CE_c[5];
  assign pE_119_feature_CE = Feature_CE_c[5];
  assign Feature_cas_6_6 = pE_119_feature_out;
  assign result_c_6_6 = pE_119_result;
  assign pE_120_weight_CE = Weight_CE_c[6];
  assign pE_120_feature_CE = Feature_CE_c[6];
  assign Feature_cas_6_7 = pE_120_feature_out;
  assign result_c_7_6 = pE_120_result;
  assign pE_121_weight_CE = Weight_CE_c[0];
  assign pE_121_feature_CE = Feature_CE_c[0];
  assign Feature_cas_7_1 = pE_121_feature_out;
  assign result_c_1_7 = pE_121_result;
  assign pE_122_weight_CE = Weight_CE_c[1];
  assign pE_122_feature_CE = Feature_CE_c[1];
  assign Feature_cas_7_2 = pE_122_feature_out;
  assign result_c_2_7 = pE_122_result;
  assign pE_123_weight_CE = Weight_CE_c[2];
  assign pE_123_feature_CE = Feature_CE_c[2];
  assign Feature_cas_7_3 = pE_123_feature_out;
  assign result_c_3_7 = pE_123_result;
  assign pE_124_weight_CE = Weight_CE_c[3];
  assign pE_124_feature_CE = Feature_CE_c[3];
  assign Feature_cas_7_4 = pE_124_feature_out;
  assign result_c_4_7 = pE_124_result;
  assign pE_125_weight_CE = Weight_CE_c[4];
  assign pE_125_feature_CE = Feature_CE_c[4];
  assign Feature_cas_7_5 = pE_125_feature_out;
  assign result_c_5_7 = pE_125_result;
  assign pE_126_weight_CE = Weight_CE_c[5];
  assign pE_126_feature_CE = Feature_CE_c[5];
  assign Feature_cas_7_6 = pE_126_feature_out;
  assign result_c_6_7 = pE_126_result;
  assign pE_127_weight_CE = Weight_CE_c[6];
  assign pE_127_feature_CE = Feature_CE_c[6];
  assign Feature_cas_7_7 = pE_127_feature_out;
  assign result_c_7_7 = pE_127_result;
  always @(*) begin
    if(computeDone_C[0]) begin
      colAdd_1_startAdd = 1'b1;
    end else begin
      colAdd_1_startAdd = 1'b0;
    end
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_0 = result_c_7_0;
      end
      8'h20 : begin
        colAdd_1_result_col_0 = result_c_5_0;
      end
      8'h08 : begin
        colAdd_1_result_col_0 = result_c_3_0;
      end
      8'h02 : begin
        colAdd_1_result_col_0 = result_c_1_0;
      end
      8'h40 : begin
        colAdd_1_result_col_0 = result_c_6_0;
      end
      8'h04 : begin
        colAdd_1_result_col_0 = result_c_2_0;
      end
      8'h10 : begin
        colAdd_1_result_col_0 = result_c_4_0;
      end
      8'h01 : begin
        colAdd_1_result_col_0 = result_c_0_0;
      end
      default : begin
        colAdd_1_result_col_0 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_1 = result_c_7_1;
      end
      8'h20 : begin
        colAdd_1_result_col_1 = result_c_5_1;
      end
      8'h08 : begin
        colAdd_1_result_col_1 = result_c_3_1;
      end
      8'h02 : begin
        colAdd_1_result_col_1 = result_c_1_1;
      end
      8'h40 : begin
        colAdd_1_result_col_1 = result_c_6_1;
      end
      8'h04 : begin
        colAdd_1_result_col_1 = result_c_2_1;
      end
      8'h10 : begin
        colAdd_1_result_col_1 = result_c_4_1;
      end
      8'h01 : begin
        colAdd_1_result_col_1 = result_c_0_1;
      end
      default : begin
        colAdd_1_result_col_1 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_2 = result_c_7_2;
      end
      8'h20 : begin
        colAdd_1_result_col_2 = result_c_5_2;
      end
      8'h08 : begin
        colAdd_1_result_col_2 = result_c_3_2;
      end
      8'h02 : begin
        colAdd_1_result_col_2 = result_c_1_2;
      end
      8'h40 : begin
        colAdd_1_result_col_2 = result_c_6_2;
      end
      8'h04 : begin
        colAdd_1_result_col_2 = result_c_2_2;
      end
      8'h10 : begin
        colAdd_1_result_col_2 = result_c_4_2;
      end
      8'h01 : begin
        colAdd_1_result_col_2 = result_c_0_2;
      end
      default : begin
        colAdd_1_result_col_2 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_3 = result_c_7_3;
      end
      8'h20 : begin
        colAdd_1_result_col_3 = result_c_5_3;
      end
      8'h08 : begin
        colAdd_1_result_col_3 = result_c_3_3;
      end
      8'h02 : begin
        colAdd_1_result_col_3 = result_c_1_3;
      end
      8'h40 : begin
        colAdd_1_result_col_3 = result_c_6_3;
      end
      8'h04 : begin
        colAdd_1_result_col_3 = result_c_2_3;
      end
      8'h10 : begin
        colAdd_1_result_col_3 = result_c_4_3;
      end
      8'h01 : begin
        colAdd_1_result_col_3 = result_c_0_3;
      end
      default : begin
        colAdd_1_result_col_3 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_4 = result_c_7_4;
      end
      8'h20 : begin
        colAdd_1_result_col_4 = result_c_5_4;
      end
      8'h08 : begin
        colAdd_1_result_col_4 = result_c_3_4;
      end
      8'h02 : begin
        colAdd_1_result_col_4 = result_c_1_4;
      end
      8'h40 : begin
        colAdd_1_result_col_4 = result_c_6_4;
      end
      8'h04 : begin
        colAdd_1_result_col_4 = result_c_2_4;
      end
      8'h10 : begin
        colAdd_1_result_col_4 = result_c_4_4;
      end
      8'h01 : begin
        colAdd_1_result_col_4 = result_c_0_4;
      end
      default : begin
        colAdd_1_result_col_4 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_5 = result_c_7_5;
      end
      8'h20 : begin
        colAdd_1_result_col_5 = result_c_5_5;
      end
      8'h08 : begin
        colAdd_1_result_col_5 = result_c_3_5;
      end
      8'h02 : begin
        colAdd_1_result_col_5 = result_c_1_5;
      end
      8'h40 : begin
        colAdd_1_result_col_5 = result_c_6_5;
      end
      8'h04 : begin
        colAdd_1_result_col_5 = result_c_2_5;
      end
      8'h10 : begin
        colAdd_1_result_col_5 = result_c_4_5;
      end
      8'h01 : begin
        colAdd_1_result_col_5 = result_c_0_5;
      end
      default : begin
        colAdd_1_result_col_5 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_6 = result_c_7_6;
      end
      8'h20 : begin
        colAdd_1_result_col_6 = result_c_5_6;
      end
      8'h08 : begin
        colAdd_1_result_col_6 = result_c_3_6;
      end
      8'h02 : begin
        colAdd_1_result_col_6 = result_c_1_6;
      end
      8'h40 : begin
        colAdd_1_result_col_6 = result_c_6_6;
      end
      8'h04 : begin
        colAdd_1_result_col_6 = result_c_2_6;
      end
      8'h10 : begin
        colAdd_1_result_col_6 = result_c_4_6;
      end
      8'h01 : begin
        colAdd_1_result_col_6 = result_c_0_6;
      end
      default : begin
        colAdd_1_result_col_6 = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(computeDone_C)
      8'h80 : begin
        colAdd_1_result_col_7 = result_c_7_7;
      end
      8'h20 : begin
        colAdd_1_result_col_7 = result_c_5_7;
      end
      8'h08 : begin
        colAdd_1_result_col_7 = result_c_3_7;
      end
      8'h02 : begin
        colAdd_1_result_col_7 = result_c_1_7;
      end
      8'h40 : begin
        colAdd_1_result_col_7 = result_c_6_7;
      end
      8'h04 : begin
        colAdd_1_result_col_7 = result_c_2_7;
      end
      8'h10 : begin
        colAdd_1_result_col_7 = result_c_4_7;
      end
      8'h01 : begin
        colAdd_1_result_col_7 = result_c_0_7;
      end
      default : begin
        colAdd_1_result_col_7 = 32'h0;
      end
    endcase
  end

  assign colAddResult = colAdd_1_colAddResult;
  assign colAddResult_Valid = colAdd_1_colAddResult_Valid;
  always @(posedge clk) begin
    if(reset) begin
      Weight_CE_c <= 7'h0;
      Feature_CE_c <= 7'h0;
    end else begin
      Weight_CE_c[0] <= Weight_CE;
      Feature_CE_c[0] <= Feature_CE;
      Weight_CE_c[1] <= Weight_CE_c[0];
      Feature_CE_c[1] <= Feature_CE_c[0];
      Weight_CE_c[2] <= Weight_CE_c[1];
      Feature_CE_c[2] <= Feature_CE_c[1];
      Weight_CE_c[3] <= Weight_CE_c[2];
      Feature_CE_c[3] <= Feature_CE_c[2];
      Weight_CE_c[4] <= Weight_CE_c[3];
      Feature_CE_c[4] <= Feature_CE_c[3];
      Weight_CE_c[5] <= Weight_CE_c[4];
      Feature_CE_c[5] <= Feature_CE_c[4];
      Weight_CE_c[6] <= Weight_CE_c[5];
      Feature_CE_c[6] <= Feature_CE_c[5];
    end
  end


endmodule

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

  wire       [31:0]   colAdd_1_s;
  wire       [31:0]   colAdd_2_s;
  wire       [31:0]   colAdd_3_s;
  wire       [31:0]   colAdd_4_s;
  wire       [31:0]   colAdd_5_s;
  wire       [31:0]   colAdd_6_s;
  wire       [31:0]   colAdd_7_s;
  reg        [2:0]    counter;
  reg        [7:0]    result_valid;

  ColAdd colAdd_1 (
    .a   (result_col_0[31:0]), //i
    .b   (result_col_1[31:0]), //i
    .s   (colAdd_1_s[31:0]  ), //o
    .CLK (clk               )  //i
  );
  ColAdd colAdd_2 (
    .a   (result_col_2[31:0]), //i
    .b   (result_col_3[31:0]), //i
    .s   (colAdd_2_s[31:0]  ), //o
    .CLK (clk               )  //i
  );
  ColAdd colAdd_3 (
    .a   (result_col_4[31:0]), //i
    .b   (result_col_5[31:0]), //i
    .s   (colAdd_3_s[31:0]  ), //o
    .CLK (clk               )  //i
  );
  ColAdd colAdd_4 (
    .a   (result_col_6[31:0]), //i
    .b   (result_col_7[31:0]), //i
    .s   (colAdd_4_s[31:0]  ), //o
    .CLK (clk               )  //i
  );
  ColAdd colAdd_5 (
    .a   (colAdd_1_s[31:0]), //i
    .b   (colAdd_2_s[31:0]), //i
    .s   (colAdd_5_s[31:0]), //o
    .CLK (clk             )  //i
  );
  ColAdd colAdd_6 (
    .a   (colAdd_3_s[31:0]), //i
    .b   (colAdd_4_s[31:0]), //i
    .s   (colAdd_6_s[31:0]), //o
    .CLK (clk             )  //i
  );
  ColAdd colAdd_7 (
    .a   (colAdd_5_s[31:0]), //i
    .b   (colAdd_6_s[31:0]), //i
    .s   (colAdd_7_s[31:0]), //o
    .CLK (clk             )  //i
  );
  assign colAddResult_Valid = (|result_valid);
  always @(posedge clk) begin
    if(reset) begin
      colAddResult <= 32'h0;
      counter <= 3'b000;
      result_valid <= 8'h0;
    end else begin
      result_valid <= (result_valid <<< 1);
      if((startAdd || (3'b000 < counter))) begin
        if((counter == 3'b110)) begin
          result_valid[0] <= 1'b1;
          counter <= 3'b000;
        end else begin
          result_valid[0] <= 1'b0;
          counter <= (counter + 3'b001);
        end
      end else begin
        result_valid[0] <= 1'b0;
        counter <= 3'b000;
      end
      colAddResult <= colAdd_7_s;
    end
  end


endmodule

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

//PE replaced by PE

module PE (
  input               weight_CE,
  input               feature_CE,
  input      [7:0]    weight_0,
  input      [7:0]    weight_1,
  input      [7:0]    weight_2,
  input      [7:0]    weight_3,
  input      [7:0]    weight_4,
  input      [7:0]    weight_5,
  input      [7:0]    weight_6,
  input      [7:0]    weight_7,
  input      [7:0]    weight_8,
  input      [7:0]    feature,
  output reg [7:0]    feature_out,
  output reg [31:0]   result,
  output              computeDone,
  output              weightDone,
  input               clk,
  input               reset
);

  wire       [7:0]    peMul_1_b;
  wire       [31:0]   peMul_1_p;
  wire       [31:0]   peAdd_1_s;
  reg        [7:0]    _zz_b;
  reg        [7:0]    weight_reg_0;
  reg        [7:0]    weight_reg_1;
  reg        [7:0]    weight_reg_2;
  reg        [7:0]    weight_reg_3;
  reg        [7:0]    weight_reg_4;
  reg        [7:0]    weight_reg_5;
  reg        [7:0]    weight_reg_6;
  reg        [7:0]    weight_reg_7;
  reg        [7:0]    weight_reg_8;
  reg        [3:0]    counter;
  reg                 computeDoneTmp;
  wire       [31:0]   mulOut;
  reg        [31:0]   addBin;
  wire                addBClear;
  wire       [31:0]   addOut;
  reg                 computeDoneTmp_delay_1;
  reg                 computeDoneTmp_delay_2;
  reg                 computeDoneTmp_delay_3;
  reg                 computeDoneTmp_delay_4;
  reg                 computeDoneTmp_delay_1_1;
  reg                 computeDoneTmp_delay_2_1;
  reg                 computeDoneTmp_delay_3_1;

  PEmul peMul_1 (
    .a   (feature[7:0]   ), //i
    .b   (peMul_1_b[7:0] ), //i
    .p   (peMul_1_p[31:0]), //o
    .CLK (clk            )  //i
  );
  PEadd peAdd_1 (
    .a   (mulOut[31:0]   ), //i
    .b   (addBin[31:0]   ), //i
    .s   (peAdd_1_s[31:0]), //o
    .CLK (clk            )  //i
  );
  always @(*) begin
    case(counter)
      4'b0000 : _zz_b = weight_reg_0;
      4'b0001 : _zz_b = weight_reg_1;
      4'b0010 : _zz_b = weight_reg_2;
      4'b0011 : _zz_b = weight_reg_3;
      4'b0100 : _zz_b = weight_reg_4;
      4'b0101 : _zz_b = weight_reg_5;
      4'b0110 : _zz_b = weight_reg_6;
      4'b0111 : _zz_b = weight_reg_7;
      default : _zz_b = weight_reg_8;
    endcase
  end

  always @(*) begin
    if(addBClear) begin
      addBin = 32'h0;
    end else begin
      addBin = addOut;
    end
  end

  assign weightDone = ((counter == 4'b1000) ? 1'b1 : 1'b0);
  assign computeDone = computeDoneTmp_delay_4;
  assign addBClear = computeDoneTmp_delay_3_1;
  assign peMul_1_b = _zz_b;
  assign mulOut = peMul_1_p;
  assign addOut = peAdd_1_s;
  always @(posedge clk) begin
    if(reset) begin
      feature_out <= 8'h0;
      result <= 32'h0;
      weight_reg_0 <= 8'h0;
      weight_reg_1 <= 8'h0;
      weight_reg_2 <= 8'h0;
      weight_reg_3 <= 8'h0;
      weight_reg_4 <= 8'h0;
      weight_reg_5 <= 8'h0;
      weight_reg_6 <= 8'h0;
      weight_reg_7 <= 8'h0;
      weight_reg_8 <= 8'h0;
      counter <= 4'b0000;
      computeDoneTmp <= 1'b0;
    end else begin
      if(weight_CE) begin
        weight_reg_0 <= weight_0;
        weight_reg_1 <= weight_1;
        weight_reg_2 <= weight_2;
        weight_reg_3 <= weight_3;
        weight_reg_4 <= weight_4;
        weight_reg_5 <= weight_5;
        weight_reg_6 <= weight_6;
        weight_reg_7 <= weight_7;
        weight_reg_8 <= weight_8;
      end
      if(feature_CE) begin
        if((counter == 4'b1000)) begin
          counter <= 4'b0000;
          computeDoneTmp <= 1'b1;
        end else begin
          counter <= (counter + 4'b0001);
          computeDoneTmp <= 1'b0;
        end
      end
      result <= addOut;
      feature_out <= feature;
    end
  end

  always @(posedge clk) begin
    computeDoneTmp_delay_1 <= computeDoneTmp;
    computeDoneTmp_delay_2 <= computeDoneTmp_delay_1;
    computeDoneTmp_delay_3 <= computeDoneTmp_delay_2;
    computeDoneTmp_delay_4 <= computeDoneTmp_delay_3;
    computeDoneTmp_delay_1_1 <= computeDoneTmp;
    computeDoneTmp_delay_2_1 <= computeDoneTmp_delay_1_1;
    computeDoneTmp_delay_3_1 <= computeDoneTmp_delay_2_1;
  end


endmodule

module PEmul (
              input             [7:0] a       ,  //feature
              input             [7:0] b       ,  //weight
              output           [31:0] p      ,
              input             CLK
          );

          wire signed       [7:0]   bin;
          assign bin = $signed(b);

          
          PEMul PEMul_inst (
            .CLK(CLK),  // input wire CLK
            .A(a),      // input wire [7 : 0] A
            .B(bin),      // input wire [7 : 0] B
            .P(p)      // output wire [31 : 0] P
          );

endmodule
      

module PEadd (
              input             [31:0] a       ,
              input             [31:0] b       ,
              output           [31:0] s      ,
              input             CLK
          );

            wire  signed       [31:0]   ain,bin;
            assign ain = $signed(a);
            assign bin = $signed(b);


          
          PEAdd PEAdd_inst (
            .CLK(CLK),  // input wire CLK
            .A(ain),      // input wire [31 : 0] A
            .B(bin),      // input wire [31 : 0] B
            .S(s)      // output wire [31 : 0] P
          );

endmodule
      

module ColAdd (
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
      
