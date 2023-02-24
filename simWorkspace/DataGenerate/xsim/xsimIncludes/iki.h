// $Id: iki.h,v 1.60 2011/12/07 23:08:49 valeria Exp $
/* Copyright 2009, Xilinx Inc.  All rights reserved.
 *
 * ISim Kernel Internal (IKI).
 *
 * NOTE: Do not include any other header files here, except the files as noted below.
 */

/*
 * --------------------------------------
 * To keep iki.h relatively small, split into multiple .h files which get included in iki.h.
 * Anytime we get around 100 functions of a some common type we should create a separate .h file and inlucde it in iki.h
 * ----------
 * iki.h : The only file that gets included by generated code. This should be used mainly for
 * simulation runtime process_execute and transaction functions (non expression related) stuff. It includes these files:
 *
 * 1. iki_vhdl_accel.h : vhdl math acceleration functions.
 * 2. iki_std_textio.h : vhdl textio functions.
 * 3, iki_vlog_timing_checker.h : verilog timing check related functions.
 * 4, iki_vlog_gate_switch.h : verilog gate/switch modeling related.
 * 5. iki_symbol_resolve.h : Functions that are not used by generated code directly, but necessary for symbol mapping.
 * 6. iki_vlog_math_expr.h : Verilog math and expression operations related.
 * 7. iki_svlog_math_dynamic.h : System verilog math operations and dynamic types related .
 * 8. iki_vlog_sys_task.h : verilog/system-verilog system tasks and functions related.
 * 9. iki_vhdl_math_expr.h : vhdl math and expression operations related.
 * 10.iki_systemc.h : SystemC simulation related API's
 * -------------------------------------------------------------
*/
#ifndef IKI_H
#define IKI_H

#ifdef  __cplusplus
extern "C" {
#endif

#if defined(_WIN32)
#ifdef IKI_EXPORT
#define IKI_DLLESPEC __declspec(dllexport)
#else
#define IKI_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef IKI_DLLESPEC
#define IKI_DLLESPEC
#endif
#endif

#ifndef INT64_UINT64
#define INT64_UINT64
    typedef unsigned long long uint64;
    typedef long long int64;
#endif

// Previously, we needed to add an underscore to each function declaration
//  on Windows when compiling with clang in order to facilitate linking.
//  With the upgrade to MinGW equivalent to gcc 6.2.0 on Windows,
//  the linking issue with multiple underscores is no longer a problem.

#define US(X) X

#if defined(_MSC_VER)
#define strcasecmp stricmp
#elif defined(__GNUC__)
#define stricmp strcasecmp
#define _vsnprintf vsnprintf
#endif

    typedef unsigned long iki_linefile_type;

//Gracia: Need to clean this workaround later
    typedef struct {
        unsigned typeId;
        int packedWidth; //Packed dim 
        int numUDim;
        int numCBytes;
        int isSlice;
        int *uDimArray;
        int *selectIndex;
        char* data;
    } svOpenArray;
    
#include "iki_vlog_gate_switch.h"
#include "iki_vlog_timing_checker.h"
#include "iki_std_textio.h"
#include "iki_vhdl_accel.h"
#include "iki_symbol_resolve.h"
#include "iki_vlog_math_expr.h"
#include "iki_vhdl_math_expr.h"
#include "iki_svlog_math_dynamic.h"
#include "iki_vlog_sys_task.h"
#include "iki_systemc.h"
#include <stdarg.h> 


    // Loading simulation, license check, starting, and stopping simulation
    // @
    IKI_DLLESPEC void* US(iki_create_design)(const char* memfile, void* relocateFunc, void* sensitizeFunc,
            void* simulateFunc, void* dpiInitFunc, unsigned sim_type_attributes, void* wdbWriterFunc, int controllerKind, int argc, char** argv);

    IKI_DLLESPEC void* US(iki_create_ccp_design)(const char* ccpmemfile, const char* memfile, void* relocateFunc, void* sensitizeFunc,
            void* simulateFunc, void* dpiInitFunc, unsigned sim_type_attributes, void* wdbWriterFunc, int controllerKind, int argc, char** argv);
    /****
             Retiring AXI License check as per CR-961580 
             (Remove ALL AXI BFM related contents from tools)
             Commenting out in 2017.1, but Remove this commented code altogether in 2017.3
    ***/
    //IKI_DLLESPEC int US(iki_xilinx_lic_check)(const char* model, double version);
    IKI_DLLESPEC void US(iki_sensitize)(char *dp, char*);
    IKI_DLLESPEC void US(iki_sensitize_ccp)(char *dp, const char*, char*);
    IKI_DLLESPEC void US(iki_relocate)(char *dp, char*initdatafname, void*funcTable[], const int numId);
    IKI_DLLESPEC void US(iki_relocate_ccp)(char *dp, const char* ccpfname, char*initdatafname,void*funcTable[],     const int numId, void*ccpFuncTable[], const int ccpNumId);
    IKI_DLLESPEC void US(iki_relocate_old)(char *dp, char *initdatafname, char *exename, void *main_fptr);
    IKI_DLLESPEC void US(iki_relocate_ccp_old)(char *dp, const char *ccpfname, char *initdatafname, char *exename, void *main_fptr);
    IKI_DLLESPEC void US(iki_schedule_processes_at_time_zero)(char *dp, char*);
    IKI_DLLESPEC int US(iki_simulate_design)();
    IKI_DLLESPEC void US(iki_call_fatal_stop)(const char* msg);
    IKI_DLLESPEC void US(iki_call_fatal_stop_with_arg)(const char* msg, const char* arg);

    //wrapper for standard functions, mainly required to make clang work. Inlined 
    
    IKI_DLLESPEC void US(iki_std_memset)(char* str, int c, unsigned n);
    IKI_DLLESPEC void US(iki_std_memcpy)(char* str1, char* str2 , unsigned n);
    IKI_DLLESPEC char* US(iki_std_memcpy1)(char* str1, char* str2 , unsigned n);
    IKI_DLLESPEC int US(iki_std_memcmp)(char* str1, char* str2 , unsigned n);

    // Debugging/Waveform tracing
    IKI_DLLESPEC void US(iki_stmt_online)(iki_linefile_type lineFile);
    IKI_DLLESPEC char *US(iki_trace_vlog_net)(unsigned bitmap, char *traceProperties, unsigned firstScalarId,
            char *pTarget, char *pNewValue, unsigned offsetSI, unsigned numBits);
    IKI_DLLESPEC char *US(iki_trace_vhdl_net)(unsigned bitmap, char *traceProperties, unsigned firstScalarId,
            char *pTarget, char *pNewValue, unsigned physicalOffset, unsigned numBytes);
    // Manage tracing and last event etc. called by the transaction function
    IKI_DLLESPEC char* US(iki_vhdl_event_callback)(const char* net, char* new_value, unsigned setback, unsigned size);

    // Schedule and manage HDL processes
    IKI_DLLESPEC void US(iki_schedule_reactive_process)(char* process);
    IKI_DLLESPEC void US(iki_schedule_observed_process)(char* process);
    IKI_DLLESPEC void US(iki_schedule_reactive_process_priority)(char* process);
    IKI_DLLESPEC void US(iki_schedule_process)(char* process);
    IKI_DLLESPEC void US(iki_schedule_process_with_id)(char* process, int id);
    IKI_DLLESPEC void US(iki_schedule_process_priority)(char* process);
    IKI_DLLESPEC void US(iki_schedule_process_priority_multiple)(const char* offsets, int numOffsets);
    IKI_DLLESPEC void US(iki_schedule_process_immediate)(char* process);
    IKI_DLLESPEC void US(iki_schedule_process_sv_init)(char* process);
    IKI_DLLESPEC void US(iki_schedule_sv_var_initialize)(char *);
    IKI_DLLESPEC void US(iki_unschedule_process)(char* process);
    IKI_DLLESPEC void US(iki_execute_processes)();
    IKI_DLLESPEC void US(iki_schedule_process_final)(char* process);
    IKI_DLLESPEC void US(iki_vhdl_wait)(char* process, uint64 time);

    // Memory management
    IKI_DLLESPEC void US(iki_memset_int)(char* dst, int value, unsigned count);
    IKI_DLLESPEC void US(iki_memset_int64)(char* dst, int64 value, unsigned count);
    IKI_DLLESPEC void US(iki_memset_double)(char* dst, double value, unsigned count);
    IKI_DLLESPEC void US(iki_memset_data)(char* dst, char* value, unsigned valueSize, unsigned count);



    // copy valuePtr itself
    IKI_DLLESPEC void US(iki_memcpy_ref)(char* dst, char* valuePtr, unsigned ref_actual_is_dynamic);
    // Memory allocated remains valid till next time slot. Use this as scratch pad. Do not call US(iki_free)() on its handle. 
    // Can be used to return buffers to callers if they will be used in the same time slot.
    IKI_DLLESPEC char* US(iki_alloca)(unsigned noOfBytes);
    IKI_DLLESPEC char* US(iki_alloca8)(unsigned noOfBytes);
    // Same as above, but the allocated memeory is zeroed out
    IKI_DLLESPEC char* US(iki_calloca)(unsigned noOfBytes);
    IKI_DLLESPEC char* US(iki_calloca8)(unsigned noOfBytes);
    // Memory allocated remains valid until US(iki_free)() is called on its handle
    IKI_DLLESPEC char* US(iki_malloc)(unsigned noOfBytes);
    IKI_DLLESPEC char* US(iki_malloc8)(); // same as US(iki_malloc, but optimized for allocating 8 bytes
    IKI_DLLESPEC char* US(iki_malloc8_nba)(); // same as US(iki_malloc, but optimized for allocating 8 bytes
    // Same as above, but the allocated memeory is zeroed out
    IKI_DLLESPEC char* US(iki_calloc)(unsigned noOfBytes);
    IKI_DLLESPEC char* US(iki_calloc8)(); // same as US(iki_calloc, but optimized for allocating 8 bytes
    // Return the memory allocated via US(iki_malloc)() back to the mem pool.
    IKI_DLLESPEC void US(iki_free)(char* memory);
    IKI_DLLESPEC void US(iki_free8_nba)(char* memory);
    IKI_DLLESPEC char* US(iki_get_simulation_time_string)();

    // Allocate/deallocate memory on the stacks
    IKI_DLLESPEC char* US(iki_spush  )(unsigned noOfBytes) ;
    IKI_DLLESPEC char* US(iki_spushz )(unsigned noOfBytes) ;
    IKI_DLLESPEC void  US(iki_spop   )(unsigned noOfBytes) ;
    IKI_DLLESPEC char* US(iki_dpush  )(unsigned noOfBytes) ;
    IKI_DLLESPEC char* US(iki_dpushz )(unsigned noOfBytes) ;
    IKI_DLLESPEC void  US(iki_dpop   )(unsigned noOfBytes) ;    
  
    // Get the number of bytes after padding
    IKI_DLLESPEC unsigned int US(iki_align)(unsigned noOfBytes) ;  

    //  -----------------------------------------------------------------------------------
    //  Schedule transacting of a value to signal/reg
    // VHDL

    IKI_DLLESPEC void US(iki_check_delay)(uint64 time) ;

    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_fast)(char* signal, char* driver, unsigned setback,
            unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_parameter)(char* signal, unsigned relative_setback,
            unsigned noOfBytes, uint64 time);
    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_slow)(char* signal, char* driver, unsigned setback,
            unsigned noOfBytes, uint64 time);
    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_fast_size1)(char* signal, char* driver, unsigned setback);
    IKI_DLLESPEC void
    US(iki_vhdl_schedule_transaction_signal_fast_setback0)(char* signal, char* driver, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_fast_setback0_size1)(char* signal, char* driver);
    IKI_DLLESPEC void US(iki_vhdl_schedule_transaction_signal_slow_aggregate)(char* signal, char* driver, unsigned setback,
            unsigned noOfBytes, uint64 time);
    IKI_DLLESPEC void US(iki_vhdl_inertial_reject)(char* signal, char* driver, uint64 time, uint64 reject);
    IKI_DLLESPEC void US(iki_vhdl_inertial_reject_signal_parameter)(char* signal, uint64 time, uint64 reject);
    IKI_DLLESPEC void US(iki_dynamic_transaction_vhdl)(char* net, char *netNew, unsigned offset, unsigned size);
    IKI_DLLESPEC void US(iki_vhdl_propagate_transaction)(const char* net, char* value, unsigned setback, unsigned count,
            const char* targetNet);
    IKI_DLLESPEC void US(iki_vhdl_propagate_transaction_multiple)(const char* net, char* value, unsigned setback,
            unsigned count, const char* offsets, int numOffsets);
    IKI_DLLESPEC void US(iki_vhdl_propagate_transaction_multiple_ccpnets)(const char* net, char* value, unsigned setback,
                                                                  unsigned count, const char* offsets, int numOffsets, uint64 user_memfile_size);
    // Verilog/SystemVerilog
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_dynamic_delay_signal_2state)(char* loc, char* src, unsigned setback, unsigned lenMinusOne, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_delay_signal)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_delay_signal_opt)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_delay_signal_opt_port)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_dynamic_delay_signal)(char* loc, char* src, unsigned setback, unsigned lenMinusOne, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal_port)(char* reg, char* src,
        unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal_merge)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes); 
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal_merge_port)(char* reg, char* src,
            unsigned setback, unsigned lenMinusOne, int transType, uint64 delay, unsigned noOfBytes); 
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal_eventcall_less32)(char* reg,  char* src, unsigned lenMinusOne); 
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_non_blocking_signal_noeventcall_less32)(char* reg, char* src, unsigned lenMinusOne); 
        
    IKI_DLLESPEC int US(non_blocking_signal_value_changed)(char *reg, char *src, unsigned setback, unsigned lenMinusOne);
    IKI_DLLESPEC int US(non_blocking_signal_value_changed_dynamic)(char *curr, char *src, unsigned setback, unsigned lenMinusOne);
    //These 2 functions should be replaced by the above functions which use handles.
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_nonblocking_event_control)(char*reg, char* src,
            unsigned startIndex, unsigned endIndex, int transType, char* sensitiveNet, int repeatValue);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_nonblocking_event_control_on_event)(char*reg, char* src,
            unsigned startIndex, unsigned endIndex, int transType, char* sensitiveNet, int repeatValue);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast_no_reg)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast_no_agg)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast_no_reg_no_agg)(char* signal, char* driver,
            unsigned setback, unsigned lenMinusOne, char *value);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast_value)(char* signal, char* value, unsigned sizeOfValue,
            unsigned setback, unsigned noOfDrivenBits);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_slow)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne, uint64 rise, uint64 fall, uint64 turnoff, int isPerBit, int driverHasRiseFallDelay);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_slow_dd0)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne, uint64 rise);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_reg_fast)(char* signal, unsigned setback,
            unsigned lenMinusOne, char *value);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_reg_slow)(char* signal, char* driver, unsigned setback,
            unsigned lenMinusOne, uint64 rise, uint64 fall, uint64 turnoff, int isPerBit, int driverHasRiesFallDelay, char* value);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_slow_specify_delay)(char* signal, char* driver,
            unsigned setback, unsigned lenMinusOne, uint64 rise, uint64 fall, uint64 turnoff, int isPerBit, int driverHasRiseFallDelay);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_slow_specify_delay_dd0)(char* signal, char* driver,
            unsigned setback, unsigned lenMinusOne, uint64 rise);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_reg_slow_specify_delay)(char* signal, char* driver,
            unsigned setback, unsigned lenMinusOne, uint64 rise, uint64 fall, uint64 turnoff, int isPerBit,
            int driverHasRiesFallDelay);
    //TOOD: Dont remove this. It is good code, but cant be used for now as named block, subprogrs need special handling.
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_blocking_var)(char* var, char* src, unsigned setback, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_blocking_var_sc)(unsigned long long int netViewOffsetFromDP, char* src, unsigned setback, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_blocking_var_setback0)(char* var, char* src, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_assign_blocking_var)(char* var, char* src, unsigned setback, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_assign_blocking_var_2state)(char* var, char* src, unsigned setback, unsigned lenMinusOne);
    IKI_DLLESPEC void US(iki_vlog_assign_blocking_var_s1)(char* var, char* src);
    IKI_DLLESPEC void US(iki_vlog_assign_blocking_var_s1_2state)(char* var, char* src);
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_blocking_var_dynamic)(char* var, char* src, unsigned setback, unsigned lenMinusOne, unsigned target_svTypeId);
    IKI_DLLESPEC void US(iki_schedule_transaction_for_vlog_strength_time_0)(char* signal, char* driver,
            unsigned noDriverValueBytes, unsigned startIndex, unsigned endIndex);

    // Mixed VHDL/Verilog
    IKI_DLLESPEC void US(iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0)(char* dstVlogsignal, char* srcVhdlSignal,
            int dstLeft, int dstRight, int srcLeft, int srcRight, int size, unsigned vhdlType);
    // Mixed VHDL/Verilog for Cross Lang VHDL Hier Ref
    IKI_DLLESPEC void US(iki_vlog_schedule_vhdl_signal_transaction)(char* signal_handle, char* driver, char* value, unsigned setback, unsigned lenMinusOne, uint64 time);

    // End schedule transacting of a value to signal/reg


    // Multiple driver resolution
    //--------------------------------

    // VHDL

    IKI_DLLESPEC void US(iki_vhdl_schedule_driver_resolution)(char *dp, char *newValue /* new value */,
            unsigned int driverId /* driver id */, unsigned int physicalOffset /* physical offset */,
            unsigned int numOfBytes /* no of bytes */, char *net);
    
    //Verilog

    IKI_DLLESPEC int US(iki_vlog_handle_force_release_and_driver_resolution)(char *new_value, unsigned int driver_id,
            unsigned int start_index, unsigned int end_index, char* net);
    IKI_DLLESPEC int US(iki_vlog_handle_force_release_bitwise_for_reg)(char *new_value,
            unsigned int start_index, unsigned int end_index, char* net);


    IKI_DLLESPEC void US(iki_vlog_add_strength_resolution_functions_time_0)(void* transactionFunc, char* netAddress,
            char* addressForDriversIdsForStartIndex, unsigned int forcingBitsOffset, char* isBeingForcedAddress,
            unsigned startIndex, unsigned endIndex, int netType, char* net);

    // End multiple driver resolution
    // ------------------------------------------


    // Compare value change on overlapping net range with the driven range
    IKI_DLLESPEC int US(iki_vhdl_cmp_overlapping_netrange)(char* lastNetValue, char* currentArg_NewValue,
            unsigned int currentArg_NoOfBytes, unsigned int dS, unsigned int dE, unsigned int nS, unsigned int nE);

    // Verilog
    // Compare value change on overlapping net range with the driven range
    IKI_DLLESPEC int US(iki_vlog_cmp_val_NSROverlap)(char* lastNetValue, char* currentArg_NewValue, unsigned int dS,
            unsigned int dE, unsigned int nS, unsigned int nE);

    IKI_DLLESPEC int US(iki_vlog_cmp_edge_NSROverlap)(char* lastNetValue, char* currentArg_NewValue, unsigned int dS,
            unsigned int dE, unsigned int nS, unsigned int nE);

    IKI_DLLESPEC int US(iki_vlog_cmp_UDPedge_NSROverlap)(char* lastNetValue, char* currentArg_NewValue, unsigned int dS,
            unsigned int dE, unsigned int nS, unsigned int nE);

    // Compare value change on overlapping net range with the driven range
    IKI_DLLESPEC int US(iki_vlog_cmp_val_NSROverlap_2state)(char* lastNetValue, char* currentArg_NewValue, unsigned int dS,
            unsigned int dE, unsigned int nS, unsigned int nE);


    //IKI_DLLESPEC char* US(iki_vlog_wait(char* process, uint64 time);
    //IKI_DLLESPEC void US(iki_vlog_wait_and_set_next_state)(char* process, double time, char * proc, char* state);
    IKI_DLLESPEC void US(iki_vlog_wait_and_set_next_state)(char* process, double time, int64 currentTimescaleMultiplier, int64 currentTimescalePrecision, char * proc, char* state);
    IKI_DLLESPEC void US(iki_dynamic_transaction_verilog)(char* net, char *netNew, unsigned offset, unsigned size);

    IKI_DLLESPEC void US(iki_vlog_propagate_transaction)(const char* net, char* value, unsigned si, unsigned ei,
            const char* targetNet);
    IKI_DLLESPEC void US(iki_vlog_propagate_transaction_multiple)(const char* net, char* value, unsigned si, unsigned ei,
            const char* offsets, int numOffsets);
   IKI_DLLESPEC void US(iki_vlog_propagate_transaction_multiple_ccpnets)(const char* net, char* value, unsigned si, unsigned ei,
                                                                 const char* offsets, int numOffsets, uint64 user_memfile_size);
    IKI_DLLESPEC void US(iki_vlog_propagate_value_from_net_to_reg)(char* value, unsigned si, unsigned ei, const char* targetReg);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_convert_4to2_state)(char* result, char* val, unsigned lenMinusOne);
#endif
    IKI_DLLESPEC char *US(iki_vlog_create_2_state_from_4)(char *in4stateval, unsigned len);

    IKI_DLLESPEC void US(iki_add_nonblocking_process)(char* nonblock);
    IKI_DLLESPEC void US(iki_add_dynamic_wait_for_auto_ref)(char* net, unsigned offset, unsigned size, int edge, unsigned isCoverageEvent, unsigned coverGroupIndex);
    IKI_DLLESPEC void US(iki_remove_dynamic_wait_for_auto_ref)(char* net, char* wait);
    IKI_DLLESPEC void US(iki_add_dynamic_wait)(char* net, unsigned offset, unsigned size, int edge, unsigned isCoverageEvent, unsigned coverGroupIndex);
    IKI_DLLESPEC void US(iki_remove_dynamic_wait)(char* net, char* wait);
    IKI_DLLESPEC void US(iki_transaction_function_for_auto_var)(char *srcValue, unsigned int startIndex,
            unsigned int endIndex, char *net);
    IKI_DLLESPEC void US(iki_transaction_function_for_auto_var_ref)(char *srcValue, unsigned int startIndex,
            unsigned int endIndex, char *net, char* driver, unsigned int setback);
    IKI_DLLESPEC void US(iki_transaction_function_for_auto_var_2state)(char *srcValue, unsigned int startIndex,
            unsigned int endIndex, char *net);
    //IKI_DLLESPEC char US(iki_vlog_disable_block)(char* block, char *currentProcess);
    IKI_DLLESPEC char US(iki_vlog_disable_dynamic_block)(char* block, char* currentProcessPtr, char canHaveWait);
    //IKI_DLLESPEC char US(iki_vlog_disable_block_invocation)( char* invocation, char* currentProcessPtr, char canHaveWait);

    IKI_DLLESPEC void US(iki_vlog_call_transaction_aggregate_signal_at_time_0)(char* aggregate_signal, char* elem_signal,
            char* driver, unsigned setback, unsigned noOfDrivenBits);

//    IKI_DLLESPEC char* US(iki_vlog_handle_z_trireg)(char* netValue, int offsetNet, char* drivenValue, int offsetDriver,
//            int length, char* transactionFunction, char* driver_props_immediate, char* driver_props_inertial,
//            uint64 charge_decay_time, char* projectedWaveform);

    // scope is ISIMK::s_scope_properties*, sep="/", skip_process 0: don't skip 
    IKI_DLLESPEC char* US(iki_get_hier_name)(char* scope, const char* sep, int skip_process);
    IKI_DLLESPEC char* US(iki_get_vhdl_path_name)(char* retConstr, char* scope, const char* name);

    //following are being used for verilog only, so prefixed by US(iki_vlog, if used for vhdl later please remove the _vlog_
//    IKI_DLLESPEC char* US(iki_initialize_task_invocation)(char* pInvocationListInMem, unsigned size, char* parentBlock);
    IKI_DLLESPEC char* US(iki_initialize_task_invocation)(uint64 subprogInDPOffset, char* scopePropInIP, unsigned size, char* parentBlock);

    IKI_DLLESPEC char* US(iki_initialize_sequence_scope_invocation)(uint64 subprogInDPOffset, char* scopePropInIP, unsigned size, char* parentBlock);
    IKI_DLLESPEC void US(iki_vlog_delete_sequence_invocation)(char* SP);

//    IKI_DLLESPEC char* US(iki_initialize_function_call)(char* pInvocationListInMem, unsigned size);
    IKI_DLLESPEC char* US(iki_initialize_function_call)(uint64 subprogInDPOffset, char* scopePropInIP, unsigned size);
    IKI_DLLESPEC void US(iki_vlog_create_task_invocation)(char* processPtr, uint64 subprogInDPOffset, char* SP,
            void* func, char* IP, char *pstate_for_task_finished, int hasDynamicType, int skipCallWithError);
    IKI_DLLESPEC void US(iki_vlog_invoke_function)(char* processPtr, char* SP, void* func, char *IP, char *pstate_for_function_finished, int hasJoinNone, int skipCallWithError);
//    IKI_DLLESPEC void US(iki_vlog_invoke_static_function)(char* processPtr, char* pInvocationListInMem, void* func, char *IP);
    IKI_DLLESPEC char* US(iki_vlog_create_dynamic_named_block_invocation)(char* processPtr, char* pInvocationListInMem,
            void* func, char *IP, char *pstate_for_block_finished, char canNotHaveWait, unsigned size, int hasDynamicType);
    IKI_DLLESPEC void US(iki_vlog_reschedule_calling_process_for_fork)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_delete_function_invocation)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_delete_subprog_invocation_if_finished)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_delete_dynamic_named_block_if_finished)(char* SP, char canHaveWait);

    IKI_DLLESPEC unsigned US(iki_vlog_get_dynamic_named_block_in_execution_exit_status)(char* SP) ;
    IKI_DLLESPEC void US(iki_vlog_set_dynamic_named_block_exit_status)(char* SP, unsigned status) ;

    IKI_DLLESPEC void US(iki_vlog_delete_dynamic_named_block_in_execution)(char* SP, char canHaveWait);
    IKI_DLLESPEC void US(iki_vlog_delete_task_invocation)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_delete_function_invocation)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_delete_subprog_invocation)(char* SP);
    IKI_DLLESPEC void US(iki_vlog_create_fork_invocation)(char* processPtr, char* parent_fork_property, char* SP,
            void* func, char *IP, char *pstate_for_fork_finished, char* pInvocationListInMem, char canNotHaveWait, char isJoinNoneTrue, char isCoverageFork, char hasDisableFork);
    IKI_DLLESPEC void US(iki_vlog_delete_fork_in_execution)(char *callingProcess, char reset_no_of_active_process);
    IKI_DLLESPEC char US(iki_vlog_disable_task_invocation)(char* invocation, char* currentProcessPtr); //Disable the given invocation
//    IKI_DLLESPEC char US(iki_vlog_disable_task)(char* pInvocationListInMem, char* currentProcessPtr); //disable all invocations of this task
    IKI_DLLESPEC char US(iki_vlog_disable_task)(uint64 subprogInDPOffset, char* scopePropInIP, char* currentProcessPtr); //disable all invocations of this task
    IKI_DLLESPEC char US(iki_vlog_disable_fork)(char* pInvocationListInMem, char *parentForkProp, char* currentProcessPtr, char canHaveWait); //disable all invocations of this fork 
    IKI_DLLESPEC void US(iki_vlog_return_in_subprogram_named_block)(char* sp);

    IKI_DLLESPEC void US(iki_vlog_task_callstack_update)(char* sp);
    IKI_DLLESPEC void US(iki_vlog_function_callstack_update)(char* sp);

    //End Verilog subprogram related functions--------------------------------------------


    // Verilog utility functions

    IKI_DLLESPEC void US(iki_vlog_stop)(int kind, iki_linefile_type lineFile);
    IKI_DLLESPEC void US(iki_vlog_finish)(int kind, iki_linefile_type lineFile, int isImplicit);
    IKI_DLLESPEC char* US(iki_vlog_time)(char* res, double timeScaleMult, double timeScalePrecision);
    IKI_DLLESPEC void US(iki_vlog_set_timeformat)(int timeUnits, int precUnits, const char* suffixStr, int noOfBits,
            int fldWidth);
    IKI_DLLESPEC unsigned int US(iki_vlog_stime)(double timeScaleMult, double timeScalePrecision);
    IKI_DLLESPEC double US(iki_vlog_realtime)(double timeScaleMult, double timeScalePrecision);

    IKI_DLLESPEC int US(iki_vlog_compare_resolved_strength)(char* netValuePtr, int index);
    IKI_DLLESPEC void US(iki_vlog_copy_resolved_strength)(char* netValuePtr, int index);

    IKI_DLLESPEC void US(iki_vlog_strength_copy)(char* netValuePtr, int startIndex, char* driverValuePtr, int length,
            unsigned int* forcingBits);
    IKI_DLLESPEC void US(iki_create_blasted_driver_strength)(char* value, char* driver_value, int startIndex, int length);
    IKI_DLLESPEC void US(iki_create_blasted_driver_strength_mos_switches)(char* value_t, char* driver_value_t, int index,
            int noOfBits, unsigned isResistive, int noOfInputs, ...);

#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_get_transaction_function)(char* handle); //introduced for reg for now
#endif
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_value)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_value_input)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_value_copy)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_ref_value)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_value_with_setback)(char* signal_handle, int length, int setback);
    IKI_DLLESPEC char* US(iki_vlog_value_get_value_with_setback)(char* value_ptr, int length, int setback);
    IKI_DLLESPEC char* US(iki_vlog_auto_signal_handle_value_with_setback)(char* signal_handle, int length, int setback);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_value_for_ref)(char* value, int length, int setback);
    IKI_DLLESPEC char* US(iki_vlog_auto_signal_handle_ref_value_with_setback)(char* signal_handle, int length, int setback);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_2stvalue_from_4st)(char* signal_handle, int length);
#endif

    IKI_DLLESPEC char* US(iki_vlog_get_last_value)(char* signal_handle, unsigned scalarIndex, unsigned length);
    IKI_DLLESPEC char* US(iki_svlog_get_sampled_value)(char* handle, unsigned scalarIndex, unsigned length);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC uint64 US(iki_vlog_get_last_event)(char* signal_handle, unsigned scalarIndex, unsigned length);
    IKI_DLLESPEC unsigned US(iki_vlog_get_last_event_delta)(char* signal_handle, unsigned scalarIndex, unsigned length);
#endif
    IKI_DLLESPEC char* US(iki_vlog_event_callback)(char* signal_handle, char* new_value, unsigned scalarIndex,
            unsigned length);
#ifdef XSIM_UNUSED
    IKI_DLLESPEC void US(iki_vlog_update_last_value)(char* signal_handle, char* new_value, unsigned scalarIndex,
            unsigned length);
#endif

    //Procedural continuous related, some can be inlined.
    IKI_DLLESPEC char* US(iki_vlog_get_proc_cont_struct_ptr)(char* sig); //returns s_proc_cont_props 
//    IKI_DLLESPEC unsigned US(iki_vlog_get_e_vlog_net_reg_props)(char* sig); //returns e_vlog_net_reg_properties
    //IKI_DLLESPEC char* US(iki_vlog_get_e_vlog_net_reg_props_pointer)(char* sig);
    IKI_DLLESPEC void US(iki_vlog_set_e_vlog_net_reg_props)(char* sig, unsigned property);
    IKI_DLLESPEC void US(iki_vlog_unset_e_vlog_net_reg_props)(char* sig, unsigned property);

    // Begin procedural continuous assignment that are used for regs
    IKI_DLLESPEC void US(iki_vlog_assign_reg)(char* sig, unsigned si, unsigned ei, char* driver, char* src);
    IKI_DLLESPEC char US(iki_vlog_check_assigned)(char* sig);

    IKI_DLLESPEC void US(iki_vlog_release_reg)(char *ip, char* signal, unsigned si, unsigned ei, char* driver, unsigned isBitReleased);

    IKI_DLLESPEC void   US(iki_vlog_create_assign_assign_reg)(char* signal, unsigned si, unsigned ei, char* driver, char *src);
    IKI_DLLESPEC void US(iki_vlog_deassign_reg)(char* signal);

    // End procedural continuous assignment that are used for regs
    IKI_DLLESPEC void US(iki_vlog_deactivate_previous_forcing_process)(char* signal);
    IKI_DLLESPEC void US(iki_vlog_force)(char* signal, unsigned si, unsigned ei, char* driver, char* src, unsigned isRegBitForced);
    IKI_DLLESPEC char US(iki_vlog_check_forced)(char* sig);
//    IKI_DLLESPEC char US(iki_vlog_check_release_in_progress)(char* sig);
//    IKI_DLLESPEC void US(iki_vlog_modify_values_for_force)(unsigned int* forcingBits, char* val, char* netVal, int netSI,
//            int len, int totalBytes);
//    IKI_DLLESPEC char* US(iki_vlog_modify_values_for_continuous_assign)(unsigned int* forcingBits, char* lhs, int lhsSI,
//            char* rhs, int len, int totalBytes, char* saveTrans);

//    IKI_DLLESPEC char US(iki_vlog_check_forced_bit_status)(unsigned int* forcingBits, int index);

    IKI_DLLESPEC void US(iki_add_force_process_to_handle)(char* signal, unsigned si, unsigned ei,
            char* forcingProcessProperties, char* forcingBitsPtrForForcingProcess);
    IKI_DLLESPEC void US(iki_vlog_release)(char* signal, unsigned si, unsigned ei);
    IKI_DLLESPEC void US(iki_vlog_restore_values_after_release)(char* handle, unsigned si, unsigned ei); //todo: merge this with the US(iki_vlog_release function.
    IKI_DLLESPEC void US(iki_vlog_set_bit_map_continuous_assign)(char* signal, unsigned si, unsigned ei);
    IKI_DLLESPEC void US(iki_vlog_copy_force_process_bitmap_to_handle)(char* handle, char* force_process_bitmap,
            unsigned si, unsigned ei);
    //end procedural continuous related
    IKI_DLLESPEC int US(iki_vlog_strengthcmp)(char* netValue, int netIndex, char* driverValue, int driverIndex, int length,
            unsigned int* forcingBits);
    IKI_DLLESPEC int US(iki_vlog_memcmp)(char* dstValue, unsigned int dstIndex, char* srcValue1, int srcIndex, int length);
    IKI_DLLESPEC int US(iki_vlog_memcmp_0)(char* dstValue, unsigned int dstIndex, char* srcValue1, int length);
    IKI_DLLESPEC int US(iki_vlog_memcmp_0_x_1)(char* dstValue, unsigned int dstIndex, char* srcValue1);
    IKI_DLLESPEC int US(iki_vlog_memcmp_0_0_1)(char* dstValue, char* srcValue1);
    IKI_DLLESPEC int US(iki_vlog_memcmp_2state)(char* dstValue, unsigned int dstIndex, char* srcValue1, int srcIndex,
            int length);
    IKI_DLLESPEC int US(iki_vlog_memcmp_0_2state_bitvector)(char* dstValue, unsigned int dstIndex, char* srcValue1,
            int length, unsigned* diffBV);
    IKI_DLLESPEC int US(iki_vlog_memcmp_0_bitvector)(char* dstValue, unsigned int dstIndex, char* srcValue1,
            int length, unsigned* diffBV);
    IKI_DLLESPEC int US(iki_vlog_event_check_condition)(char* net);
    
    //IKI_DLLESPEC void US(iki_schedule_process_if_edge_matches)(char* process, char* dstValue, int dstIndex, char* srcValue1, int srcIndex, int edge);

    IKI_DLLESPEC void US(iki_schedule_process_if_edge_matches)(char* process, int actualEdge, int expectedEdge);

    IKI_DLLESPEC void US(iki_vlogfile_printtimescale)(const char* timescale, const char *scopeName);
    IKI_DLLESPEC int US(iki_vlogfile_testplusarg)(const char* argstring);
    IKI_DLLESPEC int US(iki_vlogfile_valueplusarg)(const char* format, int lenStr, int numargs, ...);

    IKI_DLLESPEC void US(iki_vlogfile_severity)(unsigned lineNo, char *scopeName, int addNewline, int defaultRadix, int sysTaskType, int fatal_finish_number, const char* formatString, int noOfArgs, ...); // handle severity system tasks such as $fatal, $error, $warning, $info


    IKI_DLLESPEC void US(iki_test)(char* addr);


    IKI_DLLESPEC char* US(iki_vhdl_create_procedure_invocation)(char* processPtr, unsigned size, void* func, char *ip,
            char *pstate_for_task_finished);
    IKI_DLLESPEC char* US(iki_get_static_net_value)(char* dynamicNet);

    IKI_DLLESPEC char* US(iki_allocate_fork_scope)(uint64 localOffset, char* IP, unsigned size);

    IKI_DLLESPEC char* US(iki_initialize_fork_invocation)(uint64 subprogInDPOffset, char* scopePropInIP, unsigned size, char* parentBlock);

    IKI_DLLESPEC void US(iki_register_DDR_read)(int (*fp)(int, int)) ;

    IKI_DLLESPEC void US(iki_vlog_register_function_stack)(char*, char*) ;
    IKI_DLLESPEC char* US(iki_vlog_retrieve_function_stack)(char*) ;

    IKI_DLLESPEC void US(iki_vhdl_set_current_sp)(int spId, char* sp) ;
    IKI_DLLESPEC void US(iki_vhdl_reset_current_sp)(char* sp) ;
    IKI_DLLESPEC void US(iki_vhdl_procedure_update_current_sp)(char* sp) ;

    IKI_DLLESPEC char* US(iki_vlog_signal_handle_sampled_value)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_sampled_value_input)(char* signal_handle, int length);
    IKI_DLLESPEC char* US(iki_vlog_signal_handle_ref_sampled_value)(char* signal_handle, int length);
    IKI_DLLESPEC char* US ( iki_vlog_signal_handle_sampled_value_with_setback)(char* signal_handle, int length, int setback);

#ifdef  __cplusplus
}
#endif

#endif


