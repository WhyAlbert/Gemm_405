// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#ifndef IKI_VHDL_MATH_EXPR_H
#define IKI_VHDL_MATH_EXPR_H


    // Begin VHDL Utility functions
    //-----------------------------------------------

    /* ======================= */
    /* VHDL Specific Functions */
    /* ======================= */
    // VHDL system functions
    IKI_DLLESPEC void US(iki_vhdl_stop)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC void US(iki_vhdl_finish)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC int US(iki_vhdl_resolution_limit)(char* /*dp*/, char* /*ip*/, char* block);
    IKI_DLLESPEC void US(iki_vhdl_report)(const char* msg, unsigned length, char severity);
    IKI_DLLESPEC char* US(iki_vhdl_concat)(char* retConstr, int retLeft, int retDir, unsigned sizeOfElement, ...);
    IKI_DLLESPEC void US(iki_vhdl_check_range_of_index_op)(int left, int right, int dir, int index);
    IKI_DLLESPEC void US(iki_vhdl_check_range_of_slice_op)(int left, int right, int dir, int slice_left, int slice_right,
            int slice_dir);
    IKI_DLLESPEC void US(iki_vhdl_check_constraints_compatibility)(int srcLeft, int srcRight, int dstLeft, int dstRight);
    IKI_DLLESPEC char US(iki_vhdl_array_compare)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_equal)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_nequal)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_sthan)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_sequal)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_gthan)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC char US(iki_vhdl_array_compare_gequal)(const char* left, const char* right, unsigned leftLength,
            unsigned rightLength, unsigned elementSize);
    IKI_DLLESPEC unsigned US(iki_vhdl_array_size)(const char* constraint, unsigned dimension);
    IKI_DLLESPEC unsigned US(iki_vhdl_array_compare_size)(const char* constraint1, const char* constraint2,
            unsigned dimension);

    IKI_DLLESPEC char* US(iki_vhdl_bit_vector_logic_op)(int op, const char* left, const char* right, unsigned vecFlag, unsigned leftLength,
            unsigned rightLength);
    IKI_DLLESPEC char* US(iki_vhdl_bit_vector_shift_op)(int op, const char* left, int right, unsigned leftLength);
    IKI_DLLESPEC char US(iki_vhdl_scalar_match_equality)(int op, char isBit, char left, char right);
    IKI_DLLESPEC char US(iki_vhdl_vector_match_equality)(int op, char isBit, const char* left, const char* right, 
            unsigned leftLength, unsigned rightLength);
    IKI_DLLESPEC char US(iki_vhdl_matching_order_op)(int op, char isBit, const char left, const char right);
    IKI_DLLESPEC char US(iki_vhdl_logical_reduction_op)(int op, const char * vec, unsigned length);
    IKI_DLLESPEC int US(iki_vhdl_case_compare)(const char* ptr1, const char* ptr2, unsigned num);
    IKI_DLLESPEC void US(iki_vhdl_case_compare_check)(const char* ptr, unsigned num);
    IKI_DLLESPEC void US(iki_vhdl_case_compare_check_stdulogic)(const char c, unsigned num);
//IKI_DLLESPEC char US(iki_vhdl_logical_reduction_op)(int op, char* vec, unsigned length);

    IKI_DLLESPEC char* US(iki_vhdl_vector_maxmin)(int op, int isInt, const char *left, const char *right, unsigned leftSize, unsigned rightSize);
    IKI_DLLESPEC char US(iki_vhdl_unary_maxmin)(int op, const char *left, unsigned leftSize);
    IKI_DLLESPEC int US(iki_vhdl_unary_maxmin_int)(int op, const char *left, unsigned leftSize);

    IKI_DLLESPEC int US(iki_vhdl_mod)(int left, int right);
    IKI_DLLESPEC int US(iki_vhdl_pow)(int left, int right);
    IKI_DLLESPEC int US(iki_vhdl_rem)(int left, int right);
    IKI_DLLESPEC double US(iki_vhdl_pow_double)(double left, int right);
    IKI_DLLESPEC int US(iki_vhdl_round)(double value);

    // VHDL range check
    IKI_DLLESPEC void US(iki_vhdl_runtime_error)(const char* str, unsigned length);
    IKI_DLLESPEC void US(iki_value_out_of_range_error_int64)(int64 low, int64 high, int64 value);
    IKI_DLLESPEC void US(iki_value_out_of_range_error_double)(double low, double high, double value);

    // VHDL type system functions
    IKI_DLLESPEC char* US(iki_vhdl_image_enum)(char* retConstr, int value, const char* type);
    IKI_DLLESPEC char* US(iki_vhdl_image_int)(char* retConstr, int value);
    IKI_DLLESPEC char* US(iki_vhdl_image_physical)(char* retConstr, int64 value, const char* type, int unitArrIndex,
            int scaleFactor);
    IKI_DLLESPEC char* US(iki_vhdl_image_double)(const char* retConstr, double value);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_real_ndigits)(const char* retConstr, double value, int num);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_real_format)(const char *retConstr, double value, char *format, int len);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_bit_vector)(const char* retConstr, const char *value, int length);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_stdulogic_vector)(const char* retConstr, const char *value, int length);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_stdulogic)(const char* retConstr, const char value);
    IKI_DLLESPEC char* US(iki_vhdl_to_string_bit)(const char* retConstr, const char value);
    IKI_DLLESPEC char* US(iki_vhdl_to_hstring_bit_vector)(const char* retConstr, const char *value, int length);
    IKI_DLLESPEC char* US(iki_vhdl_to_ostring_bit_vector)(const char* retConstr, const char *value, int length);

    IKI_DLLESPEC int US(iki_vhdl_value_enum)(const char* image, unsigned len, const char *type);
    IKI_DLLESPEC int US(iki_vhdl_value_int)(const char* image, unsigned len);
    IKI_DLLESPEC int64 US(iki_vhdl_value_physical)(const char* image, unsigned len, const char *type);
    IKI_DLLESPEC double US(iki_vhdl_value_double)(const char* image, unsigned len);

    IKI_DLLESPEC unsigned US(iki_vhdl_sizeof_type)(const char* type);
    IKI_DLLESPEC unsigned US(iki_vhdl_scalarof_type)(const char* type);
    IKI_DLLESPEC unsigned US(iki_vhdl_record_type_element_offset)(const char* type, unsigned position);
    IKI_DLLESPEC void US(iki_vhdl_record_type_init)(char* type);

    IKI_DLLESPEC void US(iki_vhdl_init_access_variable)(char* variable);
    IKI_DLLESPEC void US(iki_vhdl_init_variable)(char* variable, const char* type, const char* constraint);
    IKI_DLLESPEC char *US(iki_vhdl_init_allocate_value)(const char* type, const char* constraint, unsigned isUnconstrained);
    IKI_DLLESPEC void US(iki_vhdl_access_variable_register)(char* variable);
    IKI_DLLESPEC unsigned char US(iki_vhdl_access_variable_null)(char* variable);
    IKI_DLLESPEC char* US(iki_vhdl_access_variable_all)(char* variable);
    IKI_DLLESPEC char* US(iki_vhdl_access_variable_constraints)(char* variable);
    IKI_DLLESPEC void US(iki_vhdl_access_variable_deallocate)(char* variable);
    IKI_DLLESPEC void
            US(iki_vhdl_access_variable_assign)(char* variable, char* value, unsigned noOfBytes, char* constraint);
    IKI_DLLESPEC void US(iki_vhdl_access_variable_assign_reference)(char* variable, char* srcVariable);
    IKI_DLLESPEC unsigned char US(iki_vhdl_access_variables_equal)(char* lhsVariable, char* rhsVariable);
    IKI_DLLESPEC void US(iki_vhdl_access_variable_memset)(char* target, char* value, unsigned noOfBytes, unsigned count,
            char* constr);
    IKI_DLLESPEC void US(iki_vhdl_access_variable_memset_reference)(char* target, char* value, unsigned count);

    IKI_DLLESPEC unsigned char US(iki_vhdl_event)(const char* signal, unsigned relativeSI, unsigned length);
    IKI_DLLESPEC unsigned char US(iki_vhdl_rising_edge)(const char* signal, unsigned relativeSI, unsigned recordOffset, int isRecord);
    IKI_DLLESPEC unsigned char US(iki_vhdl_falling_edge)(const char* signal, unsigned relativeSI, unsigned recordOffset, int isRecord);
    IKI_DLLESPEC unsigned char US(iki_vhdl_rising_edge_signal_parameter)(const char* signal, unsigned relativeSI, unsigned recordOffset, int isRecord);
    IKI_DLLESPEC unsigned char US(iki_vhdl_falling_edge_signal_parameter)(const char* signal, unsigned relativeSI, unsigned recordOffset, int isRecord);
    IKI_DLLESPEC uint64 US(iki_vhdl_last_event)(const char* signal, unsigned relativeSI, unsigned length);
    IKI_DLLESPEC char* US(iki_vhdl_last_value)(char* signal, unsigned relative_setback);
    IKI_DLLESPEC unsigned char US(iki_vhdl_active)(const char* signal, unsigned relativeSI, unsigned length);
    IKI_DLLESPEC uint64 US(iki_vhdl_last_active)(const char* signal, unsigned relativeSI, unsigned length);

    IKI_DLLESPEC unsigned char
    US(iki_vhdl_event_signal_parameter)(const char* signal, unsigned relativeSI, unsigned length);
    IKI_DLLESPEC uint64 US(iki_vhdl_last_event_signal_parameter)(const char* signal, unsigned relativeSI, unsigned length);
    IKI_DLLESPEC char* US(iki_vhdl_last_value_signal_parameter)(char* signal, unsigned relative_setback);

    IKI_DLLESPEC void US(iki_vhdl_init_file_variable)(char* variable);
    IKI_DLLESPEC void US(iki_vhdl_file_variable_register)(char* variable);
    IKI_DLLESPEC unsigned char US(iki_vhdl_file_open)(char* file, char* name, char* constr, unsigned char mode);
    IKI_DLLESPEC void US(iki_vhdl_file_close)(char* file);
    IKI_DLLESPEC void US(iki_vhdl_file_flush)(char* file);
    IKI_DLLESPEC unsigned char US(iki_vhdl_file_endfile)(char* file);
    IKI_DLLESPEC void US(iki_vhdl_file_write)(char* file, char* value, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vhdl_file_write_char)(char* file, char value);
    IKI_DLLESPEC void US(iki_vhdl_file_write_int)(char* file, int value);
    IKI_DLLESPEC void US(iki_vhdl_file_write_int64)(char* file, int64 value);
    IKI_DLLESPEC void US(iki_vhdl_file_write_double)(char* file, double value);
    IKI_DLLESPEC void US(iki_vhdl_file_read_unconstrained)(char* file, char* value, unsigned noOfBytes,
            unsigned elementNoOfBytes, char* length);
    IKI_DLLESPEC void US(iki_vhdl_file_read)(char* file, char* value, unsigned noOfBytes);

    IKI_DLLESPEC void US(iki_generate_error_for_division_by_zero)(iki_linefile_type linefile);
    // Cross Lang VHDL Hier Ref                                                             
    IKI_DLLESPEC char* US(iki_convert_vhdl_to_vlog)(const char* source, unsigned count, unsigned char vhdlType, unsigned char bTargetNetHasStrength);


#endif


