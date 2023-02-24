// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#ifndef IKI_VLOG_MATH_DYNAMIC_H
#define IKI_VLOG_MATH_DYNAMIC_H

/*
    namespace ISIM {
        class SVConstraint ;
    };

    namespace ISIMK { 
        // Internal data structure 
        typedef enum {
            DC_COMPOUND_CONTAINER,
            DC_SIMPLE_CONTAINER,
            DC_RANGE_CONTAINER,
            DC_CONSTANT_CONTAINER, 
        } dc_container_type_e ;

        typedef std::pair<char*, dc_container_type_e> typed_container ;
        typedef std::vector <typed_container> typed_container_list ;

        typedef struct constant_container { 
            char* place_holder ; 
        } dc_constant_container_t ;

        typedef struct dc_simple_container : public dc_constant_container_t {
            int type_id ;
            int no_of_constraints ;
            ISIM::SVConstraint* constraint_list ;
        } dc_simple_container_t ;

        typedef struct dc_range_container : public dc_simple_container_t { 
            char* start ;
            char* end ; 
        } dc_range_container_t ;

        typedef struct {
            typed_container_list sub_container_list ;
        } dc_compound_container_t ; 
    } ;
    */

#ifndef INT64_UINT64
#define INT64_UINT64
    typedef unsigned long long uint64;
    typedef long long int64;
#endif


    /*** garbage collection related API ***/
    IKI_DLLESPEC void US(iki_heap_initialize)(char* strategy, char* memmanager, int verboseMode, long long int memorylimit) ;
    IKI_DLLESPEC void US(iki_heap_cleanup)() ;

    IKI_DLLESPEC void *US(iki_heap_malloc)(int size) ;
    IKI_DLLESPEC char *US(iki_heap_strdup)(char* src) ;

    IKI_DLLESPEC void US(iki_register_auto_root_pointers)(char* sp, int noOfArguments, ...) ; 
    IKI_DLLESPEC void US(iki_register_root_pointers)(int noOfArguments, ...) ;
    
    IKI_DLLESPEC void US(iki_remove_auto_root_pointers)(char* SP);

    /*** String method implementation ***/
    IKI_DLLESPEC char* US(iki_svlog_string_len)(char* str, char* result) ;
    IKI_DLLESPEC void  US(iki_svlog_string_putc)(char* str, char* index, char* character) ;
    IKI_DLLESPEC char* US(iki_svlog_string_getc) (char* str, char* index, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_toupper)(char* str, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_tolower)(char* str, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_compare) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_icompare) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_substr) (char* str, char* startIndex, char* endIndex, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_toInteger) (char* str, int base, char*result) ;
    IKI_DLLESPEC double US(iki_svlog_string_atoreal) (char* str, double result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_logeq) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_logneq) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_gt) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_lt) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_geq) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_leq) (char* str, char* otherString, char* result) ;
    IKI_DLLESPEC char* US(iki_svlog_string_concat) (char* result, char* repeatValue, int noOfArguments, ...) ;
    IKI_DLLESPEC void US(iki_svlog_string_itoa) (char* result, char* number) ;
    IKI_DLLESPEC void US(iki_svlog_string_hextoa) (char* result, char* number) ;
    IKI_DLLESPEC void US(iki_svlog_string_bintoa) (char* result, char* number) ;
    IKI_DLLESPEC void US(iki_svlog_string_octtoa) (char* result, char* number) ;
    IKI_DLLESPEC void US(iki_svlog_string_realtoaWithInt) (char* result, char* number) ;
    IKI_DLLESPEC void US(iki_svlog_string_realtoaWithReal) (char* result, double number) ;

    /**** APIs for accessing value of dynamic types ****/
    IKI_DLLESPEC char* US(iki_svlog_signal_handle_value_with_aligned_setback)(char* signal_handle, int length, int setback);
    IKI_DLLESPEC char* US(iki_svlog_net_value_with_aligned_setback)(char* net, int length, int setback);
    IKI_DLLESPEC char* US(iki_svlog_bits)(char *data, int typeId, char *result, ...);

    /**** APIs for SV Class ****/
    IKI_DLLESPEC void US(iki_svlog_allocate_class_memory) (char* dst, int size);
    IKI_DLLESPEC void US(iki_svlog_allocate_class_memory_with_wait) (char* dst, int size);
    IKI_DLLESPEC void US(iki_svlog_allocate_init_class_object) (char* dst, int typeId, char* IP, iki_linefile_type lineFile);
    IKI_DLLESPEC void US(iki_svlog_allocate_init_class_object_with_wait) (char* dst, int typeId, char* IP, iki_linefile_type lineFile);
    IKI_DLLESPEC void US(iki_svlog_shallow_copy_class_object) (char* dst, char* src, char* IP, iki_linefile_type lineFile);
    IKI_DLLESPEC void US(iki_svlog_update_class_object_auto_var)(char* var, char* src, unsigned offset, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_svlog_initialize_virtual_tables)(int noOfVirtualClasses, ...);
    IKI_DLLESPEC char* US(iki_svlog_resolve_virtual_method_call)(char* objPtr, int superTypeId, int methodIndex, char* methodSz, char* methodOffsetFromIP, char* methodOffsetFromDP, char* ipToBeUsed, char* DP, char* IP, int isInterfaceClass);
    IKI_DLLESPEC void US(iki_svlog_initialize_string_param_in_class)(int noOfClasses, ...);

    IKI_DLLESPEC void US(iki_generate_error_for_null_dereference)(iki_linefile_type linefile);
    IKI_DLLESPEC void US(iki_generate_error_virtual_interface_null_dereference)(iki_linefile_type linefile);                                                             
    IKI_DLLESPEC void US(iki_generate_error_for_out_of_bound)(iki_linefile_type linefile);
    IKI_DLLESPEC void US(iki_generate_warning_for_ignored_write)(iki_linefile_type linefile);

    /** Dynamic type : dynamic array APIs **/
    IKI_DLLESPEC void US(iki_svlog_dynamic_array_create)(char* dynamic_array, int type_id, char* array_size, int element_size, int elem_bit_size, int is_elem_2state, int sensitiveProcessOffsetFropDP);
    IKI_DLLESPEC char* US(iki_svlog_dynamic_array_size)(char* dynamic_array, char* return_value) ; 
    IKI_DLLESPEC char* US(iki_svlog_dynamic_array_index_select_read)(char* dynamic_array, char* index);
    IKI_DLLESPEC void US(iki_svlog_dynamic_array_index_select_write)(char* dynamic_array, char* index, char* value);
    IKI_DLLESPEC void US(iki_svlog_dynamic_array_delete)(char* dynamic_array) ; 
    IKI_DLLESPEC void US(iki_svlog_dynamic_array_reallocate)(char* dst, int new_size, int type_id, int element_size, int elem_bit_size, int is_elem_2state) ; 

    /** Dynamic type : open vector APIs **/

    IKI_DLLESPEC void US(iki_svlog_open_vector_create)(char* open_vector, int type_id, char* vector_size);
    IKI_DLLESPEC void US(iki_svlog_open_vector_delete)(char* dynamic_array) ; 
    IKI_DLLESPEC void US(iki_svlog_open_vector_reallocate)(char* dst, int new_size, int type_id) ; 
    IKI_DLLESPEC void US(iki_svlog_open_vector_write)(char* open_vector, unsigned size, char* value);
    IKI_DLLESPEC char* US(iki_svlog_open_vector_read)(char* open_vector);
    IKI_DLLESPEC char* US(iki_svlog_open_vector_data)(char* open_vector);
    IKI_DLLESPEC char* US(iki_svlog_open_vector_size)(char* open_vector, char* return_value);

    /** Dynamic type : associative array APIs **/
    // Random access APIs
    //IKI_DLLESPEC char* US(iki_svlog_assoc_array_index_select_read)(char* assoc_array, char* index, char* return_value, int value_size, int isElem2State ) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_index_select_read)(char* assoc_array, char* index, int length) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_index_select_get_value)(char* assoc_array, char* index, int type_id/*assoc_aray_type_id*/, int key_size, int value_size, int key_type/*integral/string/class/unpacked*/, int elementType2State, int isSignedKey, int ignore_write);
    IKI_DLLESPEC void  US(iki_svlog_assoc_array_index_select_write)(char* assoc_array, char* index, int type_id, int key_size, int value_size, int key_type, char* value, int isSignedKey) ; 
    IKI_DLLESPEC void  US(iki_svlog_assoc_array_add_wait_on_element)(char* assoc_array, char* index, int type_id, int key_size, int value_size, int key_type, char* process, int isSignedKey) ; 

    // Traversal APIs 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_first)(char* assoc_array, char* index_net, char* return_value, int key_size) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_next)(char* assoc_array, char* index_net, int is_foreach_next, char* return_value, int key_size) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_last)(char* assoc_array, char* index_net, char* return_value, int key_size) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_prev)(char* assoc_array, char* index_net, char* return_value, int key_size) ; 
#if 0
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_first_for_auto)(char* assoc_array, char* index_net, char* return_value) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_next_for_auto)(char* assoc_array, char* index_net, int is_foreach_next, char* return_value) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_last_for_auto)(char* assoc_array, char* index_net, char* return_value) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_prev_for_auto)(char* assoc_array, char* index_net, char* return_value) ; 
#endif
    
    // Deletion APIs
    IKI_DLLESPEC void US(iki_svlog_assoc_array_delete)(char* assoc_array) ; 
    IKI_DLLESPEC void US(iki_svlog_assoc_array_delete_with_index)(char* assoc_array, char* index, int index_len) ;

    // Misc. APIs
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_size)(char* assoc_array, char* return_value) ; 
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_num)(char* assoc_array, char* return_value) ;
    IKI_DLLESPEC char* US(iki_svlog_assoc_array_exists)(char* assoc_array, char* index, char* return_value, int index_len) ;

    // Set Default value of Associative Array API
    IKI_DLLESPEC void US(iki_svlog_assoc_array_set_default)(char* assoc_array, /*char* index,*/ int type_id, int key_size, int value_size, int key_type, char* defaultValue, int isSignedKey) ;
    IKI_DLLESPEC void US(iki_svlog_assoc_array_set_default_null)(char* assoc_array) ;

    /** Dynamic type : queue related APIs **/
    // PUSH APIs
    IKI_DLLESPEC void US(iki_svlog_queue_push_back)(char* q, char* element, int type, int element_size, int q_size) ;
    IKI_DLLESPEC void US(iki_svlog_queue_push_front)(char* q, char* element, int type, int element_size, int q_size) ;

    // POP APIs
    IKI_DLLESPEC char* US(iki_svlog_queue_pop_back)(char* q, int element_size) ;
    IKI_DLLESPEC char* US(iki_svlog_queue_pop_front)(char* q, int element_size) ;

    // INDEX SELECT APIs
    IKI_DLLESPEC char* US(iki_svlog_queue_index_select_read)(char* q, char* index, int element_size) ; 
    IKI_DLLESPEC void  US(iki_svlog_queue_index_select_write)(char* q, char* index, int type_id, int bounded_size, int element_size, char* element);
    IKI_DLLESPEC char* US(iki_svlog_queue_index_select_get_value)(char* q, char* index, int type_id, int bounded_size, int element_size, int is_elem_2_state_type, int ignore_write);

    // MISC APIs
    IKI_DLLESPEC void US(iki_svlog_queue_delete)(char* q) ; 
    IKI_DLLESPEC void US(iki_svlog_queue_delete_with_index)(char* q, int element_size, char *index) ; 
    IKI_DLLESPEC char* US(iki_svlog_queue_size)(char* q, char* return_value) ; 

    IKI_DLLESPEC void iki_svlog_queue_insert(char* queue, char* data, int type_id, int element_size, int q_size, char* index) ; 


    /*===============================*/
    /*= SystemVerilog array methods =*/
    /*===============================*/
    IKI_DLLESPEC char *US(iki_svlog_array_sum_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_sum_dynamic)(char*, char*, void*, char*, int, int, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_signed_product_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_unsigned_product_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_and_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_or_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_xor_with)(char*, char*, int, int, char*, void*, char*, int, int, ...);
    IKI_DLLESPEC void US(iki_svlog_array_sort_with)(/*char*,*/int, char*, int, char*, void*, char*, int, int, int, int, ...);
    IKI_DLLESPEC void US(iki_svlog_array_sort_dynamic)(/*char*,*/int, char*, void*, char*, int, int, int, int,int,int, ...);
    IKI_DLLESPEC void US(iki_svlog_array_shuffle_dynamic)(int, char*, int, ...);
    IKI_DLLESPEC void US(iki_svlog_array_reverse)(/*char*,*/int, char*, int, char*, void*, char*, int, int, int, ...);
    IKI_DLLESPEC void US(iki_svlog_array_shuffle)(/*char*,*/int, char*, int, char*, void*, char*, int, int, int, ...);
    IKI_DLLESPEC char * US(iki_svlog_get_value_from_iterator)(char * item, int length, int setback);

    /*===============================*/
    /*= SystemVerilog array locator methods =*/
    /*===============================*/
    IKI_DLLESPEC char *US(iki_svlog_array_find)(char*, char*, void*, char*, int, int, int, int, int,int,int, ...);
    IKI_DLLESPEC char *US(iki_svlog_array_find_index)(char*, char*, void*, char*, int, int, int, int, ...);

    // End SystemVerilog functions
    // IKI methods for DPI-C conversions
    IKI_DLLESPEC void US(iki_memset_sv_to_dpi)(char* dst, char* src, int numCBytes, int is2state);
    IKI_DLLESPEC void US(iki_memset_sv_logic_1_to_dpi)(char* dst, char* src);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv)(char* dst, char* src, int numCBytes, int is2state);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv_logic_1)(char* dst, char* src);
    IKI_DLLESPEC void US(iki_set_dpi_func_name)(const char* funcName);
    IKI_DLLESPEC void US(iki_memset_sv_to_dpi_unpacked_logic_with_packed_dim)(char* dst, char* src, int pckdSz, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_sv_to_dpi_unpacked_logic)(char* dst, char* src, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_sv_to_dpi_unpacked_bit_with_packed_dim)(char* dst, char* src, int pckdSz, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_sv_to_dpi_unpacked_bit)(char* dst, char* src, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv_unpacked_logic_with_packed_dim)(char* dst, char* src, int pckdSz, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv_unpacked_logic)(char* dst, char* src, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv_unpacked_bit_with_packed_dim)(char* dst, char* src, int pckdSz, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_memset_dpi_to_sv_unpacked_bit)(char* dst, char* src, int *numRshift, int *shift);
    IKI_DLLESPEC void US(iki_svlog_dpi_validate_openarray_constraint)(unsigned typeId, char* valuePtr, char* constraint_ptr);

    // SystemVerilog functions
    IKI_DLLESPEC void US(iki_svlog_ifcase_warning)(const char*, const char*, const char*, int);
    IKI_DLLESPEC void US(iki_svlog_push_unique_label)();
    IKI_DLLESPEC char* US(iki_svlog_store_unique_label)(char *trueLabel, char *nextCondLabel, const char *ifCaseType,
            const char* fileName, int lineNum, int condLineNum);
    IKI_DLLESPEC char* US(iki_svlog_get_unique_label)();
    IKI_DLLESPEC void US(iki_svlog_pop_unique_label)();
    IKI_DLLESPEC void US(iki_set_sv_type_file_path_name)(const char* val);
    IKI_DLLESPEC void US(iki_enable_solver_debugging)();
    IKI_DLLESPEC void US(iki_svlog_save_coverage_db)();
    IKI_DLLESPEC void US(iki_set_crvs_dump_file_path_name)(const char* val);
    IKI_DLLESPEC char* US(iki_svlog_enum_name)(char *dst, int typeId, char* val);
    IKI_DLLESPEC char* US(iki_svlog_enum_next)(int typeId, char* val, int step);
    IKI_DLLESPEC char* US(iki_svlog_enum_prev)(int typeId, char* val, int step);


    IKI_DLLESPEC char *US(iki_svlog_math_clog2)(char* src, int len) ;
   
    IKI_DLLESPEC void US(iki_svlog_array_out_of_bound_read)(char* retVal, int typeId, int size, int unitSize, int isValidTypeX, int typeX, int isPartSelect) ;

    /**** Dynamic type related API support ****/
    IKI_DLLESPEC void US(iki_create_string_from_vlog_value_s)(char* dst, char* src, int length, int isStringOnRHS, int elemCount) ;

    /** UPAAWD relate changes **/
    IKI_DLLESPEC char* US(iki_dc_assign)(int lhs_type_id, ...) ;
    IKI_DLLESPEC char* US(iki_dc_multi_concat_assign)(int lhs_type_id, ...) ; 
    IKI_DLLESPEC char* US(iki_create_container)(int no_of_sub_container, ...) ; 
    IKI_DLLESPEC int US(iki_dc_copy_to_c_buffer)(char* dst, char* src, unsigned isImplicitType, int type_id, ...);
    IKI_DLLESPEC int US(iki_c_buffer_copy_to_dc)(char* dst, char* src, unsigned isImplicitType, int type_id, ...);
    IKI_DLLESPEC char* US(iki_dc_get_elem_ptr)(char* src, int type_id, ...);
    IKI_DLLESPEC char* US(iki_svlog_dynamic_array_equal)(char* result, int is_logeq, char* op1, int sv_type1, char* op2, int sv_type2, int no_of_constraints1, int no_of_constraints2, ...);
    IKI_DLLESPEC char* US(iki_svlog_dynamic_array_part_select_equal)(char* result, int is_logeq, char* op1, int sv_type1, char* op2, int sv_type2, int no_of_constraints1, int no_of_constraints2, ...);
    /*
    IKI_DLLESPEC void US(dynamic_container_copy)(char* dst, ISIM::SVType *dst_type, char* dst_start, char* dst_end, char* src, ISIM::SVType *src_type, char* src_start, char* src_end, bool is_rhs_an_element) ; 
    IKI_DLLESPEC void US(adjust_index)(ISIMK::s_vlog_value_s& return_index, ISIM::SVType* type, char* start, int index) ; 
    IKI_DLLESPEC char* US(get_element)(char* place_holder, ISIM::SVType* type, ISIM::s_vlog_value_s* index) ; 
    IKI_DLLESPEC int US(get_no_of_elements)(char* place_holder, ISIM::SVType *type, char* start, char* end) ; 
    IKI_DLLESPEC void US(
    */

    /** Event Support **/
    IKI_DLLESPEC void US(iki_create_sync_object_for_event) (char* value,int IsDynamicAlwaysBlockPresent);
    IKI_DLLESPEC void US(iki_create_sync_object_for_event_declaration) (char* eventValue, int size);
    IKI_DLLESPEC void US(iki_add_dynamic_wait_on_event) (char* value, int edge, unsigned isCoverageEvent, unsigned coverGroupIndex);
    IKI_DLLESPEC void US(iki_remove_dynamic_wait_on_event) (char* value, char* process);
    IKI_DLLESPEC void US(iki_trigger_event) (char* value);
    IKI_DLLESPEC void US(iki_reset_trigger_for_coverage_sample_event) (char* value);
    IKI_DLLESPEC void US(iki_non_blocking_trigger_event) (char* value, uint64 time);
    IKI_DLLESPEC void US(iki_event_triggered) (char* result, char* value);
    IKI_DLLESPEC void US(iki_clear_event_triggered) (char* value);

    /** For Program Block **/
    IKI_DLLESPEC void US(iki_svlog_increment_prog_block_initial_process_count) ();

    /** Dynamic sensitivity support **/
    //IKI_DLLESPEC void US(iki_deregister_dt_wait)(char* value_holder, char* method_pointer) ; 
    IKI_DLLESPEC void US(iki_register_dt_wait)(char* value_holder, char *process, int edge_type, int sv_type_id) ; 
    IKI_DLLESPEC void US(iki_register_dt_wait_on_queue_element)(char* value_holder) ; 
    IKI_DLLESPEC void US(iki_register_dt_wait_on_class_elem)(char* class_holder, char* class_member_loc, int64 range_start_index, int64 range_size, char *process, int edge_type, unsigned is_coverage_event, unsigned covergroup_index) ; 
    IKI_DLLESPEC void US(iki_remove_dt_wait_on_class_elem)(char* class_holder, char* class_member_loc, int64 range_start_index, int64 range_size, char *process) ; 
    IKI_DLLESPEC void US(iki_vlog_dt_bit_copy)(char* class_holder, char* dstValue, int dstIndex, char* srcValue, int srcIndex, int length);
    IKI_DLLESPEC void US(iki_vlog_dt_bit_copy_size)(char* class_holder, char* dstValue, int dstIndex, char* srcValue, int srcIndex, int length, unsigned target_svTypeId);
    IKI_DLLESPEC void US(iki_vlog_invoke_dynamic_processes)(char* class_holder, char* dstValue, int dstIndex, char* srcValue, int srcIndex, int length);

    /** Random constraint support **/
    IKI_DLLESPEC void US(iki_set_rc_trial_count)(int trial_count) ; 
    IKI_DLLESPEC char* US(iki_randomize_dist)(char* return_value, int rand_case, int no_of_dist_element, ...) ; 
    IKI_DLLESPEC void US(iki_register_pre_randomized_function)(int no_of_entry, ...) ;
    IKI_DLLESPEC void US(iki_register_post_randomized_function)(int no_of_entry, ...) ;
    IKI_DLLESPEC void US(iki_register_size_constraint_var)(int no_of_size_constraint_var, ...) ; 
    IKI_DLLESPEC void US(iki_register_temporal_dependency)(int no_of_elements, ...) ; 
    IKI_DLLESPEC void US(iki_register_constraint_function)(int type_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset) ; 
    IKI_DLLESPEC void US(iki_register_value_function)(int member_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset) ; 
    //IKI_DLLESPEC void US(iki_register_range_function)(int member_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip) ; 
    IKI_DLLESPEC void US(iki_register_dependency)(int no_of_member, ...) ; 
    IKI_DLLESPEC void US(iki_range_registration)(int no_of_argument, ...) ; 
    IKI_DLLESPEC char* US(iki_range_assign)(char* return_value) ; 
    IKI_DLLESPEC char* US(iki_create_race_var)(char* return_value, char* location, int sv_type_id, int race_var_id, int no_of_constraints, ...) ;

    IKI_DLLESPEC char* US(iki_randomize)(char* return_value, char* class_object, char* instance_offset, char* calling_process_offset, char* current_subprogram_invocation, iki_linefile_type lineFile) ;

    IKI_DLLESPEC void US(iki_register_constraint_function_race)(int type_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset, int constraint_id);
    IKI_DLLESPEC void US(iki_mark_variable_fixed)(char* location, int offset, int size);
    IKI_DLLESPEC void US(iki_register_size_constraint_var_race)(int no_of_size_constraint_var, ...);
    IKI_DLLESPEC void US(iki_register_race_registration_function)(int type_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset);
    IKI_DLLESPEC void US(iki_svlog_race_node_registration)(char* location, int offset, int size, int race_node_id, int is_array);
    IKI_DLLESPEC void US(iki_svlog_race_node_registration_runtime)(char* location, int offset, int size, char* race_node_id, char* deref);
    IKI_DLLESPEC void US(iki_svlog_foreach_node_registration)(char* location, int offset, int size);
    IKI_DLLESPEC void US(iki_svlog_create_race_tree)(int constraint_id, char* race_node_id, char* location, int offset, int size);
    IKI_DLLESPEC void US(iki_register_constraint)(int class_id, int no_of_constraints, ...);
    IKI_DLLESPEC void US(iki_register_function_dependency_race)(char* location, int dst_index, int size, int function_id) ; 
    IKI_DLLESPEC void US(iki_svlog_race_array_sum)(char* location, int dst_index, int size, int sv_class_id, int sv_array_type, char *member_name, int dummy_expr_id, int constraint_id) ; 
    IKI_DLLESPEC void US(iki_register_value_function_race)(int class_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset, int function_id) ;
    IKI_DLLESPEC void US(iki_register_member_dependency_fn_reg)(int class_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset) ; 
    IKI_DLLESPEC void US(iki_register_value_race)(char* location, int offset, int size, int is_signed, int number_of_values, ...) ;
    IKI_DLLESPEC void US(iki_register_member_dependency)(char* location, int offset, int size, int no_of_necessary_args, ...) ; 
    IKI_DLLESPEC void US(iki_register_pre_randomized_function_race)(int no_of_entry, ...) ;
    IKI_DLLESPEC void US(iki_register_post_randomized_function_race)(int no_of_entry, ...) ;
    IKI_DLLESPEC void US(iki_register_size_constraint_fn)(int type_id, char* method_pointer, unsigned int method_size, int64 method_offset_from_dp, int64 method_offset_from_ip, char* instance_offset);
    IKI_DLLESPEC void US(iki_register_size_constraint)(char*, int, int, char*, int, int) ; 
    IKI_DLLESPEC void US(iki_set_rand_mode)(char* location, int dst_index, int size, char* rand_value, int class_present, int type_id, int class_type_id, int member_index) ;
    IKI_DLLESPEC char* US(iki_get_rand_mode)(char* return_value, char* location, int dst_index, int size);
    IKI_DLLESPEC char* US(iki_randomize_race)(char* return_value, void *helper_func, char *IP, char* class_object, char* instance_offset, char* calling_process_offset, char* current_subprogram_invocation, iki_linefile_type lineFile);
    IKI_DLLESPEC void US(iki_set_constraint_mode)(char *actual_class, int constraint_id, char* mode);
    IKI_DLLESPEC char* US(iki_get_constraint_mode)(char *actual_class, int constraint_id, char* result);

    /** std::process class support **/
    IKI_DLLESPEC void US(iki_sv_std_process_self)(char* returnHandle);
    IKI_DLLESPEC void US(iki_sv_std_process_status)(char* processObjHandle, char* status, iki_linefile_type linefile);
    IKI_DLLESPEC int  US(iki_sv_std_process_kill)(char* processObjHandle, char* currProc, iki_linefile_type linefile);
    IKI_DLLESPEC int  US(iki_sv_std_process_await)(char* processObjHandle, char* currProc, char* exitLabel, char* nextBlockLabel, iki_linefile_type linefile);
    IKI_DLLESPEC int  US(iki_sv_std_process_suspend)(char* processObjHandle, char* currProc, char* nextBlockLabel, iki_linefile_type linefile);
    IKI_DLLESPEC void  US(iki_class_srandom)(char* classObjHandle, char* seed, iki_linefile_type linefile);
    IKI_DLLESPEC char*  US(iki_class_get_randstate)(char* classObjHandle, char* state, iki_linefile_type linefile);
    IKI_DLLESPEC void  US(iki_class_set_randstate)(char* classObjHandle, char* state, iki_linefile_type linefile);
    IKI_DLLESPEC void US(iki_sv_std_process_resume)(char* processObjHandle, iki_linefile_type linefile);

    IKI_DLLESPEC void US(iki_vlog_finish_process)(char* processProp);
    IKI_DLLESPEC void US(iki_vlog_set_current_process_waiting)();

    /** Functional Coverage support **/
    IKI_DLLESPEC char* US(iki_svlog_pop_coverpoint_iter_value)();
    IKI_DLLESPEC void US(iki_svlog_allocate_init_covergroup_class_object)(char* objPtr, int coverGroupIndex, char* name, int size, int numOfIndexes, ...);
    IKI_DLLESPEC void US(iki_svlog_set_embedded_covergroup_class_object)(char* name, int name_size, int numOfIndexes, ...);
    IKI_DLLESPEC void US(iki_svlog_populate_tbin_info)(unsigned int cpIndex, unsigned int cbIndex, int binCount, int hasWithClause, char* func, char* IP, char* SP, int numOfSeqs, ...);
    IKI_DLLESPEC void US(iki_svlog_populate_bin_info)(unsigned int cpIndex, unsigned int cbIndex, unsigned isAutoBin, int binCount, int hasWithClause, char* func, char* IP, char* SP, int no_of_argument, ...);
    IKI_DLLESPEC void US(iki_svlog_start_covergroup)(char* objPtr);
    IKI_DLLESPEC void US(iki_svlog_stop_covergroup)(char* objPtr);
    IKI_DLLESPEC void US(iki_svlog_start_coverpoint)(char* objPtr, unsigned int cpIndex);
    IKI_DLLESPEC void US(iki_svlog_stop_coverpoint)(char* objPtr, unsigned int cpIndex);
    IKI_DLLESPEC void US(iki_svlog_start_crosspoint)(char* objPtr, unsigned int cpIndex);
    IKI_DLLESPEC void US(iki_svlog_stop_crosspoint)(char* objPtr, unsigned int cpIndex);
    IKI_DLLESPEC void US(iki_svlog_covergroup_set_inst_name)(char* instName, char* objPtr);
    IKI_DLLESPEC void US(iki_svlog_set_coverage_db_name)(char* dbName);
    IKI_DLLESPEC void US(iki_svlog_load_coverage_db)(char* dbName);
    IKI_DLLESPEC void US(iki_svlog_enable_bin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_disable_bin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_enable_tbin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_disable_tbin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_enable_cross_bin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_disable_cross_bin_info)(char* objPtr, unsigned int cpIndex, unsigned int cbIndex);
    IKI_DLLESPEC void US(iki_svlog_update_coverage_data)(char* objPtr, int cpIndex, char* value);
    IKI_DLLESPEC void US(iki_svlog_coverpoint_update_info)(int cpIndex, int typeId, int numOfEnumValues, ...);
    IKI_DLLESPEC void US(iki_svlog_cross_coverpoint_update_info)(int cpIndex);
    IKI_DLLESPEC void US(iki_svlog_populate_cross_point_info)(unsigned int ccpIndex, char* name, int name_size, int num_of_explicit_bins, int no_of_argument, ...);
    IKI_DLLESPEC void US(iki_svlog_set_dynamic_bin_info)(char* aValue, int argsPresent);
    IKI_DLLESPEC void US(iki_svlog_update_covergroup_option)(char* objPtr, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC void US(iki_svlog_update_coverpoint_option)(char* objPtr, int cpIndex, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC void US(iki_svlog_update_crosspoint_option)(char* objPtr, int ccpIndex, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC void US(iki_svlog_update_type_covergroup_option)(int cgIndex, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC void US(iki_svlog_update_type_coverpoint_option)(int cgIndex, int cpIndex, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC void US(iki_svlog_update_type_crosspoint_option)(int cgIndex, int ccpIndex, int type, int option, char* aValue, int value_size);
    IKI_DLLESPEC int  US(iki_svlog_get_coverpoint_int_option_or_type_option)(char* objPtr, int cpIndex, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_coverpoint_string_option_or_type_option)(char* objPtr, int cpIndex, int type, int option);
    IKI_DLLESPEC int  US(iki_svlog_get_crosspoint_int_option_or_type_option)(char* objPtr, int ccpIndex, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_crosspoint_string_option_or_type_option)(char* objPtr, int ccpIndex, int type, int option);
    IKI_DLLESPEC int  US(iki_svlog_get_covergroup_int_option_or_type_option)(char* objPtr, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_covergroup_string_option_or_type_option)(char* objPtr, int type, int option);
    IKI_DLLESPEC int  US(iki_svlog_get_type_coverpoint_int_option_or_type_option)(int cgInstIndex, int cpIndex, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_type_coverpoint_string_option_or_type_option)(int cgInstIndex, int cpIndex, int type, int option);
    IKI_DLLESPEC int  US(iki_svlog_get_type_crosspoint_int_option_or_type_option)(int cgInstIndex, int ccpIndex, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_type_crosspoint_string_option_or_type_option)(int cgInstIndex, int ccpIndex, int type, int option);
    IKI_DLLESPEC int  US(iki_svlog_get_type_covergroup_int_option_or_type_option)(int cgInstIndex, int type, int option);
    IKI_DLLESPEC char* US(iki_svlog_get_type_covergroup_string_option_or_type_option)(int cgInstIndex, int type, int option);
    IKI_DLLESPEC void US(iki_svlog_update_cross_coverage_data)(char* objPtr, int ccpIndex, int isTrue);
    IKI_DLLESPEC void US(iki_svlog_binsof_binary_update)(unsigned ccpIndex, int explicitBinIndex, int operType, int left_binsof_index, int right_binsof_index);
    IKI_DLLESPEC void US(iki_svlog_binsof_unary_update)(unsigned ccpIndex, int explicitBinIndex, int binsof_index);
    IKI_DLLESPEC void US(iki_svlog_cross_bin_with_update)(unsigned ccpIndex, int explicitBinIndex, int matches, char* func, char* IP, char* SP, int numOfArguments, ...);
    IKI_DLLESPEC void US(iki_svlog_binsof_populate_index_pairs)(unsigned ccpIndex, int explicitBinIndex, char* name, int name_size, int valueType);
    IKI_DLLESPEC void US(iki_svlog_binsof_select_condition_update)(unsigned ccpIndex, unsigned explicitBinIndex, unsigned binsof_index, int crossOrCover, int binsOf_cpIndex, int binsOf_cbIndex, int binsOf_cb_binIndex, int size, int no_of_arguments, ...);
    IKI_DLLESPEC void US(iki_svlog_value_assignment_update)(unsigned ccpIndex, unsigned explicitBinIndex, int matches, char* name, int nameSize, int valueType, int noOfArguments, ...);
    IKI_DLLESPEC void US(iki_set_sv_coverage_file_path_name)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_coverage_cons_file_path_name)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_coverage_run_dir)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_coverage_run_name)(const char* val);
    IKI_DLLESPEC double US(iki_svlog_covergroup_get_inst_coverage)(double coverage, char* objPtr, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_coverpoint_get_inst_coverage)(double coverage, char* objPtr, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_cross_coverpoint_get_inst_coverage)(double coverage, char* objPtr, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_covergroup_get_coverage)(double coverage, char* objPtr, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_coverpoint_get_coverage)(double coverage, char* objPtr, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_cross_coverpoint_get_coverage)(double coverage, char* objPtr, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_type_covergroup_get_coverage)(double coverage, int cgIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_type_coverpoint_get_coverage)(double coverage, int cgIndex, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_type_cross_coverpoint_get_coverage)(double coverage, int cgIndex, unsigned cpIndex, int numOfArguments, ...) ; 
    IKI_DLLESPEC double US(iki_svlog_get_coverage)(double coverage) ; 
    IKI_DLLESPEC unsigned US(iki_svlog_get_strobe_for_covergroup)(int cgIndex);

    /** Code Coverage support **/
    IKI_DLLESPEC void US(iki_set_sv_code_coverage_db)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_code_coverage_dir)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_code_coverage_db_from_tcl)(const char* val);
    IKI_DLLESPEC void US(iki_set_sv_code_coverage_type)(const char* val);
    IKI_DLLESPEC void US(iki_svlog_line_coverage_sample)(unsigned int fileID, unsigned int hitCountIndexFile, unsigned int moduleID, unsigned int hitCountIndexModule, unsigned int lineNo);
    IKI_DLLESPEC void US(iki_svlog_branch_coverage_sample)(unsigned int fileID, unsigned int moduleID, unsigned int branchID, unsigned int hitCountIndexModule);
    IKI_DLLESPEC void US(iki_svlog_cond_coverage_sample)(unsigned int fileID, unsigned int moduleID, unsigned int hitCountIndexModule, unsigned int updateType);
    IKI_DLLESPEC void US(iki_svlog_toggle_coverage_sample)(char* curr_value, char* new_value, unsigned int startIndex, unsigned int endIndex, unsigned int toggleHitCountIndex, unsigned int type);
    IKI_DLLESPEC void US(iki_svlog_save_code_coverage_db)();
    IKI_DLLESPEC void US(iki_svlog_save_code_coverage_db_tcl)();

    /** HWSW Cosim Support **/
    IKI_DLLESPEC void US(iki_set_cosim_hostname)(const char* val);
    IKI_DLLESPEC void US(iki_set_cosim_portno)(const char* val);
    IKI_DLLESPEC void US(iki_set_cosim_numswbridge)(const char* val);

#endif


