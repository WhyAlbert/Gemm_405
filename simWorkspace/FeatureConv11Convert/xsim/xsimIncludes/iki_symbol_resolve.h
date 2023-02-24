// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#ifndef IKI_SYMBOLS_H
#define IKI_SYMBOLS_H
 // Pre-built Transaction function functions and functions used by them

    // VHDL
    // Transaction functions for no HDL wait on net, but handles attributes and tracing
    IKI_DLLESPEC void US(vhdl_transfunc_eventcallback)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);

    // Transaction function for no HDL wait on net and no attribute or tracing needs
    IKI_DLLESPEC void US(vhdl_transfunc_noeventcallback)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);

    // Transaction function that processes simple )(no special attributes, singly driven) nets with one NSR
    // on whole range
    IKI_DLLESPEC void US(vhdl_ep_wait_info)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vhdl_ep_wait_info_edge)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);

    IKI_DLLESPEC void US(vhdl_ep_nsr_whole)(char* design_ptr, char *new_value, unsigned int driver_id,
                unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vhdl_ep_nsr)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vhdl_ep_nsr_tree)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);

    // Transaction functions that process complex nets with NSRs in VHDL
    IKI_DLLESPEC void US(vhdl_ep_wait_info_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int physical_setback, unsigned int num_bytes, char* net) ;
    IKI_DLLESPEC void US(vhdl_ep_wait_info_edge_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int physical_setback, unsigned int num_bytes, char* net) ;
    IKI_DLLESPEC void US(vhdl_ep_nsr_whole_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int physical_setback, unsigned int num_bytes, char* net) ;
    IKI_DLLESPEC void US(vhdl_ep_nsr_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int physical_setback, unsigned int num_bytes, char* net) ;
    IKI_DLLESPEC void US(vhdl_ep_nsr_tree_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int physical_setback, unsigned int num_bytes, char* net) ;

    IKI_DLLESPEC void US(vlog_ep_wait_info)(char* design_ptr, char *new_value, unsigned int driver_id,
                unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vlog_ep_wait_info_edge)(char* design_ptr, char *new_value, unsigned int driver_id,
                    unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_whole)(char* design_ptr, char *new_value, unsigned int driver_id,
                unsigned int start_index, unsigned int end_index, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int start_index, unsigned int end_index, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_tree)(char* design_ptr, char *new_value, unsigned int driver_id,
                unsigned int start_index, unsigned int end_index, char* net);

    IKI_DLLESPEC void US(vlog_ep_nsr_tree_2state)(char* design_ptr, char *new_value, unsigned int driver_id,
                unsigned int start_index, unsigned int end_index, char* net);

    IKI_DLLESPEC void US(vlog_ep_wait_info_scalar)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_wait_info_edge_scalar)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_whole_scalar)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_scalar)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_tree_scalar)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_wait_info_vector)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_nsr_wait_info_edge_vector)(char *new_value, char* net);
    IKI_DLLESPEC void US(vlog_ep_combined_wait_info_vector)(char* design_ptr, char* new_value, unsigned int driver_id,
                unsigned int start_index, unsigned int end_index, char* net);

    // Transaction functions that processes complex nets (multiply driven, etc.)
    IKI_DLLESPEC void US(vlog_ep_wait_info_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_wait_info_vector_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_wait_info_edge_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_wait_info_edge_vector_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_whole_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_tree_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;

    // Transaction functions that process complex scalar nets (multiply driven, etc.)
    IKI_DLLESPEC void US(vlog_ep_wait_info_scalar_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_wait_info_edge_scalar_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_whole_scalar_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_scalar_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;
    IKI_DLLESPEC void US(vlog_ep_nsr_tree_scalar_complex)(char* design_ptr, char* new_value, unsigned int driver_id, unsigned int start_index, unsigned int end_index, char* net) ;

    IKI_DLLESPEC void US(vlog_ep_combined_wait_info_vector_complex)(char* design_ptr, char* new_value, unsigned int driver_id,
                unsigned int start_index, unsigned int end_index, char* net);

    IKI_DLLESPEC void US(vlog_transfunc_eventcallback)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int start_index, unsigned int end_index, char* net);
    IKI_DLLESPEC void US(vlog_transfunc_eventcallback_2state)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);

    IKI_DLLESPEC void US(vlog_transfunc_noeventcallback)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);
    IKI_DLLESPEC void US(vlog_transfunc_noeventcallback_2state)(char* design_ptr, char *new_value, unsigned int driver_id,
            unsigned int physical_setback, unsigned int num_bytes, char* net);
    // End pre-built transaction functions

    // Pre-built process execute functions for simulation acceleration
    // Verilog pre-built execute functions
    IKI_DLLESPEC void US(vlog_simple_process_execute_0_fast)(char* dp, char *ip, char* process); /*<= 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_0_fast_no_reg)(char* dp, char *ip, char* process); /*<= 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_0_fast_no_agg)(char* dp, char *ip, char* process); /*<= 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_0_fast_no_reg_no_agg)(char* dp, char *ip, char* process); /*<= 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_0_fast_for_reg)(char* dp, char *ip, char* process); /*<= 32 bit transactions */

    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast)(char* dp, char *ip, char* process); /*> 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast_no_reg)(char* dp, char *ip, char* process); /*> 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast_no_agg)(char* dp, char *ip, char* process); /*> 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast_no_reg_no_agg)(char* dp, char *ip, char* process); /*> 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast_for_reg)(char* dp, char *ip, char* process); /*> 32 bit transactions */
    IKI_DLLESPEC void US(vlog_simple_process_execute_1_fast_real)(char* dp, char *ip, char* process); /*> 32 bit transactions */

    IKI_DLLESPEC void US(vlog_const_rhs_process_execute_0_fast)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_const_rhs_process_execute_0_fast_for_reg)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_const_rhs_process_execute_0_fast_no_reg_no_agg)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_const_rhs_process_execute_0_fast_no_agg)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_const_rhs_process_execute_0_fast_no_reg)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_timingcheck_execute_0)(char* dp, char *ip, char* process);
    IKI_DLLESPEC void US(vlog_sv_sequence_execute_0)(char* dp, char *ip, char* process);                                              
    // End pre-built process execute functions for simulation acceleration

    IKI_DLLESPEC void US(svlog_sampling_process_execute(char* dp, char *ip, char* process));
    IKI_DLLESPEC void US(svlog_sampling_in_postponed_region(char* process, char* net));
#endif


