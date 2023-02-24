// $Id: $
// Copyright 20016, Xilinx Inc. All rights reserved.

// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

// SystemC related IKI functions

#ifndef IKI_SYSTEMC_H
#define IKI_SYSTEMC_H

#include "systemcdef.h"

// Since clang used by XSIM uses std89, cannot use bool type in IKI headers

// Create a standalone SystemC design. Do not call this for mixed HDL-SystemC design
IKI_DLLESPEC void* iki_sc_create_design(int argc, char** argv);

// Return the GlobalSystemCMgr
IKI_DLLESPEC void* iki_get_systemcmgr();


IKI_DLLESPEC void iki_sc_programFunctionPointers(funPtrTypeRegisterChannelIntCharp func1, funPtrTypeRegisterChannelIntCharpInt func2, funPtrTypeRegisterChannelRBool func3, funPtrTypeRegisterChannelCharp func4, funPtrTypeRegisterChannel func5, funPtrTypeRegisterChannelVoidp func6, funPtrTypeRegisterChannelRCharp func7, funPtrTypeRegisterChannelRBool func8, funPtrTypeRegisterChannel func9, funPtrTypeRegisterChannelRBoolBool func10, funPtrTypeRegisterChannelIntp func11, funPtrTypeRegisterChannelRInt func12, funPtrTypeRegisterChannel func13, funPtrTypeRegisterChannelRBool func14, funPtrTypeRegisterChannelRBool func15, funPtrTypeRegisterChannelRCharpException func16, funPtrTypeRegisterChannelCharp func17, funPtrTypeRegisterChannelRCharp func18, funPtrTypeRegisterChannelRIntCharp func19, funPtrTypeRegisterChannel func20, funPtrTypeRegisterChannel func21, funPtrTypeDebugGetValueULLCharppUIntp m_func22, funPtrTypeDebugSetValueULLCharpUInt m_func23, funPtrTypeXsimGetTraceFlagsULLUp m_func24, funPtrTypeXsimSetTraceFlagsULLU m_func25, funPtrTypeRegisterChannelRConstCharp m_func26, funPtrTypeRegisterChannelRConstCharp func27, funPtrTypeRegisterChannelRInt func28, funPtrTypeRegisterChannelRInt func29);

// Register a channel number with a Global array in kernel that will be used by a generated
// transaction function or a NSR based direct transaction to map a HDL port to a SystemC channel
// for HDL top instantiating a SystemC DUT
IKI_DLLESPEC void iki_sc_register_channel(int channelNumber, char* channel);

// From the HDL transaction function, call this to write new value to a channel tied to a HDL signal
// that has undergone transition
IKI_DLLESPEC void iki_sc_write_int_channel(int channelNumber, char* newValue, int numBytes);


// Functions for the SystemC library to call into kernel
IKI_DLLESPEC void iki_sc_add_timed_event(unsigned long long int delay, int* scTimedEvent);

IKI_DLLESPEC void iki_sc_schedule_stop_simulation(unsigned long long int delay);

//Functions for get_value/set_value debug feature
IKI_DLLESPEC void iki_sc_debug_get_value(unsigned long long traceObjAddr, const char** buf_pp, unsigned* length);
IKI_DLLESPEC void iki_sc_debug_set_value(unsigned long long traceObjAddr, const char* buf_p, unsigned length);

//Functions for set/get trace flags
IKI_DLLESPEC void iki_sc_xsim_get_trace_flags(unsigned long long traceObjAddr, unsigned *flags_p);
IKI_DLLESPEC void iki_sc_xsim_set_trace_flags(unsigned long long traceObjAddr, unsigned flags);

// Run SystemC simulation for given duration (number of units of simulation precision)
// If exitOnStarvation is 0 then run until the current time + duration, else run until
// there is any event and stop even before time+duration
IKI_DLLESPEC void iki_sc_crunch(int once);
IKI_DLLESPEC unsigned long long int iki_sc_run_all();
IKI_DLLESPEC unsigned long long int iki_sc_run_until(unsigned long long int until_t);
IKI_DLLESPEC unsigned long long int iki_sc_forward_current_time(unsigned long long int time);
IKI_DLLESPEC unsigned long long int iki_sc_get_current_time();
IKI_DLLESPEC unsigned iki_sc_get_debug_type();
IKI_DLLESPEC int iki_sc_stop_simulation();
IKI_DLLESPEC int iki_sc_runnable_is_empty();
IKI_DLLESPEC int iki_sc_eq_empty();

IKI_DLLESPEC char* iki_getFreeEvent();

IKI_DLLESPEC void iki_schedule_sc(char* event, unsigned long long int delay);
IKI_DLLESPEC void iki_pushBackActiveEvent(char* event);

IKI_DLLESPEC void iki_set_sc_init(funPtrTypeRegisterChannel func1, funPtrTypeRegisterChannel func2, int systemCPrec);

IKI_DLLESPEC unsigned long long iki_sc_get_size_of_mem_file();
IKI_DLLESPEC void iki_sc_set_size_of_wdb_address_space(unsigned long long size);

IKI_DLLESPEC void iki_trace_sc(unsigned long long trace_address, unsigned trace_flags, char* old_value_p,
    char* new_value_p, unsigned bit_offset, unsigned length);
IKI_DLLESPEC void iki_trace_sc_vo(unsigned long long trace_address, unsigned trace_flags, char* buf_p,
    unsigned length, unsigned offset);

IKI_DLLESPEC void iki_sc_elaboration_done();
IKI_DLLESPEC char* iki_sc_get_invocation_name();
IKI_DLLESPEC void iki_sc_end_of_simulation();

#endif

