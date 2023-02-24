/* Copyright 2009, Xilinx Inc.  All rights reserved.
*
* ISim simulation data structures.  Included by kernel and Compiler
*
* NOTE: Do not include functions in this header.  Only declare enum's
* struct's etc.
*/

//NOTE:: Do not include any other header file in this

#include "Common/export/isim_datatypes.h"
#include <iosfwd>
#include <map>
#include <set>
#include <vector>

#ifndef ISIMK_DATATYPES_H
#define ISIMK_DATATYPES_H

typedef void (*FuncPtr)(char*);
typedef int (*FuncPtrTwoArgs)(char*, char*);
typedef int (*FuncPtrThreeArgs)(char*, char*, char*);
typedef char* (*FuncPtrThreeArgsReturnCharStar)(char*, char*, char*);
typedef void (*FuncPtrWithNoArg)();

typedef void (*ExecFuncPtr)(char*, char*, char*);
typedef void (*ExecTaskFuncPtr)(char*, char*, char*);
typedef void (*ExecSubprogFuncPtr)(char*, char*, char*);
typedef void (*TransactionFuncPtr)(char*, char*, unsigned, unsigned, unsigned, char*);
typedef char (*VhdlResolutionFuncPtrRetChar)(char*, char*, char*);
typedef int (*VhdlResolutionFuncPtrRetInt32)(char*, char*, char*);
typedef ISIM::int64 (*VhdlResolutionFuncPtrRetInt64)(char*, char*, char*);
typedef double (*VhdlResolutionFuncPtrRetDouble)(char*, char*, char*);
typedef void (*ScalarBlasterFuncPtr)(char *, char *, char *, char *, unsigned, unsigned);
//typedef ISIM::int64 (*AdjustSpecifyDelayFuncPtr)(char*, char*, int, int, int);

enum var_scope {ISREFPORTNONLOCAL=0,ISCLASSAUTOMATICVAR, ISCLASSAUTOMATICVARFORKJOIN, ISGENERALIZEDAUTOMATIC, OTHERTYPE};
namespace ISIMK
{
    struct s_design_properties;
    struct s_net_view_properties;
    struct s_auto_net_view_properties;
    struct s_core_net_properties;
    struct s_driver_properties;
    struct s_sdx_extensions ;

    struct s_vlog_toggle_coverage_info;     // Is a part of globaldesignproperties and will store the toggle hit count array 

    typedef ISIM::uint8 UdpWaitTableElement;    // Type of element in a UDP wait table
    typedef ISIM::uint32 UdpProcessingChunk;    // Type to hold a chunk for comparing table entries
    typedef ISIM::uint16 UdpWaitTableIndex;     // Index/length of a UDP wait table

    typedef ISIM::uint8 UdpTableElement;
    typedef UdpWaitTableIndex UdpTableIndex;

    extern char* GlobalDP;

    // To get access to the top section of the .mem file which stores
    // design properties chares by kernel and the genered code, use this
    // variable directly
    extern s_design_properties* GlobalDesignProperties; 

    // For all extensions to XSim that are necessary to enable other
    //  Xilinx products and flows that require global information,
    //  use the variables located here.
    extern s_sdx_extensions* GlobalSDxExtensions ; 

    const double UdpHash = 0.5772156649;
    /* const double UdpHash = 0.61803398875; */
    const unsigned UdpRadix = 15;

    // NOTE: Add a meanigful prefix to each enumerator e..g DB_CHARVALUE to indicate
    // it is for Database or EVEN_VHDL_WAKEUP to mean it is an event kind enumerator
    // Note doing so will poppute the name space and can cause identifier collisions
   
    // Different kinds of hosts are to be built for different applications
    // An XSI based host for example does not need GDBMI and multi-threading of
    // kernel where as a host such as x.exe -gui requires GDBMI
    
    enum e_host_kind
    {
        HOST_GDBMI = 0, // GDMBI host with socket open to talk to another process
        HOST_XSI, // XSI host running in the process/main thread of a third party tool
	HOST_STANDALONE, // Accept no commands, just run -all and quit
	HOST_STANDALONE_DEBUG, // Run -all and quit, but accept commands
	HOST_SYSTEMC // no HDL simulation, systemC only host
    };

    enum e_simulation_type
    {
        NO_SIMULATION = 0,

        // First 8 bits (0th to 7th) are for language types
        VHDL_SIMULATION = 0x1,
        VERILOG_SIMULATION = 0x1<<1,
        SYSTEMVERILOG_SIMULATION = 0x1 << 2,
        SYSTEMC_SIMULATION = 0x1 <<3,

        // 8th to 15th bits for abstraction of simulation
        SIMPRIM_SIMULATION=0x1 <<8,

        // Bits 16 to 23 for major features of language
        ASSERTION_SIMULATION = 0x1 <<16,
        COVERAGE_SIMULATION = 0x1 <<17,
        CONSTRAINTS_RANDOM_SIMULATION = 0x1 <<18,

        // Bits 24 to 31 are free and can be used as desired

        // Masks for faster check.
        MASK_ASSERTION_COVERAGE_CRS = ASSERTION_SIMULATION |
        COVERAGE_SIMULATION | CONSTRAINTS_RANDOM_SIMULATION,

        MASK_HDL_LANGUAGE = VHDL_SIMULATION | VERILOG_SIMULATION | SYSTEMVERILOG_SIMULATION,


        MASK_SIM_LANGUAGE =MASK_HDL_LANGUAGE | SYSTEMC_SIMULATION


    };

    enum e_debug_type {
        // Must keep DESIGN_DEBUG_OFF zero to allow fast checking
        // for debug off case
        DESIGN_DEBUG_OFF = 0,
        DESIGN_DEBUG_LINE = 0x1,
        DESIGN_DEBUG_WAVE = 0x1 << 1,
        DESIGN_DEBUG_DRIVERS = 0x1 << 2,
        DESIGN_DEBUG_XLIBS = 0x1 << 3,
        DESIGN_DEBUG_SUBPROG = 0x1 << 4,
        DESIGN_DEBUG_SC = 0x1 << 5,
        MASK_DESIGN_DEBUG_TYPICAL = DESIGN_DEBUG_LINE | DESIGN_DEBUG_WAVE | DESIGN_DEBUG_DRIVERS,
        MASK_DESIGN_DEBUG_ALL = MASK_DESIGN_DEBUG_TYPICAL | DESIGN_DEBUG_XLIBS | DESIGN_DEBUG_SUBPROG
    };

    enum e_language
    {
        LANG_VHDL=0,
        LANG_VLOG,
        LANG_MIXED_VHDL_VLOG,
        LANG_SYSTEMVERILOG,
        LANG_MIXED_VHDL_SYSTEMVERILOG
    };

    enum e_db_value_type
    {
        DB_CHARVALUE=0,   // Use this for Verilog and VHDL logic value for GUI.
        DB_INTVALUE,    // Indicates that the value is a 32-bit signed integer        
        DB_INT64VALUE,  // Indicates that the value is a 64-bit signed integer
        DB_FLOATVALUE,  // Indicates that the value is a double
        //internal used value type. Do not use this on GUI side.
        DB_BITVALUE,    // Indicates that the value has only one bit, i.e. VHDL Bit value
        DB_BITVALUE_2,  // Indicates that the value has only 2 bit, i.e. Verilog 2 bit value
        DB_BITVALUE_4   // Indicates that the value has only 4 bit, i.e. VHDL std_ulogic
    };

    enum e_driver_type
    {
        WHOLE_DRIVER=0,
        BIT_DRIVEN_DRIVER
    };

    enum e_driver_kind
    {
        DRIVER_PROJECTED_WAVEFORM=0,
        DRIVER_NODELAY_WAVEFORM,
        DRIVER_SINGLE_EVENT,
        DRIVER_AGGREGATE_NET
    };

    enum e_event_kind
    {
        // Wakeup Events: Events to wake up the suspended HDL processes
        EVENT_WAKEUP_VHDL = 0,
        EVENT_WAKEUP_VLOG,
        EVENT_REACTIVE_WAKEUP_VLOG,
        EVENT_WAKEUP_SYSTEMC,
        EVENT_NOTIFY_SYSTEMC,

        //SystemVerilog event triggered wake-ups
        //non-blocking event trigger
        EVENT_NON_BLOCK_TRIGGER,
        EVENT_REACTIVE_NON_BLOCK_TRIGGER,
        // clear "triggered" state of an event
        EVENT_CLEAR_EVENT_TRIGGERED,

        // Net Update events: events to assign to target nets
        // Zero delay VHDL transaction
        EVENT_SINGLE_UPDATE_NODELAY_VHDL,
        // List of zero delay VHDL transaction nested together 
        EVENT_MULTIPLE_UPDATE_NODELAY_VHDL,
        // Inertial delay events
        EVENT_INERTIAL_DELAY_VHDL,
        // Verilog event for net assign with delay
        EVENT_INERTIAL_DELAY_VLOG,
        // VHDL transactions : TODO: old one, should be retired
        EVENT_BLOCKUPDATE_VHDL,
        //Verilog : "normal" verilog transactions, ActiveEvent list
        EVENT_BLOCKUPDATE_VLOG,
        // Program block net updates
        EVENT_REACTIVE_BLOCKUPDATE_VLOG,
        // Verilog: NonBlockingAssignmentEvent List, non blocking reg update, with intra assign 
        // delay control, but not inside loops
        EVENT_REG_NONBLOCKUPDATE_VLOG,
        EVENT_REG_NONBLOCKUPDATE_VLOG_8BYTES,
        // Same as EVENT_REG_NONBLOCKUPDATE_VLOG for the program blocks
        EVENT_REACTIVE_REG_NONBLOCKUPDATE_VLOG,
        // same as above except for inside a loop - involves deletion of memory.
        EVENT_REACTIVE_REG_NONBLOCKUPDATE_VLOG_8BYTES,
        // same as above except for inside a loop - involves deletion of memory.
        EVENT_REG_NONBLOCKUPDATE_IN_LOOP_VLOG,
        //same as EVENT_REG_NONBLOCKUPDATE_VLOG, except for presence of delay -- impact on assign-deassign/force
        EVENT_REG_NONBLOCKUPDATE_DELAY_CONTROL_VLOG,
        // same as EVENT_REG_NONBLOCKUPDATE_VLOG, except impacted by existing assign-deassign/force
        EVENT_REG_NONBLOCKUPDATE_DELAY_CONTROL_IN_LOOP_VLOG,
        //event control (With possible repeat) but not inside loop.
        EVENT_REG_NONBLOCKUPDATE_EVENT_CONTROL_VLOG,
        //event control (With possible repeat) inside loop.
        EVENT_REG_NONBLOCKUPDATE_EVENT_CONTROL_VLOG_IN_LOOP,


        // Monitor events
        EVENT_MONITOR_VLOG,
        EVENT_STROBE_VLOG,
        // SVA Sampling event
        EVENT_SVA_SAMPLING,
        // Stop events
        // This is for causing a break/pause in simulation at a given time
        EVENT_STOP,

        // Clean-up events
        // One or more UDP wait info tables require having their edges reset during the postponed region
        EVENT_CLEANUP_UDP,

        // TODO: Event type or types for observed region assertion handling i.e. handling of deferred assertion queue
        EVENT_OBSERVED_REGION_ASSERTION,

        EVENT_DYNAMIC_NONBLOCKUPDATE_VLOG ,
        EVENT_DYNAMIC_NONBLOCKUPDATE_VLOG_8BYTES ,
        EVENT_REG_NONBLOCKUPDATE_VLOG_NOEVENTCALL_LESS32 ,
        EVENT_REG_NONBLOCKUPDATE_VLOG_EVENTCALL_LESS32 
    };

    enum e_edge_kind //Should I call it e_vlog_edge_kind ?
    {
        POS_EDGE=1, //posedge = 1 (to be consistent with encoding used by VlogComp code
        NEG_EDGE=-1, //negedge = -1 (to be consistent with encoding used by VlogComp code
        NO_EDGE=0,  // no edge = 0
        UDP_EDGE=2  // any kind of edge except (XZ), (ZX), strength-only changes
    };


    enum e_net_kind 
    {
        DECLARED_VHDLNET=0,
        DECLARED_VLOGNET,
	DECLARED_REG,
        AGGREGATE_VHDLNET,
        AGGREGATE_VLOGNET
    };


    enum e_resolver_kind {
        VHDL_STD_LOGIC_RESOLVER = 0,
        VHDL_RESOLVER,
        VLOG_RESOLVER
        // Add more such as VHDL_ATOMIC_RESOLVER to resolve things faster
    };

    enum e_dir
    {
        TO = 1,
        DOWNTO = -1,
        UNCONSTRAINED = 0
    };
    enum e_file_mode
    {
        ReadMode=0,
        WriteMode,
        AppendMode,
        InvalidMode
    };

    enum e_vlog_file_mode
    {
        Read = 1, Write=2, Append= 4, Bin=8, Update=5
    };

    enum e_file_open_status
    {
        OpenOk = 0, StatusError = 1, NameError = 2, ModeError = 3
    };

    //32 bit - each bit used to flag a property, currently shared between reg and wire.
    enum e_vlog_net_reg_properties
    {
        ASSIGNED                     = 0x00000001, /*assign, for reg (assign-deassign), continuous assign for wires?*/
        FORCED                       = 0x00000002, /*force, both wire and reg can be forced */
        ASSIGNEDFORCEDMASK           = 0x00000003,
        ASSIGNED_BACKUP              = 0x00000004, /*for restored assign-assign value, when release hit*/
	//Bit 4 unused
	CURRENTLY_FORCED_BY_PROCESS  = 0x00000010,
	EVER_FORCED_BY_PROCESS       = 0x00000020,

        RELEASE_IN_PROGRESS = 0x00000080, /* flag indicating we are in iki_vlog_release */

    };

    /**
     * Value for s_design_properties::ExternalFunctionArg when calling a transaction function directly.
     *
     * In order to determine how to process a value update request from inside a transaction function,
     * the transaction function needs to know whether it was called through a normal update (from a
     * generated execute function, for example), or from special updaters, such as a Verilog force process
     * or the run-time Tcl force waveform generator.
     *
     * The enumerators are listed in order of strength.  For example, an assign overrides a normal value update, and
     * a force statement overrides an assignment.
     */
    enum e_transaction_call_source {
        NormalTransactionCallSource = 0,        ///< called from regular execute function
        AssignTransactionCallSource,        ///< called from Verilog continuous assign statement
        VerilogForceTransactionCallSource,  ///< called from logic implementing Verilog force
        TclForceTransactionCallSource       ///< called from Tcl force waveform generator
    };




    enum e_vhdl_report_type
    {
        VHDL_NOTE=0,
        VHDL_WARN,
        VHDL_ERROR,
        VHDL_FATAL
    };
    
    // Severity level indicated by severity task i.e. $info, $warning, $error, $fatal 
    enum e_vlog_severity_type
    {
        // Start with 100 so as to not collide with other sysTaskType used by 
        // already existing Vlog Compiler code. It uses 0,1,2,3. See createDisplayWriteSysTask and its last argument
        VLOG_INFO=100, 
        VLOG_WARNING=101,
        VLOG_ERROR=102,
        VLOG_FATAL=103
    };

    //combine vhdl and verilog radix type
    enum e_radix_type
    {
        Decimal=0,
        Binary,
        Octal,
        Hex,
        Unsigned,
        Ascii,
        Default
    };

    enum e_process_type
    {
        VhdlProc=0,
        VlogAlwaysWithGuardProc,
        VlogAlwaysWithoutGuardProc,
        VlogAlwaysCombOrLatch,
        VlogFinalProc,
        VlogInitialProc,
        VlogVarDeclAssignProc,
        VlogSvVarDeclAssignProc,
        VlogContAssignProc,
        VlogContAssignProcPortContext,
        VlogProceduralContinuousProc,
        VlogMonitorProc,
        VlogStrobeProc,
        VlogTimingCheckProc,
        VlogForkedProc,
        VlogUDPProc,
        VlogUDPCleanupProc,
        VlogInitialReactiveProc,
        VlogContAssignReactiveProc,
        VlogContAssignReactiveProcPortContext,
        VlogClockedSequenceProc,
        VlogSampledValueProc
    };

    enum e_process_priority
    {
        ProcImmediate = 0,
        ProcPriority,
        ProcRegular,
        ProcSvInit,
        ProcImmediateReactive,
        ProcPriorityReactive,
        ProcRegularReactive,
        ProcObservedRegion
    };

    enum e_vhdl_operator_kind
    {
        VHDL_AND=0,
        VHDL_OR,
        VHDL_NAND,
        VHDL_NOR,
        VHDL_XOR,
        VHDL_XNOR,
        VHDL_NOT,
        VHDL_SLL,
        VHDL_SRL,
        VHDL_SLA,
        VHDL_SRA,
        VHDL_ROL,
        VHDL_ROR,
        VHDL_MATCH_EQ,
        VHDL_MATCH_NE,
        VHDL_MATCH_ST,
        VHDL_MATCH_SE,
        VHDL_MATCH_GT,
        VHDL_MATCH_GE,
        VHDL_MAXIMUM,
        VHDL_MINIMUM
    };

    enum e_vlog_transitions
    {
        // Encoding For edge transition
        //
        // 3 bit for positive transition
        // 3 bit for negative transition
        // 2 bit for noedge   transition
        //
        POSEDGEMASK= 0X07,
        NEGEDGEMASK= 0X38,
        XZCHANGEMASK = 0XC0,
        CHANGEMASK = 0XFF,

        // 3 bit for posedge detections
        Edge_0_1 = 0X01,
        Edge_x_1 = 0X02,
        Edge_z_1 = 0X03,
        Edge_0_x = 0X04,
        Edge_0_z = 0X05,

        // 3 bit for negdge detections
        Edge_1_0 = 0X08,
        Edge_1_x = 0X10,
        Edge_1_z = 0X18,
        Edge_x_0 = 0X20,
        Edge_z_0 = 0X28,

        // 2 bit for noedge detections
        NoEdge_x_z = 0X40,
        NoEdge_z_x = 0X80,
        NoEdge_00_11_xx_zz = 0X00
    };

    enum e_vlog_udp_transition
    {
        // New value part of transition
        UdpNewX = 0x01,
        UdpNew1 = 0x02,
        UdpNew0 = 0x04,
        UdpNewMask = 0x07,
        UdpNewB = UdpNew1|UdpNew0,
        UdpNewQ = UdpNew1|UdpNew0|UdpNewX,
        
        // Old value part of transition
        UdpOldX = 0x10,
        UdpOld1 = 0x20,
        UdpOld0 = 0x40,
        UdpOldMask = 0x70,
        UdpOldB = UdpOld1|UdpOld0,
        UdpOldQ = UdpOld1|UdpOld0|UdpOldX,


        UdpIsEdge = 0x80,
        UdpUnsetEdge = 0x7f,
        UdpIsLevel = 0x08,
        UdpUnsetLevel = 0xf7,

        UdpNoChange = 0x77,

        Udp_0 = 0x11,
        Udp_1 = 0x12,
        Udp_X = 0x13,
        Udp_10 = 0x19,
        Udp_X0 = 0x1d,
        Udp_01 = 0x16,
        Udp_X1 = 0x1e,
        Udp_0X = 0x17,
        Udp_1X = 0x1b,
        Udp_EdgeMask = 0x13,
        Udp_MaskOffFirstBit = 0x0f

    };
    
    enum e_timing_check_type
    {
        Setup=0,
        Hold,
        Setuphold,
        Recovery,
        Removal,
        Recrem,
        Skew,
        Timeskew,
        Fullskew,
        Period,
        Width,
        Nochange,
        UnknownTimingCheck
    };

    enum e_vlog_var_type
    {
        VLOG_INTEGER=0,
        VLOG_SIGNEDREG,
        VLOG_UNSIGNEDREG,
        VLOG_TIME,
        VLOG_REAL,
        VLOG_REALTIME,
        VLOG_NAMEDEVENT,
        VLOG_UNKNOWNVLOGTYPE
    };

    
    enum e_vhdl_type_kind
    {
        VHDL_TYPE_ENUM,
        VHDL_TYPE_INTEGER,
        VHDL_TYPE_PHYSICAL,
        VHDL_TYPE_REAL,
        VHDL_TYPE_ARRAY,
        VHDL_TYPE_RECORD,
        VHDL_TYPE_ACCESS,
        VHDL_TYPE_FILE,
        VHDL_TYPE_SUBTYPE,
        VHDL_TYPE_MAX
    };

    // TODO :this needs to be completed and s_core_net_properties field
    // populated
    enum e_vlog_type_kind {

        // 4 state data types
        VLOG_TYPE_ENUM = 0,
        VLOG_TYPE_STRUCT,
        VLOG_TYPE_CLASS,
        VLOG_TYPE_UNION,
        VLOG_TYPE_LOGIC,
        VLOG_TYPE_INTEGER,
        VLOG_TYPE_TIME,

        // 2 state data types
        VLOG_TYPE_SHORTINT,
        VLOG_TYPE_INT,
        VLOG_TYPE_LONGINT,
        VLOG_TYPE_BYTE,
        VLOG_TYPE_BIT,
        VLOG_TYPE_ENUM_2STATE,

        // double types
        VLOG_TYPE_REAL,
        VLOG_TYPE_REALTIME,
        VLOG_TYPE_SHORTREAL,

        // Other types
        VLOG_TYPE_VOID,
        VLOG_TYPE_STRING,
        VLOG_TYPE_CHANDLE,
        VLOG_TYPE_ARRAY,
        VLOG_TYPE_VECTOR,
        VLOG_TYPE_VIRTUALVAR,
        VLOG_TYPE_MAX
    };

    enum e_scope_kind
    {
        INSTANCE_KIND,
        PROCESS_KIND,
        VHDL_BLOCK_KIND,
        VHDL_SUBPROGRAM_KIND, 
        VHDL_PACKAGE_KIND,
        VHDL_ENTITY_KIND,
        VLOG_BLOCK_KIND,
        VLOG_TASK_KIND,
        VLOG_FUNCTION_KIND

        , VLOG_SEQUENCE_KIND,
        VLOG_PROPERTY_KIND

    };

    enum e_kernel_status_kind {
        //Warnig:: Controller/src/gdbmiinputparser.cpp StatusReasonTable need to
        //         synchronize with this enum type
        // Just after elaboration, before init is run
        KERNEL_STATUS_ELABORATION_DONE,
        // Anytime engine is running
        KERNEL_STATUS_RUNNING,
        // Any time engine has returned after finishing HSimKernel::spsim()
        KERNEL_STATUS_STOPPED,
        // Engine stops at a break point (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_BREAKPOINT,
	// Engine stops at a conditional breakpoint
	KERNEL_STATUS_STOPPED_CONDITIONAL_BREAKPOINT,
        // Engine stops after asked to single step (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_END_STEPPING,
        // Not used currently
        KERNEL_STATUS_STOPPED_INTERRUPTED,
        // Engine stops at $stop (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_VLOG_STOP,
        // Engine stops at $finish (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_VLOG_FINISH,
        // Engine stops at package ENV procedure stop (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_VHDL_STOP,
        // Engine stops at package ENV procedure finish (while in the middle of HSimKernel::spsim())
        KERNEL_STATUS_STOPPED_VHDL_FINISH,
        // Engine stops as a condition was met
        KERNEL_STATUS_STOPPED_CONDITION_MET,
        KERNEL_STATUS_ERROR,
        KERNEL_STATUS_EXITED,
        KERNEL_STATUS_INVALID
    };

    enum e_debug_flag_bit {
        DEBUG_BIT_BREAKPOINT             = 0x01,
        DEBUG_BIT_SINGLE_STEP            = 0x02,
        DEBUG_BIT_INTERRUPT              = 0x04,
        DEBUG_BIT_LINE_TRACE             = 0x08,
        DEBUG_BIT_PROCESS_TRACE          = 0x10,
        DEBUG_BIT_CONDITIONAL_BREAKPOINT = 0x20,
        DEBUG_BIT_SC_HALT                = 0x40
    };


    enum e_event_propagation_type {

        // A transaction function is to be used
        EP_TRANS_FUNC = 1,

        // Net has one whole NSR and one "no-edge WAIT" on whole net
        EP_WAIT_INFO = 2,

        // Net has one whole NSR and one edge WAIT on whole net
        EP_WAIT_INFO_EDGE = 3,

        // Net has one whole NSR and multiple waits on that
        EP_NSR_WHOLE = 4,

        // One NSR with any kind of wait
        EP_NSR = 5,

        // Generic NSR Tree capable of handling multiple NSR
        EP_NSR_TREE = 6,

        // Net has one whole NSR and one "no-edge WAIT" on whole net
        EP_WAIT_INFO_SCALAR = 7,

        // Net has one whole NSR and one edge WAIT on whole net
        EP_WAIT_INFO_EDGE_SCALAR = 8,

        // Net has one whole NSR and multiple waits on that
        EP_NSR_WHOLE_SCALAR = 9,

        // One NSR with any kind of wait
        EP_NSR_SCALAR = 10,

        // Generic NSR Tree capable of handling multiple NSR
        EP_NSR_TREE_SCALAR = 11,

        //Net has one whole NSR and multiple kind of waits on that in a certain sort
        EP_NSR_WAIT_INFO_EDGE_VECTOR = 12,

        //Net has one whole NSR and many "no-edge WAIT" on whole net
        EP_NSR_WAIT_INFO_VECTOR = 13,

	// Versions of the NSR types that utilize complex elements
	EP_WAIT_INFO_COMPLEX                 = 14,
	EP_WAIT_INFO_SCALAR_COMPLEX          = 15,
	EP_WAIT_INFO_EDGE_COMPLEX            = 16,
	EP_WAIT_INFO_EDGE_SCALAR_COMPLEX     = 17,
	EP_NSR_WHOLE_COMPLEX                 = 18,
	EP_NSR_WHOLE_SCALAR_COMPLEX          = 19,
	EP_NSR_COMPLEX                       = 20,
	EP_NSR_SCALAR_COMPLEX                = 21,
	EP_NSR_TREE_COMPLEX                  = 22,
	EP_NSR_TREE_SCALAR_COMPLEX           = 23,
	EP_NSR_WAIT_INFO_EDGE_VECTOR_COMPLEX = 24,
	EP_NSR_WAIT_INFO_VECTOR_COMPLEX      = 25,
    // Generic NSR Tree capable of handling multiple NSR for 2state net
    EP_NSR_TREE_2STATE = 26,
    // Net has one whole NSR, and multile waits on that, some waits are dynamic waits
    EP_COMBINED_WAIT_INFO_VECTOR = 27,
    //Net has one whole NSR, and multiple waits on that nets, 
    //some waits are dynamic and some waits has edge info
    EP_COMBINED_WAIT_INFO_VECTOR_COMPLEX = 28,
    /*
    EP_COMBINED_WAIT_INFO_EDGE_VECTOR= 28,
    
    EP_COMBINED_WAIT_INFO_VECTOR_COMPLEX = 29,
    EP_COMBINED_WAIT_INFO_EDGE_VECTOR_COMPLEX = 30
    */
    };

    enum VhdlTypeEnum {
        VH_BIT_OR_COMPLEX = 0,
        VH_STD_LOGIC_OR_CONSTANT = 1,
        VH_REAL = 2,
        VH_INTEGER = 3
    };

    enum e_sv_process_status {
        FINISHED,
        RUNNING,
        WAITING,
        SUSPENDED,
        KILLED
    };


    //---------------
    // End Enums
    //---------------



    // ---------------
    // Begin structs
    //----------------
    
    // Specific extensions for the hardware emulation flow of the
    //  SDx toolset
    struct s_sdx_extensions
    {
      // Callback functions for accessing DDR memory in the C model
      int (*ddrRead)(int, int) ;
    };

    struct s_delay_waveform_element;
    struct s_event;
    struct s_task_invocation_properties;
    struct s_vlog_subprog_invocation_properties;
    struct s_function_invocation_properties;
    struct s_parent_fork_properties;
    struct s_fork_process_properties;
    struct s_process_properties;
    struct s_scope_properties;
    struct s_vlog_dynamic_named_block_properties;
    struct s_sv_std_process_class_object;

    // Derive a struct from this base element to create a fast and memory
    // efficient linked list of a structure. This struct should not have anything other
    // than Next pointer. 
    // 
    // As an exmaple, s_event could be derived from it and linked as below in the
    // event list. This exmaple assumes that events will mostly be added at the 
    // tail end of the list, hence adding to Head side of list does not need to
    // be as efficient as the adding to the tail end of the list 
    // s_linked_list_element Head;
    // s_linked_list_element* Tail;
    // To initialize the list do: Head.Next = 0; Tail = &Head;
    // To add an element (newElem with Next already set to 0) to end of the list: Tail->Next = newElem; Tail = newElem;
    // To add an element to beginning of the list: newElem->Next = Head.Next;Head.Next = newElem; if(Head == Tail) Tail = newElem;
    // To process the list, do:
    // s_linked_list_element* elem = Head.Next;
    // while (elem) {
    //  ...
    //  elem = elem->Next;
    // }
    

    struct s_linked_list_element
    {
        s_linked_list_element* Next;
    };

    //to store the time units and the multiplier
    // 100s -->2
    //  10s -->1
    //   1s -->0
    // 100ms ->-1
    //  10ms ->-2
    //  ...
    //   1fs ->-15

    struct s_timescale {
        int TimeUnits;
        int PrecisionUnits;
    };

    struct s_unsigned_tuple {
        unsigned first;
        unsigned second;
    };

    struct s_scope_properties {
        union {
            ISIM::far_offset_t parent_scope_offset;
            char* parent_cblk;
        };

        s_timescale TimeScale;
        ISIM::linefile_type line_file;
        //This should remain ISIM::near_offset_t offset from string section
        ISIM::near_offset_t scope_name_offset;
        unsigned scope_id;
        e_scope_kind scope_kind;
        char is_encrypted;
    };

    struct s_wait_properties
    {
        s_process_properties* process;
        ISIM::near_offset_t start_offset;
        unsigned size;
        //e_edge_kind edge;
        char edge;
        char is_reactive;

    };

    // One s_wait_properties struct needs to be associated with multiple s_declared_net_properties,
    // so we can't embed a next pointer in s_wait_properties
    struct s_wait_prop_container_element;
    struct s_wait_prop_container_element //: public s_linked_list_element
    {
        s_wait_prop_container_element* Next;
        s_wait_properties Data;
    };



    struct s_parent_fork_properties
    {
        // with the same named fork
        s_parent_fork_properties* next_active_fork;
        s_parent_fork_properties* prev_active_fork;
        // points to the list of all sibling fork processes
        s_fork_process_properties* sibling_forked_process_list;
        s_process_properties* calling_process;
        unsigned no_of_active_processes;
        unsigned no_of_completed_processes;
        //unsigned size;
        
    };

    struct s_process_properties {
        s_scope_properties scope_info;
        char* pstate;
        char* ip_ptr;
        ExecFuncPtr exec_func_ptr;
        union {
            // For VHDL wait on signal with timeout
            // e.g. "wait on clk1 for 10 ns;"
            s_event* timeout_event_vhdl_wait;
            // System C specific information - This is a pointer to 
            // SystemCContext struct
            void* SysCContext ;
            s_sv_std_process_class_object*    sv_std_process_object;
        };
        s_process_properties* next_process_properties;


        union {
            //s_task_invocation_properties *next_vlog_subprog; //can be task only
            s_vlog_subprog_invocation_properties *next_vlog_subprog; //can be task/function only
            s_vlog_subprog_invocation_properties *next_vhdl_subprog;
            s_net_view_properties* lhs_signal;
        };
        union {
            //check this flag in relevant procs (eg assign-assign, force). potential use in disable modeling.
            s_parent_fork_properties *fork_in_execution;
            s_driver_properties* driver_for_transaction;
        };
        union {
            s_vlog_dynamic_named_block_properties *dynamic_named_block_in_execution;
            s_net_view_properties* rhs_signal;
            ISIM::e_vlog_logic_value rhs_value;  // for 1-bit constant rhs
            int sc_scheduler_id;
        };
        char* bits_forced_by_this_process; //bits that are forced by this process (if 'this' a bitwise forcing process)
        union {
            unsigned is_active; //default false.
            unsigned len_transaction;
        };
        // The process (such as the monitor process) is already on the event list
        unsigned char is_on_last_event_list;
        // If already put into the process execution list for the current delta
        unsigned char is_on_exec_list;
        // Priority of execution for the process (ISIMK::e_process_priority)
        unsigned char priority;
        // If the process is executing (for SystemC self suspension)
        unsigned char is_executing ;
        // If the process is a coverage update event
        unsigned char is_coverage_update_event;
        // If the process is a SystemC process
        unsigned char is_SystemC;
        unsigned char has_disable_fork;
    };

    struct s_fork_process_properties
    {
        s_process_properties fork_process;
       // points to sibling fork --child of same fork statement
       // s_wait_properties wait_info;
       s_fork_process_properties *next_active;
       s_fork_process_properties *prev_active;
       s_parent_fork_properties *parent_fork;
       s_parent_fork_properties *parent_block; // Can this be combined with parent_fork ptr ? This just saves scope info for fork i.e. automatic variables etc

       char* real_ip_ptr;
       ExecTaskFuncPtr real_exec_func_ptr;
       // TODO: Change these to char
       unsigned char is_disabled;
       unsigned char is_finished;
       unsigned char disabled_itself;
       unsigned char is_returned;
       unsigned char is_join_none;
    };



    struct s_vlog_delay {
        ISIM::int64 Rise;
        ISIM::int64 Fall;
        ISIM::int64 TurnOff;
    };

    struct s_trireg_index_elem {
	s_trireg_index_elem* next;
	int value;
    };

    struct s_vlog_dynamic_named_block_properties {
        s_process_properties named_block_process;
        s_vlog_dynamic_named_block_properties *next_active;
        s_vlog_dynamic_named_block_properties *prev_active;
        char* real_ip_ptr;
        ExecSubprogFuncPtr real_exec_func_ptr;
        s_process_properties *calling_process;
        //unsigned size;
        // TODO: change these to char
        unsigned char disabled_itself;
        unsigned char is_finished;
        unsigned char is_disabled;
        unsigned char is_returned;
        unsigned char is_jump ; // The dynamic block ended with a break or continue
        char has_dynamic_type ;
    };

    struct s_vlog_named_block_properties {
        s_scope_properties scope_info; // for %m 
        // TODO: Move these two fields down and make them both char
        char is_active; //is the block active, can be optimized away by using the other fields below
	unsigned has_event:1; //1: Union below is used in event sense
	                      //0: Union below is used in waitinfo sense.
	union {
	    char* event; //event that needs to be Unscheduled (if any: #5)
	    char* waitinfo; //waitinfo whose status needs to be set to false (@a)
	};
        char* disable_state; //state where process to jump to if block disabled.
	s_vlog_named_block_properties* parentBlock;
        ISIM::far_offset_t  parentBlockOffset;
        s_process_properties *alwaysOrInitialProcess;
	s_task_invocation_properties *currentTaskInvocation; //this can keep changing or NULL.
    };
    
    struct s_force_list_element
    {
        s_process_properties* forcing_process_properties;
        s_force_list_element* next_forcing_element;
    };

    struct s_nonblock_properties : public s_linked_list_element
    {
        char* source_value;
        s_core_net_properties* net;
        unsigned driverId;
        unsigned startIndex;
        unsigned endIndex;
        e_event_kind kind;
        int repeat_value;  //always make sure repeat_value is an int
        ISIM::uint64 time_value;
    };

    // A node to hold all non blocking executes that are currently waiting on a net
    // As an always or initial is executed, it hits non blocking assignments with 
    // event control such as a <= repeat (3) @y b; or a <= @(r or b) c; Each of such
    // non blocking assignment with an event control is added to a list whose head is
    // kept at a particular offset in the mem file. Then each such list is hung
    // form a node of following struct type
    struct s_nonblock_list_element : public s_linked_list_element
    {
        // A dummy head element, skip the head while processing
        s_linked_list_element NBAExecuteHead;
        s_linked_list_element* NBAExecuteTail;
        // Whether the processes for a particular net has already been added to execute list
        unsigned char is_on_exec_list;     
    };

    struct s_function_invocation_properties
    {
        // This must be the first field. Do not move it down!
        s_scope_properties scope_info;
        s_function_invocation_properties *next_active_function;
        s_function_invocation_properties *prev_active_function;
        s_parent_fork_properties *fork_in_execution;
    };



    struct s_vlog_subprog_invocation_properties
    {
        // This must be the first field. Do not move it down!
        s_process_properties subprog_process;
        char* real_ip_ptr;
        s_process_properties *calling_process;
        ExecSubprogFuncPtr real_exec_func_ptr;
        //unsigned size;
        unsigned char disabled_itself;
        unsigned  char is_finished;
        unsigned char is_returned;
        unsigned  char is_disabled;
        unsigned char is_function;
        char has_dynamic_type ; 
    };

    struct s_task_invocation_properties
    {
        // This must be the first element. Do not move it down!
        s_vlog_subprog_invocation_properties subprog_inst;
        s_task_invocation_properties *next_active;
        s_task_invocation_properties *prev_active;
        void* DPI_context ; // Used when suspending the C side in DPI calls
        ISIM::far_offset_t parent_instance_scope_offset ; 
    };
    struct s_vlog_function_invocation_properties
    {
        // This must be the first element. Do not move it down!
        s_vlog_subprog_invocation_properties subprog_inst;
        ISIM::far_offset_t parent_instance_scope_offset ; 
    };

    struct s_vlog_subprog_scope_properties
    {
        s_scope_properties scope_info;
        union {
            unsigned size_without_dyn_par_block;
            char *dummy;  // to ensure pointer alignment
        };
    };

    struct s_vlog_sequence_invocation_properties
    {
        // This must be the first element. Do not move it down!
        s_vlog_subprog_invocation_properties subprog_inst;
        ISIM::far_offset_t parent_instance_scope_offset ; 
    };
    struct s_vlog_sequence_scope_properties
    {
        s_scope_properties scope_info;
        union {
            unsigned size_without_dyn_par_block; // We probably do not need this
            char *dummy;  // to ensure pointer alignment
        };
    };

        

    /*Holds run-time properties for design objects (such as a whole net) that can be traced.*/
    struct s_trace_properties
    {
        void **trace_object_map; // pointer to array of trace objects at run time, or 0 if not tracing this net
        //ScalarBlasterFuncPtr scalar_blaster_func; // function for calling a given function with each scalar
        // of the associated whole object
        unsigned preassign_trace_bitmap; // bitmap of trace features that are active for this net at the pre-assign
        // point in the transaction function
        //unsigned net_id; // First scalar netid
    };


    struct s_udp_table_properties {
        bool is_seq;
        unsigned row_size_in_chunks; //size of row in units of sizeof(UdpProcessingChunk)
        unsigned n_ports;
        unsigned n_rows;
        unsigned n_level_sensitive_rows ;
        char*    table_cache ;
        UdpTableElement table[1]; //uint8
    };

    // A net may be in multiple wait statements. A given sensitivity range of a net
    // may be waited upon at no edge, posedge, negedge or udpedge
    // Example:
    // @(posedge S[1:3], negedge T[2:3]) in P1  -- WI_1
    // @(negedge S[1:3], posedge T[2:3]) in P2  -- WI_2
    // @(S[1:3], T[2:3]) in P1                  -- WI_3
    // @(S[4:5], T[6:8]) in P2                  -- WI_4
    // @S in P1                                 -- WI_5
    // @ posedge S[1:3] in P2                   -- WI_6
    // For signal S:
    // There will be 6 s_wait_info for each of the wait statements in two processs P1 and P2
    // Net S will have a s_nsr_tree that will contain three s_nsr (whole, 1:3, 4:5)
    // The s_nsr[whole] will have one s_wait_info_edge with NO_EDGE and s_wait_info pointing to WI_5
    // The s_nsr[1:3] will have four s_wait_info_edges: 1) posedge, Wait Info: WI_1, 2) negedge, Wait Info WI_2
    // 3) no_edge, Wait Info WI_3, 4) posedge, Wait Info: WI_6
    // The s_nsr[4:5] will have one s_wait_info_edge with NO_EDGE and s_wait_info poiting to WI_4


    // Keep this of 4 bytes. This is wait info
    // Wait on a, b, c; or @(posedge clk, negedge data);
    // Each wait statement will create one s_wait_info
    struct s_wait_info {
        // If 1, process is currently waiting at this wait info, so nets
        // asscoaited with this wait info should wake up the associated process
        // if any of such nets had an event. If 0, the process is not currently
        // waiting on the net that points to this s_wait_info
        // is_waiting must be the first field
        char is_waiting;
        ISIM::near_offset_t offset_process_properties;
    };



    // Run-time WaitInfo state for a UDP
    struct s_udp_wait_info
    {
        // Wait Infos for a process will be written out right after process
        // processes. Hence, a 16 bit offset is enough to find the process
        // subtract offset from address of s_udp_wait_info to get to the process
        ISIM::near_offset_t offset_process_properties;  // The offset to the process waiting on this wait info
        UdpWaitTableIndex table_size_in_chunks;  // size of wait table in units of sizeof(UdpProcessingChunk)
        UdpWaitTableElement wait_table[1];       // as many UdpWaitTableElements as necessary for whole wait table,
    };


    struct s_wait_info_edge {
        ISIM::int16 edge; // Edge of the sensitivity e.g. @posedge clk
        ISIM::uint16 udp_port_index; // The port index of the UDP to which the net is connected
        // Pointer to s_udp_wait_info or s_wait_info. The address is relocated
        char* wait_info;
    };


   struct s_nsr_whole_classified {
        unsigned int count;
        unsigned int no_edge_count;
        unsigned int pos_edge_count;
        unsigned int neg_edge_count;
        char*        wait_edges[1];
        // Do not add any element after this
    };
   // Use this for whole NSR with wait on edges or noedges
    struct s_nsr_whole {
        unsigned int edge_count;
        s_wait_info_edge wait_edges[1];
        // Do not add any element after this
    };

    // Use this for whole NSR with wait on edges or noedges
    struct s_nsr_whole_noedge {
        unsigned int count;
        char* wait_info[1];
        // Do not add any element after this
    };

    struct s_nsr_noedge {
        unsigned int start_index;
        unsigned int end_index;
        unsigned int wait_count;
        char* wait_info[1];
        // Do not add any element after this
    };


    struct s_nsr {
        unsigned int start_index;
        unsigned int end_index;
        unsigned int edge_count;
        s_wait_info_edge wait_info_edges[1];
        // Do not add any element after this
    };


    // For each net, there could be multiple NSR's and each NSR will
    // point to a s_wait_info. Multiple NSR's could point to the same
    // s_wait_info
    struct s_nsr_tree{
        unsigned int nsr_count;
        // Array of pointers to the NSR
        s_nsr* nsr[1];
        // Do not add any element after this
    };

    struct s_core_net_properties {

        // This field is used only for keeping list if dynamically waiting
        // processes. It is not used for static processes
        s_wait_prop_container_element wait_head;

        s_net_view_properties* signal;

        ISIM::far_offset_t strength_section_offset; //array of ISIM::s_vlog_strength one per bit (if above has_bitwise_strength is true).

        // A net may have a transaction function or offset to ordered pairs of
        // Net Sensitivity ranges stored in the order of depth-first pre-order
        // traversal of NSR tree. NSR (start, end) pairs are sorted by start
        // index of the NSR
        // The flag "transaction_mode" listed towards the end of the
        // struct should be checked to determine whether to use transaction
        // function or nsr field or some other mechanism
        union {
            // If this field is set to 0, it means that there is no need to wake up
            // any HDL processes. Simply copy over value to the net and process
            // any call back event such as TCL force, tracing etc.

            // Transaction function to call to propagate events
            TransactionFuncPtr transaction_func;

            // Address of s_wait_info or s_wait_info_edge, s_nsr_whole, s_nsr or s_nsr_tree
            // depending upon transaction_mode being EP_WAIT_INFO, EP_WAIT_INFO_EDGE,
            // EP_NSR_WHOLE, EP_NSR or EP_NSR_TREE

            char* event_propagation;
        };

        // Where is the last_value (if any) for this net
        ISIM::near_offset_t last_value_offset;
        // Where is the last_event_array (if any) for this net
        ISIM::near_offset_t last_event_offset;
        // Where is the last_active_array (if any) for this net
        ISIM::near_offset_t last_active_offset;
        //sampled_values_setback is used to locate the value of sampled values for SVA, $past may 
        //require multiple values at different clock ticks
        ISIM::near_offset_t sampled_values_offset;
        union {
            ISIM::near_offset_t nba_offset;
            // For vhdl nets, offset to resolution fn if needed
            ISIM::near_offset_t vhdl_resolution_function_offset;
        };

        //Offset of s_proc_cont_properties
        ISIM::near_offset_t proc_cont_offset;
        // Trace bitmap 
        ISIM::near_offset_t trace_offset;
        //offset to array of offsets(ptrs) to driver info, s_bit_driver_id_properties, for each bit of the net
        ISIM::near_offset_t driver_ids_array_offset;
        union {
            // Offset of type struct in the type block
            ISIM::near_offset_t type_offset;
            e_vlog_type_kind vlog_type;
        };

        //unsigned char has_bitwise_strength; //Set to true if different bits can have different stregths. Currently always set to true.

        // VHDL no of bytes or Verilog number of bits
        unsigned value_size;
        //no of drivers across all bits (not counting force-release drivers.
        unsigned num_drivers;
        unsigned active_nba_event_count;
        unsigned char kind;

        // Put upto four net attributes in this section using char field
        // If need more than four, then switch to using bit field of unsigned to get up to
        // 32
        // Attrib 1
        union {
            unsigned char has_strength; //If it has strength modeling at all.

            // Following field, vhdl_std_logic_type_complex_type_info, encodes information if the net has std_logic value or not And if its 
            // type is complex type (i.e. array, record etc.). So we have 4 possible combinations made out of 2 pieces of info
            // 0 : Not Std Logic and Not Complex type
            // 1 : Not Std Logic and Complex type
            // 2 : Std Logic but not complex 
            // 3 : Std logic and Complex
            //If this is a VHDL net whose base elements are of std_logic type, vs. bit type; this is needed for mixed language simulation, 
            // for aggregate net support, to do the runtime conversion of net values from Verilog to VHDL and from VHDL to Verilog
            unsigned char vhdl_std_logic_type_complex_type_info;
        };
        // Attrib 2
        unsigned char slow_transaction; // 1: has slow transaction and 0 means does not
        // Attrib 3
        // store e_event_propagation_type values casted as char. Only eight possible
        // values are allowed. & with the e_event_propagation_type enumerator to determine
        // right value
        unsigned char transaction_mode;
        // One more attribute can be added as char, after that will need to change it to bitfield
        // End net attributes

        int toggle_hitCount_index;

        // Consider replacing the unsigned char has_strength; up to
        // unsigned char transaction_mode; with one single field called
        // properties and use e_net_properties enumertors to store
        // attributes to allow adding many more properties without mem increase.
        // The extra & op cost should not impact run time much, but reduced memory
        // could be significant when new fields are
        // needed. So, far we have three char fields only, so we are fine

        char* event_ptr;

    };

    /*
    * Models the top level net. Each such net has an array of associated 
    * s_sliced_net_properties. Here is an example of splitting--
    * s(1 to 8) -> (s(1 to 4), s(5), s(6 to 8))
    * This will lead to an array of s_sliced_net_properties with three 
    * elements. The size field in the elements will be 4, 1, and 3 respectively
    */
    struct s_declared_net_properties
    {
        // This must be the first element. Do not move it down!
        s_core_net_properties core;
        s_vlog_delay vlogDelay;//All 3 fields used only if "has_net_delay_rise_fall" is true
        ISIM::e_vlog_net_kind vlog_net_kind;  //wand, wor etc
        //The following 3 are just used by verilog (for now)
        //for net delay modeling. Eventually move it to a better place
        unsigned char has_net_delay; //true for any net delay eg #10 or #(10, 2, 3)
        unsigned char has_net_delay_rise_fall; //only true for #(10, 2, 3) or #(10,2) type 
        unsigned char is_multiply_driven;


        // Don't insert any fields between ISIM::far_offset_t module_path_info_offset and char value[1]
        // To maintain alignment
        ISIM::far_offset_t module_path_info_offset; //offset to s_module_path_info, next field should be char value[1]
        char value[1]; // Previous field should be ISIM::far_offset_t module_path_info_offset
    };

    /*
    * Models reverse split, many to one. Consider a port association, 
    * where a fake net 'f' is created which is a collection of real nets --
    * f => (a1, a2, a3)
    * Formal f is a fake net since it is a collection of disjoint individual 
    * nets. The aggregate net DOES store the aggregate value of individual nets.
    */ 
    struct s_aggregate_net_properties
    {
        // This must be the first element. Do not move it down!
        s_core_net_properties core;
        ISIM::far_offset_t aggregate_element_start_offset; 
        unsigned aggregate_element_count;
        // NOTE: value should be aligned at 8 byte boundary. Since it appears after a field 
        // of type near_offset_t, it is (atleast) aligned at 4 byte boundary.
        // Dummy node to make sure allignment of value good in all cases.  TODO: remove this in final code.
        //

        ISIM::far_offset_t module_path_info_offset; //was dummy now offset to s_module_path_info. No change in memory footprint
        //Don't add anything after this (i.e far_offset_t field) !!! and before value below !!

        char value[1];
    };

    struct s_aggregate_net_element_properties
    {
        s_core_net_properties* actual;
        unsigned char vhdl_type;
        s_unsigned_tuple actual_scalar_slice;
        s_unsigned_tuple actual_physical_slice;
        s_unsigned_tuple formal_scalar_slice;
        s_unsigned_tuple formal_physical_slice;
    };

    // Following is not the right way to do it as enum takes 4 bytes, 
    // so sizeof(s_vlog_driver_strength) is 4 bytes
    // Each driver needs to store strength for 0 and strength for 1
    //struct s_vlog_driver_strength {
    //    ISIM::e_vlog_strength_level Strength0:4;
    //    ISIM::e_vlog_strength_level Strength1:4;
    //};
    
    // Each driver needs to store strength for 0 and strength for 1
    // Srength0:4 bit field does not work as g++ has a bug in optimized mode where
    // sign extension for char f = S.Sterngth0 does not work if Strength0 is a 4 bit bit field
    // Although the values here are positive, operations in conjunction with net strength value
    // causes issues, hence keep each field a byte long
    struct s_vlog_driver_strength {
        char Strength0;
        char Strength1;
    };

    // WARNING: The force release/strength code has some assumption that breaks if the data members are
    // arranged in a different order. Be careful touching this till force release/strength code
    // is cleaned up
    struct s_driver_properties {
        unsigned char kind;
        //flag to indicate driver is affected by specify module path delay
        unsigned char has_adjust_specify_delay_func;
        // Three more char fields can go here. There is a three byte hole here
        s_vlog_driver_strength strength; //The strength specification (default strong)
        unsigned driver_id;
        char* blasted_strength_ptr;
        // How far below is one of the ISIMK::s_projected_waveform, ISIMK::s_nodelay_waveform 
        // or ISIMK::s_base_event from me

        // ___________________________________________________________________________________
        // WARNING: Must not add any field in between the two or after the two. Add any new field above
        // this line
        ISIM::far_offset_t extended_properties_offset;
        // NOTE: value should be aligned at 4/8 byte boundary. Since it appears after a field 
        // of type far_offset_t, it is correctly aligned at 4/8 byte boundary.
        char value[1];
    };

    //procedural continuous - force/release, assign/deassign
    struct s_proc_cont_properties {
        //This points to the new process that had to be created for force x =y etc.
        char* full_force_process; //process currently forcing the full net.
        // Change for using regHandle
        char* full_assign_assign_process; //process currently assigning reg
        char* assign_value; //Ptr ro value of assign if we need to restore it
        // End Change for using regHandle
        unsigned a_force_driver_id; //any force driver, use it to restore value in case of multiple driver scenari
        unsigned num_of_driver_ids;
        unsigned net_reg_props; //representing the e_vlog_net_reg_properties
        ISIM::near_offset_t bitMapContinuousAssignOffset; //size of core_net num of bytes, used during release
        ISIM::near_offset_t bitMapForceProcessOffset; //size of core_net num of bytes
        ISIM::near_offset_t forcingProcessesListOffset; //list of forcing processes for this net, represented for s_force_list_element
        ISIM::near_offset_t continuousAssignTransactedOffset; //value locations for release
        ISIM::near_offset_t savedStrengthOffset; //strength locations for release
        ISIM::near_offset_t driverIdsArrayOffset;
        bool has_bit_blasted_forced_drivers;
    };
 
    /*
    * Used for array index constraints or integer range constraints
    */
    struct s_vhdl_constraint
    {
        int left;
        int right;
        unsigned length;
        e_dir dir;
    };

    /*
    * Used for physical type constraints
    */
    struct s_vhdl_constraint_int64
    {
        ISIM::int64 left;
        ISIM::int64 right;
        ISIM::uint64 length;
        e_dir dir;
    };

    /*
    * Used for real type constraints
    */
    struct s_vhdl_constraint_double
    {
        double left;
        double right;
        double length;
        e_dir dir;
    };

    // base struct for all types
    struct s_base_vhdl_type
    {
        // Must keep this as first field
        ISIM::linefile_type line_file;
        e_vhdl_type_kind kind;

    };

    // For static type declarations these type/subtype objects would be layed out in the types file. 
    // For dynamic case these objects would be layed out in the call block.

    struct s_vhdl_enum_literal
    {
        ISIM::near_offset_t literal_name_offset;
        unsigned literal_value;
    };

    // VHDL Enum type declarations
    struct s_vhdl_enum_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_vhdl_constraint constraint;
        s_vhdl_enum_literal first_literal[1];
        // Has an array of s_vhdl_enum_literals starting with first_literal.
        // The last literal has unit_name = 0 and unit_value = 0
    };

    struct s_vhdl_physical_literal
    {
        ISIM::near_offset_t unit_name_offset;
        ISIM::int64 unit_value;
    };

    // VHDL Physical type declarations
    struct s_vhdl_physical_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_vhdl_constraint_int64 constraint;
        s_vhdl_physical_literal first_literal[1];
        // Has an array of s_vhdl_physical_literals starting with first_literal.
        // Last literal has unit_name = 0 and unit_value = 0
    };

    struct s_vhdl_integer_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_vhdl_constraint constraint;
    };

    // VHDL Real type declarations
    struct s_vhdl_real_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_vhdl_constraint_double constraint;
    };
    
    // VHDL Array type declarations
    // Note that constraints for all array dimensions (including those of its element type) 
    // are flattened out and layed out in sequence. Element type is guaranteed to be of scalar type
    // access type, Consider the following example--
    //
    // subtype bit_vector_8 is bit_vector(9 to 16);
    // type uu is array (1 to 8) of bit_vector(9 to 16);
    // type ww is array (1 to 8) of bit_vector_8;
    //
    // Both uu and ww are treated as same: no_of_dimensions = 8, element_type = bit
    struct s_vhdl_array_type {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_base_vhdl_type* element_type;
        // no_of_dimensions stores "Verific effective dimensions"
        unsigned no_of_dimensions;
        s_vhdl_constraint constraint[1];
        // This must be the last element. Do not add anything after it!
    };
    
    struct s_vhdl_record_element
    {
        s_base_vhdl_type* element_type;
        // How far is this record element in a value buffer of this record type 
        ISIM::near_offset_t element_setback;
    };

    // VHDL Record type declarations
    struct s_vhdl_record_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        unsigned no_of_elements;
        s_vhdl_record_element element_type[1];
        // This must be the last element. Do not add anything after it!
    };        

    // VHDL Access type declarations
    struct s_vhdl_access_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_base_vhdl_type* designated_type;
    };        
 
    // VHDL File type declarations
    struct s_vhdl_file_type
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_base_vhdl_type* designated_type;
    };

    // [1] VHDL Subtype declarations
    // [2] Locally constrained element type of an array type declaration
    //     e.g. type aa is array (1 to 8) of integer range 5 to 6;
    // [3] Locally constrained element type of a record declaration
    //     e.g. type rr is record
    //              e1 : integer range 5 to 6;
    //              e2 : bit_vector(1 to 8);
    //          end record;
    //  Note that for array types, the constraint_array would contain the constraints
    //  of all the effective dimensions in the form of an array, similar to array
    //  type declarations.
    struct s_vhdl_subtype
    {
        // This must be the first element. Do not move it down!
        s_base_vhdl_type base;
        s_base_vhdl_type* base_type;
        union {
            s_vhdl_constraint constraint_int;
            s_vhdl_constraint_double constraint_double;
            s_vhdl_constraint_int64 constraint_int64; 
            s_vhdl_constraint constraint_array[1];
        };
        // This must be the last element. Do not add anything after it!
    };     

    struct s_auto_net_view_properties {
        //unsigned physical_setback;
        unsigned scalar_setback;
    };
    struct s_net_view_properties {

        // Points to the declared net or an aggregate net
        s_core_net_properties* core_net; 
        // For VHDL nets point to the beginning of the value buffer of the whole/aggregate net
        // For Verilog nets point to the beginning of the value buffer of the whole/aggregate net
        char* value;
#ifdef DEVELOPMENT
        ISIM::linefile_type line_file;
#endif
        // setback on the value buffer for this signal. 
        // To read a VHDL signal do value + physical_setback
        // To read a Verilog signal use value together with scalar_setback
        unsigned physical_setback;
        // Scalar setback of the split net from the beginning of scalars of the whole/aggregate net
        unsigned scalar_setback;
        union {
            s_vhdl_constraint constraint_int;
            s_vhdl_constraint_double constraint_double;
            s_vhdl_constraint_int64 constraint_int64;
            s_vhdl_constraint constraint_array[1];
        };
        // This must be the last field. Do not add any new field here
    };


    struct s_signal_parameter_properties {
        s_driver_properties* driver;
        // This must be the last element in any derived struct as constraints
        // of s_net_view_properties is of variable size
        s_net_view_properties signal;
    };

    struct s_access_variable_properties
    {
        char* value;
        int* access_count;
        s_vhdl_constraint* constraints;
        s_access_variable_properties* next_access_variable_properties;
        unsigned no_of_bytes;
        unsigned no_of_dimensions;
        unsigned char free_value;
        unsigned char is_null;
    };


    struct s_file_variable_properties
    {
        char* filename;
        std::iostream* stream;
        ISIM::linefile_type line_file;
        s_file_variable_properties* next_file_variable_properties;
        // do not use bit field for enum types. Enum will take 4 bytes and
        // the bit fileds has no saving. 
        // e_file_mode mode:2;
        e_file_mode mode;
        unsigned textFile:1;
        unsigned freeFilename:1;
        unsigned std_in_or_out:1;
    };

    //Replacement for ValueS
    typedef ISIM::s_vlog_value_s s_vlog_value_s;

    typedef ISIM::s_time s_time;

    struct s_timeformat {
        const  char*  SuffixStr;
        int    TimeUnits;
        int    PrecisionUnits;
        int    FldWidth;
    };

    struct s_relocation_entry {
        ISIM::far_offset_t address_offset;
        ISIM::far_offset_t addend; 
    };

    struct s_type_block_properties {
        unsigned index_count;
        ISIM::near_offset_t index_section_offset;
        unsigned relocation_count;
        ISIM::near_offset_t relocation_section_offset;
        unsigned size;
    };

    struct s_module_path_info
    {
        ISIM::near_offset_t module_path_start_offset;
        unsigned module_path_count;
        unsigned has_module_path_delay:1;
        unsigned has_bitwise_module_path_delay:1;

    };

    struct s_module_path_properties
    {
        // delays (upto 12)
        ISIM::int64 delays[12];
        s_declared_net_properties* input;
        s_declared_net_properties* output;
        // Function ptr for conditional module paths
        int (*conditionEvalFuncPtr)(char*, char*);
        char* ip_ptr;
        unsigned input_scalar_start_index;
        unsigned input_scalar_end_index;
        unsigned input_scalar_offset;
        unsigned output_scalar_start_index;
        unsigned output_scalar_end_index;
        unsigned output_scalar_offset;
        unsigned delay_count;

        // edge
        e_edge_kind edge;
        // polarity
        e_edge_kind polarity;

        // delay => or *>
        char delay_arc;
    };

    // Following structs are mainly used by IKI and Kernel. The .mem may initialize some of
    // them, but the elements order does not matter.

    struct s_design_properties
    {

        ISIM::uint64 Time;
        // Data to be passed from a function caller to its callee.
        // This argument would be used in cases where adding a parameter
        // to the function signature is undesireable because the extra
        // parameter is rarely used and would significantly impact performance.
        // Caution: this technique is not thread safe, nor will it work
        // for deferred function calls (callbacks from the event queue).
        ISIM::uint64 ExternalFunctionArg;

        //start of instance string section
        ISIM::far_offset_t StringSectionOffset;
        ISIM::far_offset_t FileNameTableOffset;
        ISIM::far_offset_t RelocationTableOffset;

        //for keeping the last process for reporting
        s_process_properties* ExecutingProcess;

        // include a first dummy element to the execute list so
        // we can always use this as the first element, negating the
        // need to check whether there's a first element during
        // adding to the list
        
        s_process_properties* ExecutePriorityListTail;
        s_process_properties ExecutePriorityListHead;
        
        s_process_properties* ExecuteListTail;
        s_process_properties ExecuteListHead;
       
        s_process_properties* ExecuteFinalListTail;
        s_process_properties ExecuteFinalListHead;

        s_process_properties* ExecuteImmediateListTail;
        s_process_properties ExecuteImmediateListHead;
        
        s_linked_list_element* NonBlockingExecuteListTail;
        s_linked_list_element NonBlockingExecuteListHead;
        
        s_process_properties* ExecuteSvInitListTail;
        s_process_properties ExecuteSvInitListHead;
 
        s_process_properties* ExecuteReactivePriorityListTail;
        s_process_properties ExecuteReactivePriorityListHead;
        
        s_process_properties* ExecuteReactiveListTail;
        s_process_properties ExecuteReactiveListHead;
        
        // Observed region event list
        s_process_properties* ExecuteObservedListTail;
        s_process_properties ExecuteObservedListHead;

        s_process_properties* ExecuteObservedPriorityListTail;
        s_process_properties ExecuteObservedPriorityListHead;

        
        s_linked_list_element* NonBlockingExecuteReactiveListTail;
        s_linked_list_element NonBlockingExecuteReactiveListHead;
 
        s_parent_fork_properties* CallingProcessJoinNoneFork;
        
        s_file_variable_properties* VhdlFileVariablesListTail;
        s_file_variable_properties* VhdlFileVariablesListHead;
        
        s_access_variable_properties* VhdlAccessVariablesListTail;
        s_access_variable_properties* VhdlAccessVariablesListHead;
        //a pointer to vlog file flush list
        char* VlogFileFlushList; 

        //Active monitor process
        s_process_properties* CurrentMonitorProcess;
        s_wait_properties*    CurrentMonitorWaitInfo;
        ExecFuncPtr           CurrentMonitorDispFunc;
        FuncPtr               CurrentScheduleProcess;
        e_event_kind          CurrentBlkUpdVlogEventKind;
        e_event_kind          CurrentVlogWakeupEventKind;
        e_event_kind          CurrentNBAUpdVlogEventKind;
        char                  DynamicWaitIsReactive;

        const s_type_block_properties* HDLTypeBlock;
       
        s_timeformat TimeFormat;

        unsigned TotalNumberOfFileNames;
        ISIM::near_offset_t TypeFileNameOffset; //will remain ISIM::near_offset_t
        unsigned RelocationCount;
        unsigned Delta;
        unsigned MaxDeltaId;
        // This is OR of ISIMK:e_simulation_type bits to store simulation types
        // Perform bit & with one of enumerator in ISIMK:e_simulation_type to find
        // each of the bits
        unsigned simulation_types;
        // Stores value of -debug passed to xelab
        unsigned debug_type;
        // precision needs to be of type int as ranges from 0 to -15
        int time_precision;
        //for keeping the last line file
        ISIM::linefile_type LineFile;
        //if kernel is stopped because of condition met, the ID of the condition that stopped the kernel
        int ConditionId;
        //current state of the kernel
        e_kernel_status_kind KernelStatus;
        int StopFinishVerbose;
        int ProgramBlkInitStmtCount;
        unsigned LineCount;
        bool SlowDown;
        //for checking if the final block is executed
        bool finalBlockExecuted ;
        unsigned char MonitorOn; //0: off, 1: on
        unsigned char DebugFlags;

         // Kernel stores the latest resolved strength for multiple drivers 
        // driving a verilog wire and then calls transaction function. 
        // Generated code should look up at this location to get strength 
        // of the verilog net
        // Keep it near char for better compaction
        ISIM::s_vlog_strength TempResolvedVlogStrength;

        // Global variables needed by DPI task calls (since the 
        //  context and stack completely change during invocations)

        int TempRunningInNewContext ;

        const char* coverageRunDir;
        const char* coverageRunName;
       
        unsigned char AssertOffFlag; // 0: svlog assertion is on (default), 1: assertion is off 
        bool constraintRegistration;
        
        // Code Coverage
        bool codeCoverage;
        unsigned char codeCoverageDbg;
        const char* codeCoverageType;
        const char* codeCoverageDB;
        const char* codeCoverageDir;
        s_vlog_toggle_coverage_info* toggleCoverageInfo;

        // HWSWCosim 
        const char* CosimHostName;
        const char* CosimPortNo;
        const char* CosimNumSwBridge;
        //unsigned hwcosim_sw_buffer_limit;
        unsigned CosimBufferLimit;
        unsigned CosimSyncMode;
        unsigned int CosimVerboseLevel;
    };

    struct s_vhdl_resolution_function_call {
        e_vhdl_type_kind ReturnType;
        union {
            VhdlResolutionFuncPtrRetChar ResolFuncRetChar; 
            VhdlResolutionFuncPtrRetInt32 ResolFuncRetInt32;
            VhdlResolutionFuncPtrRetInt64 ResolFuncRetInt64; 
            VhdlResolutionFuncPtrRetDouble ResolFuncRetDouble;
        };
        ISIM::far_offset_t PtrToResolutionFunctionIPOffset;
        // In the .mem create following to emulate the funciton 
        // call block. & this->FunctionCallBlock should be passed
        // to the resolution function call.
        s_function_invocation_properties FunctionCallBlock;
        // Pass the pointer to the actual value
        char* PtrToActualValue;
        // Pass the constraints of the actual
        s_vhdl_constraint ActualConstraints;
    };

    struct s_resolver_element: public s_linked_list_element
    {
        TransactionFuncPtr TransactionFunc;

        // For transaction functions that are inside the kernel, we have 
        //  to also pass the net
        char* net ;

        // It has first two bytes the flags:
        // *(CurrentDrivingValueOrStrengthArray) is resolved_in_current_delta flag
        // *(CurrentDrivingValueOrStrengthArray+1) is resolution funciton added flag
        // For Verilog:
        // If the VlogResolveStrength is true cast as (ISIM::s_vlog_strength*)(CurrentDrivingValueOrStrengthArray+2)
        // to get to array of strength range for each driver
        // else cast as (char*)(CurrentDrivingValueOrStrengthArray+2)to get array of ValueS
        // For VHDL:
        // else cast as (char*)(CurrentDrivingValueOrStrengthArray+2)to get array of VHDL values
        char* CurrentDrivingValueOrStrengthArray;

        union {
            s_vhdl_resolution_function_call* VHDLResolutionFunctionCallObject;
            ISIM::e_vlog_net_kind VlogNetKind;
        };
        e_resolver_kind Kind;
        union
        {
            // Offset into the whole net value starting which new value should
            // be written. Used for VHDL.
            ISIM::near_offset_t PhysicalStartOffset;  
            // Starting scalar index into the whole net. Used for Verilog.
            unsigned ScalarStartIndex; 
        };

        unsigned NoOfDrivers;

        union {
            // Number of bytes that should be copied from SourceValue 
            // on the destination net starting at PhysicalStartOffset.
            // Used for VHDL for each Bit
            unsigned VhdlTargetElementSize;
            // Should the strength resolution be performed as oppposed to
            // performing value resolution for Verilog nets
            bool VlogResolveStrength;
        };


    };

    struct s_base_event: public s_linked_list_element
    {
        union {
            s_core_net_properties* net;
            char* value;    // for non-blocking trigger, address of the event synchonizing object is stored here
        };

        union {
            // Assignment event
            char* SourceValue;
            // Wakeup event type
            s_process_properties* Process;
        };
        union {
            // An assignment event will call this to do assignment
            // and propagate values
            TransactionFuncPtr TransactionFunc;
            // A process wake up event will call this to wake up and
            // execute the process
            ExecFuncPtr ExecFunc;
            // Non-blocking trigger will call the "iki" to trigger the event in NBA region
            FuncPtr Func;
        };

        // This indicates action that needs to be taken for the event
        // e.g. is it a non blocking verilog assignment vs a blocking
        // verilog assignment 
        e_event_kind Kind;

        union
        {
            // Offset into the whole net value starting which new value should
            // be written. Used for VHDL.
            ISIM::near_offset_t PhysicalStartOffset;
            // Starting scalar index into the whole net. Used for Verilog.
            unsigned ScalarStartIndex;
        };
        union
        {
            // Number of bytes that should be copied from SourceValue 
            // on the destination net starting at PhysicalStartOffset.
            // Used for VHDL.
            unsigned NoOfBytes;
            // Ending scalr index into the whole net. Used for Verilog.
            unsigned ScalarEndIndex;
        };
        unsigned DriverId;  // each driver has a unique id
    };

    struct s_nodelay_waveform_element;

    // Use this for handling s(1 to 2)<= "10"; s(3) <= '1' ; s(5) <='1'; kind of sequence 
    // of assignment
    struct s_nodelay_waveform_element : public s_base_event 
    {
        s_nodelay_waveform_element* NextWE;
    };

    struct s_nodelay_waveform
    {
        s_nodelay_waveform_element WaveformHead;
        unsigned SourceValueSize; // Number of bytes needed for source value
    };

    // Use this for a <= transport|inertial s after t ns kind of assignment
    // Event for transport delay, the projected waveform needs to be mantained
    // and updated. Intertial delay requires rejection on top of updating.
    struct s_delay_waveform_element;
    struct s_projected_waveform;
    struct s_delay_waveform_element : public s_base_event 
    {
        ISIM::uint64 Time;
        s_delay_waveform_element* NextWE;
        s_delay_waveform_element* PrevWE;
        s_projected_waveform* Driver;
        // If an event has been rejected due to inertial rejection then it will
        // marked as Unscheduled. 
        bool Unscheduled;
    };

    struct s_vlog_pulse_filter {
      ISIM::int64 RejectLimit;
      ISIM::int64 ErrorLimit;
      unsigned  HasPathPulse:1;  //0: no        1: yes
      unsigned  ShowCancelled:1; //0: no show   1: show cancell
      unsigned  OnDetect:1;      //0: on event, 1: on detect
    };


    struct s_projected_waveform {
        s_delay_waveform_element* WaveformHead;
        s_delay_waveform_element* WaveformTail;
        s_delay_waveform_element* FreeWE;
        //base net value pointer not used yet
        s_vlog_value_s* NetValue;
        //for example signal a [7:0];
        //driver  a[3:2] = 2'b11; StartIndex 2
        //if there is offset with base then StartIndex is 2+offset
        //not used yet
        unsigned* StartIndex; // not used yet
        s_vlog_pulse_filter PulseFilter;
        unsigned NoOfScalars; // Numbe of scalars
        unsigned SourceValueSize; // Number of bytes needed for source value
        unsigned driver_id;

    };


    struct s_event:public s_base_event
    {
        bool Unscheduled;
    };


// ---------------
// End structs
//----------------




    struct s_bit_driver_id_properties
    {
        unsigned num_of_drivers; // number of drivers for this bit
        ISIM::far_offset_t offset_list_of_drivers; //the address of the list of drivers for this bit, kind of points to  s_bit_drivers below
        char*  list_of_driver_ids; //the buffer containing driverId-s for the drivers of this bit
        
    };
    struct s_bit_drivers
    {
        char unresolved_in_current_delta;
        char resolution_function_added;
        char *driver_list; // value, strength info for each of the driver
    };
    struct s_bit_driver_id_properties_with_elem_size_per_scalar_index
    {
        unsigned num_of_drivers; // number of drivers for this bit
        unsigned size_per_scalar_index; //if this net is a record or array of records, the size of the this scalar index
        ISIM::far_offset_t offset_list_of_drivers; //the address of the list of drivers for this bit
        unsigned* list_of_driver_ids; //the driverId-s for the drivers of this bit
        
        //char unresolved_in_current_delta; // flag 
        //char resolution_function_added;   // flag 
        
        
    };

    typedef struct rb_tree_node_runtime_layout {
        struct rb_tree_node_runtime_layout* parent ; 
        struct rb_tree_node_runtime_layout* left ; 
        struct rb_tree_node_runtime_layout* right ; 
        bool color ;
        char key_value_pair[0] ;
    } rb_tree_node_t; 

    typedef struct rb_tree_runtime_layout {
        rb_tree_node_t* root ;
        virtual int compare(char* key_val_pair_left, char* key_val_pair_right) = 0 ;
        virtual void copy(char* key_val_pair_lhs, char* key_val_pair_rhs) = 0 ; 
    } rb_tree_t ; 

    typedef struct assoc_array_runtime_layout : public rb_tree_t {
        int size ; // no-of-elements
        int element_size ;
        virtual int keysize(char* key_val_pair) = 0;
        virtual rb_tree_node_t *getnode(char* index, int length) = 0;
        virtual void copykey(char* dst, char* key_val_pair, int key_len) = 0;

        char *default_value;
        char *last_deleted_index;
        std::map<char*, std::set<char*>> *dependent_process_map;
    } assoc_array_t ;

    typedef struct assoc_array_runtime_integral_key_layout : public assoc_array_t {
        int key_size ; // bogus type system can not give key size if key is an array
        int key_signed ; // needed for comparison
        static void* operator new(size_t size) ;
        virtual int compare(char* key_val_pair_left, char* key_val_pair_right) ;
        virtual void copy(char* key_val_pair_lhs, char* key_val_pair_rhs) ;
        virtual int keysize(char* key_val_pair);
        virtual rb_tree_node_t *getnode(char* index, int length);
        virtual void copykey(char* dst, char* key_val_pair, int key_len);
    } assoc_array_integral_t ;

    typedef struct assoc_array_runtime_class_key_layout : public assoc_array_t {
        static void* operator new(size_t size) ;
        virtual int compare(char* key_val_pair_left, char* key_val_pair_right) ;
        virtual void copy(char* key_val_pair_lhs, char* key_val_pair_rhs) ;
        virtual int keysize(char* key_val_pair);
        virtual rb_tree_node_t *getnode(char* index, int length);
        virtual void copykey(char* dst, char* key_val_pair, int key_len);
    } assoc_array_class_t ;

    typedef struct assoc_array_runtime_string_key_layout : public assoc_array_t {
        static void* operator new(size_t size) ;
        virtual int compare(char* key_val_pair_left, char* key_val_pair_right) ;
        virtual void copy(char* key_val_pair_lhs, char* key_val_pair_rhs) ;
        virtual int keysize(char* key_val_pair);
        virtual rb_tree_node_t *getnode(char* index, int length);
        virtual void copykey(char* dst, char* key_val_pair, int key_len);
    } assoc_array_string_t ;

    typedef struct assoc_array_runtime_wildcard_key_layout : public assoc_array_t {
        static void* operator new(size_t size) ;
        virtual int compare(char* key_val_pair_left, char* key_val_pair_right) ;
        virtual void copy(char* key_val_pair_lhs, char* key_val_pair_rhs) ;
        virtual int keysize(char* key_val_pair);
        virtual rb_tree_node_t *getnode(char* index, int length);
        virtual void copykey(char* dst, char* key_val_pair, int key_len);
        int getCompactKeysize(char* key_val, int key_length);
    } assoc_array_wildcard_t ;

    const int NumberOfElementsInBlock = 16;
    const int InitialNumberOfBlocks = 2;

    typedef struct memPtrData
    {
        void* ptr;
        bool isMalloc ;
    } memPtrData_t;

    typedef struct queue_runtime_layout 
    {
        int type_id ;
        bool has_wait_on_element ;
        int size ;
        void** block_list ;

        int front ; 
        int front_index ;
        int rear ; 
        int rear_index ;

        int no_of_total_blocks ;
        int no_of_actual_blocks_allocated ;
        std::vector<ISIMK::memPtrData_t*> *block_list_info; // vector stores the 'block_list' memory pointers and how it's allocated   
        std::set<void*> *unusedMemPtrSet ; // this set stores the block addresses which allocated and ignored due to block total read through pop_front or pop_back 
    } queue_t ;

    typedef struct dynamic_array_runtime_layout 
    {
        int type_id ;
        int size ;
        int element_size ;
        int has_process_waiting;
        char value[0] ;

    } dynamic_array_t ;

    struct s_event_synchronizing_object {
        ISIMK::s_wait_prop_container_element *blocking_wait_head;
        ISIMK::s_nonblock_list_element       *nba_wait_head;
        int                                   is_triggered; 
    };
// Process properties for timing checker process
struct s_timing_checker_process_properties
{
    s_process_properties base_process; // base process properties i.e scope, pstate etc
    ISIMK::e_timing_check_type timing_check_type; // what type of checker this is 
    ISIM::near_offset_t timing_check_stmt_str_offset; // pretty printed stmt string that gets used in printing violation message

    // data terminal
    s_net_view_properties *data_net_view;
    ISIM::int32 data_start_index;
    ISIM::int32 data_end_index;
    ISIMK::e_edge_kind data_edge;
    int (*data_condition_eval_func_ptr)(char*, char*);
    ISIM::int32 has_data_condition_arg; // has separate data cond arg (possible only for setuphold and recrem)

    // ref terminal
    s_net_view_properties *ref_net_view;
    e_edge_kind ref_edge;
    ISIM::int32 ref_start_index;
    ISIM::int32 ref_end_index;
    int (*ref_condition_eval_func_ptr)(char*, char*);
    ISIM::int32 has_ref_condition_arg;
    
    // time check limits
    ISIM::int64 tcheck_limit1_value;
    ISIM::int64 tcheck_limit2_value;

    // other properties i.e. notifier etc.
    s_net_view_properties *notifier_net_view;
    s_driver_properties* driver_for_notifier_transaction;
    unsigned len_notifier_transaction;
    s_net_view_properties *delayed_data_net_view;
    s_net_view_properties *delayed_ref_net_view;

    // Runtime timestamps
    ISIM::int64* DataTimeStamp; // populate at runtime when in timecheck fn 1st time
    ISIM::int64* RefTimeStamp;  // populate at runtime when in timecheck fn 1st time
};

    struct s_sva_expr_eval_functions {
        FuncPtrTwoArgs eval_functions[1];
    };


    struct s_sva_expr_eval_functions_three_args {
        FuncPtrThreeArgs eval_functions[1];
    };


        struct s_sva_expr_eval_functions_three_args_return_charstar {
        FuncPtrThreeArgsReturnCharStar eval_functions[1];
    };



    struct s_sva_expr_scope {
        s_scope_properties seq_or_prop_scope[1];
    };
    struct s_sva_sequence_expr_scope {
        int scope[1];

    };

    struct s_sva_sequence_scope_sp_ptr {
        char* sp_ptr[1];
    };
    struct s_sva_sequence_expr_2_scope_id {
        int scope[1];

    };


    struct s_sva_sequence_inputs {
        int inputs[1];
    };

    enum e_vlog_sequence_status {
        FAIL = 0,
        STEP_FAIL,
        PASS,
        VACUOUS_PASS,
        STEP_PASS,
        START,
        FORK,
        OP_AND,
        OP_OR,
        OP_IMPL_O, // Overlap
        OP_IMPL_NO, // None overlap
        OP_NOT,
        OP_FIRST_MATCH,
        OP_THROUGHOUT,
        OP_INTERSECT,
        OP_WITHIN,
        OP_CASE,
        OP_CASE_ITEM,
        OP_CASE_DEFAULT,
    };

    struct s_sv_state_properties {
        ISIM::int32 stateId;
        bool isTransient;
        char status; // FAIL,PASS,VACOUS_PASS, STEP_PASS;
        ISIM::int32 inputTableIndex; // or int (*input_expr_eval_func_ptr_table) (char*, char*)
        ISIM::int32 nextPassStateId;
        ISIM::int32 nextPassState2Id;
        ISIM::int32 nextFailStateId;
        char* dummy; // forces alignment
    };


    struct s_sv_sequnece_property_scope_info {
        s_scope_properties* seq_or_prop_scope;
        unsigned scope_size;
        ISIM::far_offset_t offSetFromDP;
        ISIM::far_offset_t offsetFromIP;
        ISIM::far_offset_t real_ip_offsetFromDP;
        // Function Ptrs
        // scope_enter_func_ptr
        // scope_exit_func_ptr
        
    };


    // Process properties for SV sequence (top level process)

    struct s_sv_sequence_process_properties {
        s_process_properties base_process; // base process properties i.e scope, pstate etc
        char ignore_assertion;
        char report_assertion_pass;

        unsigned number_of_inputs;

        s_sva_expr_eval_functions_three_args* expr_eval_functions;
        //s_sva_expr_eval_functions* expr_eval_functions;

        s_sva_sequence_inputs* input_array;
        void* rootSeqmanager;
        void* localVars;
        ExecFuncPtr then_stmt;
        ExecFuncPtr else_stmt;
        FuncPtrTwoArgs disable_iff_func; // to support "disable iff (disable_expr) (prop_expr)"  
        unsigned number_of_states;
        s_sv_state_properties *state_array;

        unsigned number_of_scopes;
        s_sv_sequnece_property_scope_info *scope_array;
        s_sva_sequence_expr_scope *exprscope_array;
        s_sva_sequence_expr_scope *exprparentscope_array;
        s_sva_sequence_expr_scope *parentscope_array;

        s_sva_sequence_scope_sp_ptr* scope_sp_ptr_array;
        s_sva_expr_eval_functions_three_args_return_charstar* /* s_sva_expr_eval_functions_three_args* */ scope_create_functions;
        s_sva_expr_eval_functions_three_args_return_charstar* /* s_sva_expr_eval_functions_three_args* */ scope_delete_functions;


    };

    struct s_sv_sampling_process_properties {
        s_process_properties base_process;
        s_core_net_properties* core_net;
        unsigned si;
        unsigned ei;
    };

    // Header structure for a class object
    struct s_sv_class_object_info
    {
        void* member_sensitivity_info;
        void* rng_addr ;
        void* ip_ptr ;
        union {
            int object_type;
            int instance_index_for_covergroup;
            void* dummy_void_ptr_for_alignment;
        };
    };

    struct s_sv_std_process_class_object
    {
        s_process_properties* hdl_process;
        ExecFuncPtr           actual_exec_func_ptr;
        char                  awaiting_hdl_process_list[sizeof(void*)];
        e_sv_process_status   hdl_process_status;
        unsigned char         wakeup_on_resume;
    };

    struct s_vlog_stream_val_s
    {
        char *streamBuf;
        s_vlog_value_s streamLen;
    };

    struct s_vlog_toggle_coverage_info
    {
        unsigned int hitCount_populated;
        unsigned int hitCount_array_size;
        unsigned int* hitCount_array;                
    };
}



#endif


