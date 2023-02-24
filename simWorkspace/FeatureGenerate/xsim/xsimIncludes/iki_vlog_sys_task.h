// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#ifndef IKI_VLOG_SYSTASK_H
#define IKI_VLOG_SYSTASK_H

    //Begin stochastic modeling functions --------------------------
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_uniform)(int bSeed, char *pSeed, int start, int end);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_chi_square)(char *seed, int df);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_erlang)(char *seed, int k, int mean);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_exponential)(char *seed, int mean);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_normal)(char *seed, int mean, int sd);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_poisson)(char *seed, int mean);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_t)(char *seed, int df);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_urandom)(int bSeed, char *pSeed, int start, int end);
    IKI_DLLESPEC int US(iki_vlog_rtl_dist_urandom_range)(int start, int end);
    IKI_DLLESPEC void US(iki_vlog_rtl_dist_srandom)(int seed);
    IKI_DLLESPEC void US(iki_vlog_set_threadId_for_unrandom)(char *ip, int execId);
    IKI_DLLESPEC void US(iki_vlog_set_threadId_for_unrandom_inherit)(char *ip, int execId);
    //End stochastic modeling functions

//#ifdef XSIM_UNUSED
    //------------Begin Stochastic Analysis task----------------//
    IKI_DLLESPEC void US(iki_vlog_q_initialize)(int q_id, int q_type, int max_length, char* status);
    IKI_DLLESPEC void US(iki_vlog_q_add)(int q_id, int job_id, int inform_id, char *status);
    IKI_DLLESPEC void US(iki_vlog_q_remove)(int q_id, int job_id, char* inform_id, char* status);
    IKI_DLLESPEC char*  US(iki_vlog_q_full)(int q_id, char* status);
    IKI_DLLESPEC void US(iki_vlog_q_exam)(int q_id, int q_stat_code, char* q_stat_value, char* status);
    //------------End Stochastic Analysis task----------------//
    IKI_DLLESPEC int US(iki_vlog_system_call_cname)(const char* cmd, iki_linefile_type linefile);
    IKI_DLLESPEC int US(iki_vlog_system_call_valname)(char* cmd, int lenCmd, iki_linefile_type linefile);

//#endif //XSIM_UNUSED

    //__________________________________________________
    //Verilog File writing functions
    IKI_DLLESPEC int US(iki_vlogfile_monitor_nochanged)(iki_linefile_type linefile, int noOfArgs, ...);
    IKI_DLLESPEC void US(iki_vlogfile_write)(int addNewline, int defaultRadix, int sysTaskType, const char* formatString,
            int noOfArgs, ...);
    IKI_DLLESPEC void US(iki_vlogfile_monitor)(const char *pFunc, char* process, char* wInfo);
    IKI_DLLESPEC void US(iki_vlogfile_fmonitor)(int fileId, const void *pFunc, char* process, char* wInfo);
    IKI_DLLESPEC void US(iki_vlogfile_strobe)(const char *pFunc, char* process);
    IKI_DLLESPEC void US(iki_vlogfile_monitor_exec)();
    IKI_DLLESPEC void US(iki_vlogfile_monitoron)();
    IKI_DLLESPEC void US(iki_vlogfile_monitoroff)();
#ifdef XSIM_UNUSED 
    IKI_DLLESPEC void US(iki_vlogfile_add_monit_process)(int fd, char* proc);
#endif
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_cname_ctype)(const char* filename, const char* type);
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_cname)(const char* filename);
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_valname)(char* filename, int lenFName);
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_valname_valtype)(char* filename, int lenFName, char*fileT, int lenT);
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_cname_valtype)(const char* filename, char*fileT, int lenT);
    IKI_DLLESPEC int US(iki_vlogfile_file_open_of_valname_ctype)(char* filename, int lenFName, const char*fileT);
    IKI_DLLESPEC void US(iki_vlogfile_fwrite)(int fd, int addNewl, int defaultRadix, int sysTaskType,
            const char* formatString, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_swrite)(char* str, int lenX, int addNewl, int defaultRadix, int isStringReg, int sysTaskType,
            const char* format, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_sformat)(char* str, int lenX, const char* format, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_sformat_isreg)(char* str, int lenX, int isStringReg, const char* format, int length, int isReg,
            int noOfArgs, ...);
    IKI_DLLESPEC void US(iki_vlogfile_fclose)(int fd);
    IKI_DLLESPEC int US(iki_vlogfile_fgetc)(int fd);
    IKI_DLLESPEC int US(iki_vlogfile_ungetc)(int c, int fd);
    IKI_DLLESPEC int US(iki_vlogfile_fgets)(char* areg, int len, int fd);
    IKI_DLLESPEC int US(iki_vlogfile_fscanf)(int fd, const char* formatString, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_fscanf_values)(int fd, char* formatString, int lenF, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_sscanf)(char* str, int len, const char* formatString, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_sscanf_values)(char* str, int len, char* formatString, int lenF, int noOfArgs, ...);
    IKI_DLLESPEC int US(iki_vlogfile_ftell)(int fd);
    IKI_DLLESPEC int US(iki_vlogfile_feof)(int fd);
    IKI_DLLESPEC int US(iki_vlogfile_fseek)(int fd, int offset, int operation);
#ifdef XSIM_UNUSED 
    // BULLSEYE
    IKI_DLLESPEC int US(iki_vlogfile_rewind)(int fd);
#endif
    IKI_DLLESPEC void US(iki_vlogfile_flush)(); //flush all open file
    IKI_DLLESPEC void US(iki_vlogfile_fflush)(int flushAll, int fd);
    IKI_DLLESPEC int US(iki_vlogfile_ferror)(int fd, char*str, int lenA);
    IKI_DLLESPEC int US(iki_vlogfile_fread_new)(int bIsMem, int len, int fd, int bStart, int start, int bCount, int count,
            char* handle, int elementLeft, int elementRight, int arrayLeft, int arrayRight, int dstSI, int isParam, int isAutomatic, int var_scope, char *base);

    IKI_DLLESPEC void US(iki_vlogfile_readmemb)(const char* filename, int nameStrOrVarSz, int isStringVar, char* signalHandle, int bStart,
            int start, int bEnd, int end, int wordLen, int arrayLeft, int arrayRight, int svTypeId, int is2StateElem, int isAuto, int isClassMem, int memSetback, int isStaticMultiDimArray, ...);
    IKI_DLLESPEC void US(iki_vlogfile_readmemh)(const char* filename, int nameStrOrVarSz, int isStringVar, char* signalHandle, int bStart,
            int start, int bEnd, int end, int wordLen, int arrayLeft, int arrayRight, int svTypeId, int is2StateElem, int isAuto, int isClassMem, int memSetback, int isStaticMultiDimArray, ...);

    /* =============== */
    /* vcd Functions   */
    /* =============== */

    IKI_DLLESPEC void US(iki_vcd_dumpfile)(const char* vcdFileName);
    IKI_DLLESPEC void US(iki_vcd_dumpall)();
    IKI_DLLESPEC void US(iki_vcd_dumpflush)();
    IKI_DLLESPEC void US(iki_vcd_dumpon)();
    IKI_DLLESPEC void US(iki_vcd_dumpoff)();
    IKI_DLLESPEC void US(iki_vcd_dumplimit)(int64 maxByteSize);
    IKI_DLLESPEC void US(iki_vcd_dumpvars)(int level, ...);
    IKI_DLLESPEC void US(iki_vcd_dumpports)(const char* vcdFileName,...);
    IKI_DLLESPEC void US(iki_vcd_dumpportsall)(const char* vcdFileName);
    IKI_DLLESPEC void US(iki_vcd_dumpportsflush)(const char* vcdFileName);
    IKI_DLLESPEC void US(iki_vcd_dumpportson)(const char* vcdFileName);
    IKI_DLLESPEC void US(iki_vcd_dumpportsoff)(const char* vcdFileName);
    IKI_DLLESPEC void US(iki_vcd_dumpportslimit)(int64 maxByteSize, const char* vcdFileName);
    //end vcd

    /* SV Assertions control functions */
    IKI_DLLESPEC void US(iki_vlog_assert_on)(int level, ...);
    IKI_DLLESPEC void US(iki_vlog_assert_off)(int level, ...);
    // end SV Assertions control functions 

    IKI_DLLESPEC char *US(iki_svlog_syscall_countones)(char* aReturn1, char* aX1, int lenX) ;
    IKI_DLLESPEC char *US(iki_svlog_syscall_onehot)(char* aReturn1, char* aX1, int lenX) ;
    IKI_DLLESPEC char *US(iki_svlog_syscall_onehot0)(char* aReturn1, char* aX1, int lenX) ;
    IKI_DLLESPEC char *US(iki_svlog_syscall_isunknown)(char* aReturn1, char* aX1, int lenX) ;


#endif


