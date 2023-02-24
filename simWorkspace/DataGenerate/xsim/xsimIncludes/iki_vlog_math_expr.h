// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

#ifndef IKI_VLOG_MATH_H
#define IKI_VLOG_MATH_H

    IKI_DLLESPEC void US(iki_vlog_bit_copy)(char* dstValue, int dstIndex, char* srcValue, int srcIndex, int length);
    // specialized versions of US(iki_vlog_bit_copy
    IKI_DLLESPEC void US(iki_vlog_bit_copy_0_0_1)(char* dstValue, char* srcValue); // dstIndex 0, srcIndex 0, lenght 1
    IKI_DLLESPEC void US(iki_vlog_bit_copy_0_0)(char* dstValue, char* srcValue, int length); // dstIndex 0, srcIndex 0
    IKI_DLLESPEC void US(iki_vlog_bit_copy_0_x)(char* dstValue, char* srcValue, int srcIndex, int length); // dstIndex 0, srcIndex any
    IKI_DLLESPEC void US(iki_vlog_bit_copy_x_0)(char* dstValue, unsigned int dstIndex, char* srcValue, int length); // dstIndex any, srcIndex 0

    IKI_DLLESPEC void US(iki_vlog_bit_copy_2state)(char* dstValue, int dstIndex, char* srcValue, int srcIndex, int length);
    IKI_DLLESPEC void US(iki_vlog_double_copy)(char* dstValue, double srcValue1);

    IKI_DLLESPEC void US(iki_vlog_bit_extend)(char* aReturn, int lenReturn, const char *aX1);
    IKI_DLLESPEC void US(iki_vlog_sign_extend)(char* aReturn, int lenReturn, const char *aX1, int lenX);
    IKI_DLLESPEC void US(iki_vlog_zero_extend)(char* aReturn, int lenReturn, char *aX1, int lenX);
    IKI_DLLESPEC int US(iki_vlog_convert_signed_value_to_int)(char* aX, int lenX);
    //IKI_DLLESPEC void US(iki_vlog_unsigned_bit_neg)(char* aReturn, int lenReturn, char* aX, int lenX);
    IKI_DLLESPEC void US(iki_vlog_convert_bit_index)(char* aReturn, char* elConstrX, int typeX, char* aI, int lenI,
            int typeI);
    IKI_DLLESPEC void US(iki_vlog_convert_part_select)(char* aReturnH, char* aReturnL, char* aReturnOff, char* aH, int lenH, int typeH,
             char* aL, int lenL, int typeL, char* elConstrX, char* arConstrX, int isValidTypeX, int typeX, int unitSize);
    IKI_DLLESPEC void US(iki_vlog_convert_indexed_part_select)(char* aReturnH, char* aReturnL, char* aReturnOff, char* aB1, int lenB, int typeB1, 
                char* aW1, int lenW, int typeW1, int isPosIndexed, char* elConstrX, char* arConstrX, int isValidTypeX, int typeX1, int unitSize);
    IKI_DLLESPEC void US(iki_vlog_convert_indexed_part_select_on_indexed_memory)(char* aReturnH, char* aReturnL, char* aReturnOff,
            char* aB1, int lenB, int typeB1, char* aW1, int lenW, int typeW1, int isPosIndexed, char* elConstrX,
            char* arConstrX, int isValidTypeX, int typeX1, int unitSize, int noOfIndices, ...);
    IKI_DLLESPEC void US(iki_vlog_convert_indexed_id)(char* aReturnH, char* aReturnL, char* elConstrX, char* arConstrX,
                        int isValidTypeX, int /*typeX*/, int unitSzTillLowerDim, char* aI, int lenI, int typeI);
    IKI_DLLESPEC void US(iki_vlog_convert_indexed_memory_id)(char* aReturnH, char* aReturnL, char* elConstrX, char* arConstrX, 
                             int isValidTypeX, int /*typeX*/, int unitSzTillLowerDim, int noOfIndices, ...);
    IKI_DLLESPEC void US(iki_vlog_convert_part_select_on_indexed_memory)(char* aReturnH, char* aReturnL, char* aReturnOff,
            char* aH, int lenH, int typeH, char* aL, int lenL, int typeL, char* elConstrX, char* arConstrX,
            int isValidTypeX, int typeX, int unitSize, int noOfIndices, ...);
    IKI_DLLESPEC void xsi_vlogtype_bit_extend(char* aReturn1, int lenReturn, const char *aX1);
    IKI_DLLESPEC void US(iki_vlog_convert_array_select)(char* aReturnH, char* aReturnL, char* elConstrX, char* arConstrX,
            int typeX, int noOfIndices, ...);
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value)(char* aReturn, int typeId, int lenRet, char* aX, char* elConstrX,
                                      char* arConstrX, int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_pu)(char* aReturn, int typeId, int lenRet, char* aX, int pd, int pl, int pr,
                                      int ud, int ul, int ur, int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
#endif
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_p)(char* aReturn, int typeId, int lenRet, char* aX, int d, int l, int r,
                                      int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
#endif
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_u)(char* aReturn, int typeId, int lenRet, char* aX, int d, int l, int r,
                                      int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
#endif
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_pu_input)(char* aReturn, int typeId, int lenRet, char* aX, int pd, int pl, int pr,
                                      int ud, int ul, int ur, int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_p_input)(char* aReturn, int typeId, int lenRet, char* aX, int d, int l, int r,
                                      int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_u_input)(char* aReturn, int typeId, int lenRet, char* aX, int d, int l, int r,
                                      int isValidTypeX, int typeX, int unitSize, char* aI, int lenI, int typeI);
    // Bit select with no run time checks for X/Z or out of bounds
    IKI_DLLESPEC char* US(iki_vlog_get_bit_select_value_simple)(char* aReturn, char* aX, int index) ;
    // Convert index id with no run time checks for X/Z or out of bounds
    IKI_DLLESPEC void US(iki_vlog_convert_indexed_id_simple)(char* aReturnH, char* aReturnL, int index) ;

    IKI_DLLESPEC void US(iki_vlog_get_array_select_value)(char* aReturn, int typeId, int lenRet, char* aX, char* elConstrX,
                                      char* arConstrX, int isValidTypeX, int typeX, int unitSize, int noOfIndices, ...);
    IKI_DLLESPEC void US(iki_vlog_get_part_select_value)(char* aReturn, int typeId, int lenRet, char *aX, char* aH, int lenH,
                    int typeH, char* aL, int lenL, int typeL, char* elConstrX, char* arConstrX, int isValidTypeX, int typeX, int unitSize);
    IKI_DLLESPEC void US(iki_vlog_get_part_select_value_on_indexed_memory)(char* aReturn, int typeId, int lenRet, char* aX,
                            char* aH, int lenH, int typeH, char* aL, int lenL, int typeL, char* elConstrX,
                    char* arConstrX, int isValidTypeX, int typeX, int unitSize, int noOfIndices, ...);
    IKI_DLLESPEC void US(iki_vlog_get_indexed_part_select_value_on_indexed_memory)(char* aReturn, int typeId, int lenRet,
                        char* aX, char* aB1, int lenB, int typeB1, char* aW1, int lenW, int typeW1, int isPosIndexed,
                        char* elConstrX, char* arConstrX, int isValidTypeX, int typeX1, int unitSize, int noOfIndices, ...);
    IKI_DLLESPEC void US(iki_vlog_get_indexed_part_select_value)(char* aReturn, int typeId, int lenRet, char* aX, 
                        char* aB1, int lenB, int typeB1, char* aW1, int lenW, int typeW1, int isPosIndexed,
                        char* elConstrX, char* arConstrX, int isValidTypeX, int typeX1, int unitSize);
#ifdef XSIM_UNUSED    
    IKI_DLLESPEC char* US(iki_vlog_generic_get_part_select_value)(char *aReturn, int lenRet, char *aX, char *elConstrXX,
            int typeX, char *aH, int lenH, int typeH, char *aL, int lenL, int typeL);
#endif
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_get_indexed_partselect)(char *aReturn, int lenRet, char *aX, char *elConstrXX,
            int typeX, char *aB, int lenB, int typeB, char *aW, int lenW, int typeW, int isPosIndexed /*bool*/);
#endif
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_generic_get_index_select_value)(char* aReturn, int lenRet, const char* aX,
            const char* elConstrX, int typeX, const char* aI, int lenI, int typeI);
#endif

    //Binary operator begin -----------------------------------
    IKI_DLLESPEC char* US(iki_vlog_signed_add)(char* aReturn1, int lenReturn, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char * US(iki_vlog_unsigned_add_31)(char* aReturn1, int lenReturn, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_add)(char* aReturn1, int lenReturn, char *aX1, int lenX, char *aY1, int lenY);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_unsigned_add_with_const)(char* aReturn1, int lenReturn, char *aX1, int lenX,
            unsigned int op2);
#endif
    IKI_DLLESPEC char* US(iki_vlog_signed_add_31)(char* aReturn1, int lenReturn, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_minus)(char* aReturn1, int lenReturn, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_minus)(char* aReturn1, int lenReturn, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_equal)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_equal)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_not_equal)(char* aReturn, int lenRet, char* aX, int lenX, char* aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_not_equal)(char* aReturn, int lenRet, char* aX, int lenX, char* aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_case_equal)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_case_equal)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_case_noteq)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_case_noteq)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY,
            int lenY);
  
  // Simplified functions
  IKI_DLLESPEC char* US(iki_vlog_const_signed_minus)(char* aReturn1, char* aX1, int aY1) ;
  IKI_DLLESPEC char* US(iki_vlog_const_signed_multiply)(char* aReturn1, int aX1, char *aY1, int retSize);
  IKI_DLLESPEC char* US(iki_vlog_const_unsigned_divide)(char* aReturn1, char* aX1, int aY1);  

    IKI_DLLESPEC char* US(iki_vlog_unsigned_multiply)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_multiply)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);

    IKI_DLLESPEC char* US(iki_vlog_signed_bit_and)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_and)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_or)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_bit_or)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_less)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_less)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_less_31)(char* aReturn, int lenReturn, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_greater)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_greater)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_xor)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_bit_xor)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_xnor)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_bit_xnor)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_greatereq)(char* aReturn, int lenRet, char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_greatereq)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_leq)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_leq)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_lshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_lshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_rshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_rshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_arith_lshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_arith_lshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_arith_rshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_arith_rshift)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_divide)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_divide)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_mod)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_mod)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_combine)(char* aReturn1, int lenReturn, char *aX1, int lenX, char *aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_equal_assign_binary_op)(char* aReturn1, int lenReturn, /* char* aX1,*/int lenX,
            char* aY1, int lenY, int sign, int resultSign);
    IKI_DLLESPEC char* US(iki_vlog_arith_assign_sign_extend)(char* aReturn1, int lenReturn, int lenX, int resultSign);
    IKI_DLLESPEC char* US(iki_vlog_inc_op)(char* aReturn1, int lenReturn, char* newOpVal1, char* aX1, int lenX, int preOp,
            int resultSign);
    IKI_DLLESPEC char* US(iki_vlog_dec_op)(char* aReturn1, int lenReturn, char* newOpVal1, char* aX1, int lenX, int preOp,
            int resultSign);
    IKI_DLLESPEC char* US(iki_vlog_signed_wild_equality)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_wild_equality)(char* aReturn1, int lenRet, char* aX1, int lenX, char* aY1,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_signed_wild_inequality)(char* aReturn, int lenRet, char* aX, int lenX, char* aY,
            int lenY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_wild_inequality)(char* aReturn, int lenRet, char* aX, int lenX, char* aY,
            int lenY);
    //Binary operator end ------------------------------------------------------------------------------

    //Other operators begin -----------------------------------------------------------
    IKI_DLLESPEC char* US(iki_vlog_assignpattern)(char* aReturn1, int lenRet, int concatLength, int n, ...);
    IKI_DLLESPEC char* US(iki_vlog_concat)(char* aReturn1, int lenRet, int concatLength, int n, ...);
    IKI_DLLESPEC char* US(iki_vlog_mul_concat)(char*aReturn1, int lenRet, int concatLength, char* multValue, int n, ...);
    IKI_DLLESPEC char* US(iki_svlog_inside_operator)(char* aReturn1, int svtypeId, char* lhs, int lhssize, int signnessId, int isUnsignedExprInList, int n, ...);
    IKI_DLLESPEC char* US(iki_svlog_inside_operator_real)(char* aReturn1, int svtypeId, double lhs, int lhssize, int signnessId, int isUnsignedExprInList, int n, ...);
    IKI_DLLESPEC char* US(iki_vlog_signed_power)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY,
            int signedY);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_power)(char* aReturn1, int lenRet, char *aX1, int lenX, char *aY1, int lenY,
            int signedY);
    IKI_DLLESPEC char* US(iki_vlog_convert_0toZ)(char *value, int length);
    IKI_DLLESPEC char* US(iki_vlog_convert_1toZ)(char* value, int length);
    IKI_DLLESPEC char* US(iki_vlog_cast)(char* aReturn1, int lenRet, int targetTypeId, int exprTypeId, char *srcVal, int builtinTargetType, int srcArrDim, int targetArrDim, ...);
    IKI_DLLESPEC char* US(iki_vlog_stream_cast)(char* aReturn1, int lenRet, int sliceSize, int isRightShift, iki_linefile_type lineFile, int noArgs, ...);
    IKI_DLLESPEC char* US(iki_vlog_stream_cast_lhs)(int sliceSize, int isRightShift, iki_linefile_type lineFile, int noArgs, ...);
    IKI_DLLESPEC char* US(iki_svlog_get_streaming_value)(char* result, char* input);
    IKI_DLLESPEC char* US(iki_svlog_get_streaming_length)(char* result, char* input);
    IKI_DLLESPEC int US(iki_vlog_dynamic_cast)(int targetTypeId, int srcTypeId, int insideTaskCall, char *srcVal, iki_linefile_type linefile);
    //Other operators end ---------------------------------------------------------------

    //Unary operator begin -----------------------------------------------------------------
    IKI_DLLESPEC char* US(iki_vlog_unsigned_unary_plus)(char* aReturn1, int lenReturn, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_signed_unary_plus)(char* aReturn1, int lenReturn, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_unary_minus)(char* aReturn1, int lenReturn, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_signed_unary_minus)(char* aReturn1, int lenReturn, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_and)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_nand)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_or)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_nor)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_xor)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unary_xnor)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_logic_neg)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_unsigned_bit_neg)(char* aReturn1, int lenRet, char *aX1, int lenX);
    IKI_DLLESPEC char* US(iki_vlog_signed_bit_neg)(char* aReturn1, int lenRet, char *aX1, int lenX);
    //End unary operator --------------------------------------------------------------------

    //Begin real/double operators
    IKI_DLLESPEC double US(iki_vlog_double_power)(double aX, double aY);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC double US(iki_vlog_get_array_select_double_value)(char *aX1, char* arConstrX1, int noOfIndices, ...);
#endif
    IKI_DLLESPEC char* US(iki_vlog_convert_real_to_bits)(double d, char *dst, int dstLen);
    IKI_DLLESPEC char* US(iki_vlog_convert_real_to_values)(double d, char *dstVal, int dstLen);
    IKI_DLLESPEC double US(iki_vlog_convert_bits_to_real)(const char *aX1, int lenX, int aVarType);
    IKI_DLLESPEC double US(iki_vlog_convert_to_real)(const char* aX, int lenX, int varType);
    IKI_DLLESPEC double US(iki_vlog_convert_to_real_u32)(const char* aX);
    IKI_DLLESPEC double US(iki_vlog_convert_to_real_s32)(const char* aX);
    IKI_DLLESPEC void US(iki_vlog_convert_to_realptr)(char* ptrToDouble, const char* aX, int lenX, int varType);

    //End real/double operators

    // verilog case functions ---------------------
    IKI_DLLESPEC int US(iki_vlog_unsigned_case_compare)(char *aX1, int lenX, char *aY1, int lenY);
    IKI_DLLESPEC int US(iki_vlog_signed_case_compare)(char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC int US(iki_vlog_unsigned_case_xcompare)(char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC int US(iki_vlog_signed_case_xcompare)(char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC int US(iki_vlog_unsigned_case_zcompare)(char *aX, int lenX, char *aY, int lenY);
    IKI_DLLESPEC int US(iki_vlog_signed_case_zcompare)(char *aX, int lenX, char *aY, int lenY);
    //End case functions ------------------


#endif


