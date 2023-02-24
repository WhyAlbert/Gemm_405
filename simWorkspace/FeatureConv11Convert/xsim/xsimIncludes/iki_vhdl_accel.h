// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#ifndef IKI_VHDL_ACCEL_H
#define IKI_VHDL_ACCEL_H

//#if defined(_WIN32)
// was under XSIM_UNUSED, but on windows only we use these functions, so leave it alone on windows
    /** Temporary implementation of std math functions **/
    IKI_DLLESPEC double US(iki_std_log)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_log10)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_exp)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_sqrt)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_pow)(double arg1, double arg2) ; 
    IKI_DLLESPEC double US(iki_std_floor)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_ceil)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_sin)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_cos)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_tan)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_asin)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_acos)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_atan)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_atan2)(double arg1, double arg2) ; 
    IKI_DLLESPEC double US(iki_std_hypot)(double arg1, double arg2) ; 
    IKI_DLLESPEC double US(iki_std_sinh)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_cosh)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_tanh)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_asinh)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_acosh)(double arg) ; 
    IKI_DLLESPEC double US(iki_std_atanh)(double arg) ; 
//#endif
    // VHDL IEEE std_logic_arith acceleration
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_mult_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_mult_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_plus_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_plus_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_minus_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_minus_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_unsigned_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_unsigned_zeroext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_unsigned_signext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_signed_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_signed_zeroext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_std_logic_arith_conv_signed_signext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_equal_unsigned_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_greater_unsigned_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_arith_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_ieee_std_logic_arith_conv_integer_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_ieee_std_logic_arith_conv_integer_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_ieee_std_logic_arith_conv_integer_ulogic)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_unsigned_greater_stdv_stdv)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_std_logic_unsigned_equal_stdv_stdv)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC void US(iki_ieee_vital_primitives_vitalstatetable)(char *dp, char *ip, char *sp);

    // VHDL xilinx corelib std_logic_arith functions. These are not hooked at this time. Need to
    // get this hooked by 2014.1 by working with the IP team
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_mult_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_mult_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_plus_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_plus_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_minus_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_minus_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_unsigned_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_unsigned_zeroext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_unsigned_signext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_signed_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_signed_zeroext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_xilinxcorelib_iputils_std_logic_arith_conv_signed_signext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_equal_unsigned_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_greater_unsigned_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_xilinxcorelib_iputils_std_logic_arith_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_xilinxcorelib_iputils_std_logic_arith_conv_integer_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_xilinxcorelib_iputils_std_logic_arith_conv_integer_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_xilinxcorelib_iputils_std_logic_arith_conv_integer_ulogic)(char *dp, char *ip, char *sp);
#endif //XSIM_UNUSED

    // VHDL IEEE math package functions
    IKI_DLLESPEC double US(iki_ieee_math_real_sign)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_ceil)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_floor)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_round)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_trunc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_mod)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_realmax)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_realmin)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC void US(iki_ieee_math_real_uniform)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_sqrt)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_cbrt)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_pow_int)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_pow_real)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_exp)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_log)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_log2)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_log10)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_log_base)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_sin)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_cos)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_tan)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arcsin)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arccos)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arctan)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arctan2)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_sinh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_cosh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_tanh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arcsinh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arccosh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_real_arctanh)(char* /*dp*/, char* /*ip*/, char* block);

    // VHDL IEEE math complex package functions
    IKI_DLLESPEC unsigned char US(iki_ieee_math_complex_equal_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC unsigned char US(iki_ieee_math_complex_not_equal_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_cmplx)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_complex_get_principal_value)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_complex_to_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_polar_to_complex)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_complex_abs)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_complex_abs_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_complex_arg)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC double US(iki_ieee_math_complex_arg_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_negation)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_negation_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_conj)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_conj_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sqrt)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sqrt_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_exp)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_exp_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log2)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log2_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log10)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log10_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log_base)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_log_base_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sin)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sin_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_cos)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_cos_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sinh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_sinh_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_cosh)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_cosh_polar)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_polar_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_polar_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_add_polar_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_polar_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_polar_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_subtract_polar_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_polar_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_polar_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_multiply_polar_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_cr)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_polar_cc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_polar_rc)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC char *US(iki_ieee_math_complex_divide_polar_cr)(char* /*dp*/, char* /*ip*/, char* block);


    // VHDL numeric_std
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_abs)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_neg)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_add)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_add)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_add)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_add)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_add)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_add)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_subtract)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_subtract)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_subtract)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_subtract)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_subtract)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_subtract)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_multiply)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_multiply)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_multiply)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_multiply)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_multiply)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_multiply)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_divide)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_divide)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_divide)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_divide)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_divide)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_divide)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_rem)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_rem)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_rem)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_rem)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_rem)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_rem)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_mod)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_mod)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_nat_mod)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nat_unsigned_mod)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_int_mod)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_int_signed_mod)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_greater)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_less)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_lequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_lequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_lequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_lequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_lequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_lequal)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_gequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_gequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_gequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_gequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_gequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_gequal)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_equal)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_nequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_nat_unsigned_nequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_unsigned_nat_nequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_int_signed_nequal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_signed_int_nequal)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC int US(iki_ieee_numeric_std_unsigned_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_ieee_numeric_std_signed_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_to_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_to_signed)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_not)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_and)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nand)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_or)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_nor)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_xor)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_xnor)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_ieee_numeric_std_match_ulogic)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_ieee_numeric_std_match)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_shift_left)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_shift_right)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_shift_left)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_shift_right)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_rotate_left)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_rotate_right)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_rotate_left)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_rotate_right)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_sll)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_sll)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_srl)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_srl)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_rol)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_rol)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_ror)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_ror)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_unsigned_resize)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_ieee_numeric_std_signed_resize)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_ieee_numeric_std_to_01)(char *dp, char *ip, char *sp);

    //std_logic_arith
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_unsigned_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_signed_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_signed_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_unsigned_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_integer_unsigned_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_integer_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_integer_signed_plus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_integer_plus)(char *dp, char *ip, char *sp);   
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_ulogic_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_ulogic_unsigned_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_ulogic_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_ulogic_signed_plus)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_unsigned_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_signed_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_signed_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_unsigned_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_integer_unsigned_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_integer_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_integer_signed_minus)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_integer_minus)(char *dp, char *ip, char *sp);   
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_ulogic_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_ulogic_unsigned_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_ulogic_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_ulogic_signed_minus)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_mult)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_mult)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_unsigned_mult)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_signed_mult)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_signed_mult)(char *dp, char *ip, char *sp);    
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_unsigned_mult)(char *dp, char *ip, char *sp);    

    IKI_DLLESPEC char *US(iki_std_logic_arith_unary_plus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_unary_minus)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_unary_abs)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char US(iki_std_logic_arith_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_less)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_less_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_greater)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_greater_or_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_unsigned_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_signed_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_signed_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_unsigned_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_unsigned_integer_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_unsigned_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_signed_integer_is_not_equal)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char US(iki_std_logic_arith_integer_signed_is_not_equal)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_shl)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_shl)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_unsigned_shr)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_signed_shr)(char *dp, char *ip, char *sp);

    IKI_DLLESPEC int US(iki_std_logic_arith_conv_integer_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_std_logic_arith_conv_unsigned_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_std_logic_arith_conv_signed_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC int US(iki_std_logic_arith_conv_ulogic_to_integer)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_integer_to_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_unsigned_to_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_signed_to_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_ulogic_to_unsigned)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_integer_to_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_unsigned_to_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_signed_to_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_ulogic_to_signed)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_integer_to_vector)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_unsigned_to_vector)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_signed_to_vector)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_conv_ulogic_to_vector)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_ext)(char *dp, char *ip, char *sp);
    IKI_DLLESPEC char *US(iki_std_logic_arith_sxt)(char *dp, char *ip, char *sp);

#endif


