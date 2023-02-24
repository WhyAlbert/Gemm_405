// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
// Copyright 2017 Xilinx.  All rights reserved.


#ifndef ISIMK_SYSTEMC_MGR_H
#define ISIMK_SYSTEMC_MGR_H

#include "systemcdef.h"
#include "iki.h"

#include <map>

#ifdef SC_SIMCONTEXT_DLL
#if (defined(_MSC_VER) || defined(__MINGW32__) || defined(__CYGWIN__))
#define SYSTEMCLIB_DLLSPEC __declspec(dllimport)
#else
#define SYSTEMCLIB_DLLSPEC 
#endif

#else
#if (defined(_MSC_VER) || defined(__MINGW32__) || defined(__CYGWIN__))
#define SYSTEMCLIB_DLLSPEC __declspec(dllexport)
#else
#define SYSTEMCLIB_DLLSPEC 
#endif

#endif
namespace ISIMK {
struct s_design_properties;
}

class SYSTEMCLIB_DLLSPEC SystemCMgr {

private:
    funPtrTypeRegisterChannelIntCharp m_func1;
    funPtrTypeRegisterChannelIntCharpInt m_func2;
    funPtrTypeRegisterChannelRBool m_func3;
    funPtrTypeRegisterChannelCharp m_func4;
    funPtrTypeRegisterChannel m_func5;
    funPtrTypeRegisterChannelVoidp m_func6;
    funPtrTypeRegisterChannelRCharp m_func7;
    funPtrTypeRegisterChannelRBool m_func8;
    funPtrTypeRegisterChannel m_func9;
    funPtrTypeRegisterChannelRBoolBool m_func10;
    funPtrTypeRegisterChannelIntp m_func11;
    funPtrTypeRegisterChannelRInt m_func12;
    funPtrTypeRegisterChannel m_func13;
    funPtrTypeRegisterChannelRBool m_func14;
    funPtrTypeRegisterChannelRBool m_func15;
    funPtrTypeRegisterChannelRCharpException m_func16;
    funPtrTypeRegisterChannelCharp m_func17;
    funPtrTypeRegisterChannelRCharp m_func18;
    funPtrTypeRegisterChannelRIntCharp m_func19;
    funPtrTypeRegisterChannel m_func20;
    funPtrTypeRegisterChannel m_func21;
    funPtrTypeDebugGetValueULLCharppUIntp m_func22; /*sc_debug_get_value*/
    funPtrTypeDebugSetValueULLCharpUInt m_func23;/*sc_debug_set_value*/
    funPtrTypeXsimGetTraceFlagsULLUp m_func24;   /*sc_xsim_set_trace_flags*/
    funPtrTypeXsimSetTraceFlagsULLU m_func25;    /*sc_xsim_get_trace_flags*/
    funPtrTypeRegisterChannelRConstCharp m_func26;
    funPtrTypeRegisterChannelRConstCharp m_func27;
    funPtrTypeRegisterChannelRInt m_func28;
    funPtrTypeRegisterChannelRInt m_func29;

public:
    char* m_SCSimContext;
    funPtrTypeRegisterChannel global_sc_implicit_HDL_SCinstantiate;
    funPtrTypeRegisterChannel global_sc_implicit_HDL_SCcleanup;
    bool m_stop_action;
    int m_SCTimePrecision;

    void programFunctionPointers(funPtrTypeRegisterChannelIntCharp func1, funPtrTypeRegisterChannelIntCharpInt func2, funPtrTypeRegisterChannelRBool func3, funPtrTypeRegisterChannelCharp func4, funPtrTypeRegisterChannel func5, funPtrTypeRegisterChannelVoidp func6, funPtrTypeRegisterChannelRCharp func7, funPtrTypeRegisterChannelRBool func8, funPtrTypeRegisterChannel func9, funPtrTypeRegisterChannelRBoolBool func10, funPtrTypeRegisterChannelIntp func11, funPtrTypeRegisterChannelRInt func12, funPtrTypeRegisterChannel func13, funPtrTypeRegisterChannelRBool func14, funPtrTypeRegisterChannelRBool func15, funPtrTypeRegisterChannelRCharpException func16, funPtrTypeRegisterChannelCharp func17, funPtrTypeRegisterChannelRCharp func18, funPtrTypeRegisterChannelRIntCharp func19, funPtrTypeRegisterChannel func20, funPtrTypeRegisterChannel func21, funPtrTypeDebugGetValueULLCharppUIntp func22, funPtrTypeDebugSetValueULLCharpUInt func23, funPtrTypeXsimGetTraceFlagsULLUp func24, funPtrTypeXsimSetTraceFlagsULLU func25, funPtrTypeRegisterChannelRConstCharp m_func26, funPtrTypeRegisterChannelRConstCharp func27, funPtrTypeRegisterChannelRInt func28, funPtrTypeRegisterChannelRInt func29);

    void register_implicit_channel(int channelNumber, char* channel);
    void write_channel_int(int channelNumber, char* newValue, int numBytes);
    int sc_pending_activity_at_future_time();
    void xsim_sc_init_elab(char* invocationName);
    void reset();
    void set_curr_proc(void* process);
    char* sc_get_curr_simcontext();
    int pending_updates();
    void set_evaluate_phase();
    int run_update_and_notification(int empty_eval_phase);
    void trigger_timed_event(int* event);
    int check_trace_pause_error();
    void do_sc_stop_action();
    int is_sc_forced_stop();
    int is_sc_stop_immediate();
    const char* do_sc_report(char* x);

    void setSCSimContext(char* scSimContext);
    char* getSCSimContext();

    int is_sc_thread_proc(char* scSimContext);
    void sc_process_timed_notifications();
    void update_change_stamp();
    /*SC Debug*/
    void sc_debug_get_value(unsigned long long traceObjAddr, const char** buffer_pp, unsigned* length_p);
    void sc_debug_set_value(unsigned long long traceObjAddr, const char* buffer_pp, unsigned length);
    void sc_xsim_get_trace_flags(unsigned long long traceObjAddr, unsigned *flags_p);
    void sc_xsim_set_trace_flags(unsigned long long traceObjAddr, unsigned flags);

    const char* sc_get_process_name();
    const char* sc_get_process_file();
    int sc_get_process_lineno();
    int sc_empty_process();

    ~SystemCMgr(); 

};

class SYSTEMCLIB_DLLSPEC Scheduler {
    static std::map<int, ISIMK::s_design_properties> m_design_properties;
    static void initialize(ISIMK::s_design_properties& property);
public:

    static ISIMK::s_design_properties& getInstance(int id);
    static std::map<int, ISIMK::s_design_properties>& getSchedulerMap() {return m_design_properties;}
};

#endif




