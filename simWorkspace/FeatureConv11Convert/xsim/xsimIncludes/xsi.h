// Copyright 2010, Xilinx Inc.  All rights reserved.
// $Id: xsi.h,v 1.3 2011/04/19 21:26:27 kumar Exp $

#ifndef ISIM_XSI_H
#define ISIM_XSI_H

#ifdef  __cplusplus 
extern "C" { 
#endif 

#if defined (_MSC_VER)
    typedef unsigned __int64 uint64_t;
    typedef unsigned __int32 uint32_t;
    typedef unsigned __int8 uint8_t;
    typedef signed __int64 int64_t;
    typedef signed __int32 int32_t;
    typedef signed __int8 int8_t;
#elif defined(__MINGW32__)
#include <stdint.h>
#elif defined(__linux)
#include <inttypes.h>
#else
#include <sys/types.h>
#endif
#include <stdarg.h>
#ifndef XSI_TYPES
#define XSI_TYPES
    typedef int64_t XSI_INT64;
    typedef uint64_t XSI_UINT64;
    typedef int XSI_INT32;
    typedef unsigned int XSI_UINT32;
    typedef short XSI_INT16;
    typedef unsigned short XSI_UINT16;
    typedef char XSI_BYTE8;
    typedef unsigned char XSI_UBYTE8;
    typedef char* XSI_VALUEHANDLE;
#endif


    /* Port Kinds */
#define xsiInputPort   1
#define xsiOutputPort  2 
#define xsiInoutPort   3

    
    /* Error types */
#define xsiNormal     1
#define xsiError      2
#define xsiFatalError 3


    /* Properties to be used in xsi_get_int and xsi_get_str calls */

    /* Returns number of ports in the top module (first top in case of multiple top designs) */
#define xsiNumTopPorts            1    

    /* The time precision of simulation used by the XSim simulation kernel */
    /* Valid time precision values are from 0 to -15 and they represent following:
    *  0 : 1 s,    
    * -1 : 100 ms, -2 : 10 ms, -3 : 1 ms,  -4: 100 us,  -5: 10 us,  -6: 1 us
    * -7 : 100 ns, -8 : 10 ns, -9 : 1 ns, -10: 100 ps, -11: 10 ps, -12: 1 ps
    * -13: 100 fs, -14: 10 fs, -15: 1 fs
    */
#define xsiTimePrecisionKernel    2 

    /* Returns port kinds: xsiInputPort, xsiOutputPort, xsiInoutPort */
#define xsiDirectionTopPort       3 

    /* Returns number of bits for Verilog wire and reg types             */
    /* Returns number of bytes for VHDL and other Verilog types          */
    /* For Verilog reg/wire values are bit packed in 32 bit words        */
    /* The (number of bits + 1)/32 will give the number of 32 bit words  */
    /* needed to store the value for a Verilog reg/wire HDL object       */
    /* For VHDL and other Verilog types values are contigous array of    */
    /* scalars. For example std_logic_vector(0 to 2) is stored in 3 bytes*/
    /* where each byte stores one std_logic value*/
#define xsiHDLValueSize           4

    /* Returns const char* string. Memory is owned by XSim Kernel */
#define xsiNameTopPort            5   



    /* Use XSI_DLLESPEC to export symbols out of XSim Kernel 
       and import into client code. Use XSI_DESIGN_DLLESPEC
       to export symbols out of xelab generated dll i.e.
       user design dll and import into client/XSim Kernel code
    */
#if defined(_WIN32)
#ifdef XSI_EXPORT
#define XSI_DLLESPEC __declspec(dllexport)
#define XSI_HIDE_SYMBOL_SPEC true
#else
#define XSI_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef XSI_DLLESPEC
#define XSI_DLLESPEC
#endif
#endif

#if defined(_WIN32)
#ifdef XSI_DESIGN_DLL_EXPORT
#define XSI_DESIGN_DLLESPEC __declspec(dllexport)
#else
#define XSI_DESIGN_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef XSI_DESIGN_DLLESPEC
#define XSI_DESIGN_DLLESPEC
#endif
#endif

    /* A generic pointer to an object in the design */
    typedef void* xsiHandle;  

    /* Verilog logic values are stored bit packed encoded in two bits 
     * one bit put into aVal and the other into bVal. The four logic 
     * values are encoded as {aVal, bVal}: 0=00, 1=10, X=11, Z=01 
     * So, a 8 bit logic value 0Z11011X is stored as below :
     * (in hexadecimal) aVal = 00000037 bVal=00000041 */
    typedef struct t_xsi_vlog_logicval {
        XSI_UINT32 aVal;
        XSI_UINT32 bVal;
    } s_xsi_vlog_logicval, *p_xsi_vlog_logicval;

    /* Note: VHDL std_logic value is stored in a byte (char). The 
     * MVL9 values are mapped as  'U':00, 'X':1, '0':2, '1':3
     * 'Z':4, 'W':5, 'L':6, 'H':7, '-':8 . The std_logic_vector 
     * is stored as a contiguous array of bytes. For example 
     * "0101Z" is stored in five bytes as char s[5] = {2,3,2,3,4}
     * An HDL integer type is stored as C int, a HDL real type is 
     * stored as a C double and a VHDL string type is stored as char*.
     * An array of HDL integer or double is stored as an array of C
     * integer or double respectively                         */  

    /* Pass start up switches using this struct */
    typedef struct t_xsi_setup_info {
        char* logFileName; /* A Null value means turn off log file generation */
        char* wdbFileName; /* Name of the output xsim waveform database (WDB) file.  If null, defaults to xsim.wdb */
    } s_xsi_setup_info, *p_xsi_setup_info;

    /* For each function supported by XSI, a typedef has been provided
     * below for easily storing the function pointer address of the 
     * XSI function. 
     */
    typedef xsiHandle (*t_fp_xsi_open)(p_xsi_setup_info);
    typedef int (*t_fp_xsi_get_port_number)(xsiHandle, const char*);
    typedef const char* (*t_fp_xsi_get_port_name)(xsiHandle, int);
    typedef void (*t_fp_xsi_put_value)(xsiHandle,XSI_INT32, void*);
    typedef int (*t_fp_xsi_get_value)(xsiHandle, XSI_INT32, void*);
    typedef void (*t_fp_xsi_run)(xsiHandle, XSI_INT64);
    typedef void (*t_fp_xsi_restart)(xsiHandle);
    typedef int (*t_fp_xsi_get_int)(xsiHandle, XSI_INT32);
    typedef int (*t_fp_xsi_get_int_port)(xsiHandle, XSI_INT32, XSI_INT32);
    typedef const char* (*t_fp_xsi_get_str_port)(xsiHandle, XSI_INT32, XSI_INT32);
    typedef int (*t_fp_xsi_get_status)(xsiHandle);
    typedef const char* (*t_fp_xsi_get_error_info)(xsiHandle);
    typedef void (*t_fp_xsi_close)(xsiHandle);
    typedef void (*t_fp_xsi_trace_all)(xsiHandle);
    typedef XSI_INT64 (*t_fp_xsi_get_time)(xsiHandle);


    /** Load the design and initialize the design handle
    *   This function is generated by XSim compiler xelab per design
    *   @param setup_info is set up information for the design
    *   @returns the XSI design handle
    *
    *   Please make sure that all of the fields of `setup_info` are initialized.  One way to ensure that all fields
    *   are always initialized, even if a future version of XSI adds new fields to the struct, is to set all bytes
    *   of the struct to zero before setting individual fields, as shown below.
    * 
    *       s_xsi_setup_info info;
    *       memset(&info, 0, sizeof(info));
    *       info.logFileName = ... // set fields as desired
    *       xsi_open(&info);
    */ 
#ifndef XSI_HIDEFUNCTIONSPEC
    XSI_DESIGN_DLLESPEC xsiHandle xsi_open(p_xsi_setup_info setup_info); 
#endif

    /** Get port number of the specified port name (only top level ports supported)
    *   @param design_handle is XSI handle
    *   @param port_name is name of the port (case sensitive for Verilog and case-insensitive for VHDL)
    *   @returns the port number of the specified port if the named port exists else returns -1
    *   Example: To get port number of the port named clk
    *   XSI_INT32 port_number = xsi_get_port_number(design_handle, "clk");
    */
    XSI_DLLESPEC XSI_INT32 xsi_get_port_number(xsiHandle design_handle, const char* port_name);

    /** Get port name back from port number (only top level ports supported)
    *   @param design_handle is XSI handle
    *   @param port_number is number returned earlier from call of xsi_get_port_number
    *   @returns the port name of the specified port if the named port exists else returns NULL
    *   Example: To get port name of the port number 1
    *   const char *port_name = xsi_get_port_name(design_handle, 1);
    */
    XSI_DLLESPEC const char* xsi_get_port_name(xsiHandle design_handle, XSI_INT32 port_number);

    /** Put value on the port specified by the port_number
    *   @param design_handle is XSI design handle 
    *   @param port_number is position number of the port in HDL port declaration
    *          Example: For "entity lut is port (a: in std_logic_vector(0 to 7),
    *          b: out std_logic_vector(0 to 7));," the port_number of a is 0 and
    *          the port_number of b is 1
    *   @param port_value is value buffer of the specified port in XSim value format
    */ 
    XSI_DLLESPEC void xsi_put_value(xsiHandle design_handle, XSI_INT32 port_number,  void* port_value);

    /** Read value of the port specified by the port_number 
    *   @param design_handle is XSI design handle 
    *   @param port_number is position number of the port in HDL port declaration
    *          Example: For "entity lut is port (a: in std_logic_vector(0 to 7),
    *          b: out std_logic_vector(0 to 7));," the port_number of a is 0 and
    *          the port_number of b is 1
    *   @param port_value is value buffer of the specified port in XSim value format
    */ 
    XSI_DLLESPEC void  xsi_get_value(xsiHandle design_handle, XSI_INT32 port_number, void* port_value); 

    /** Run simulation for given number of time units 
    *   @param design_handle is XSI design handle 
    *   @param time_ticks is number of simulation ticks (number of units of kernel time precision)
    *          to run simulation for. Call xsi_get_int(handle, xsiTimePrecisionKernel)
    *          to get time precision of kernel. Say you need to run simulation for 50 ns. Then,
    *          you can code as below: XSI_INT32 kernel_precision = xsi_get_int(handle, xsiTimePrecisionKernel);
    *          XSI_UINT64 time_ticks = (50 * (10 ** (-9))/ (10 ** kernel_precision)
    *          Say, Kernel is simulating at 1 ps precision, then kernel_precision will be -12 and hence
    *          time_ticks = (50 * (10 ** (-9)) / (10 ** (-12) ) = 50 * 1000 = 50,000
    */ 
    XSI_DLLESPEC void xsi_run(xsiHandle design_handle, XSI_UINT64 time_ticks); 

    /** Reset simulation time to 0
    *   @param design_handle is XSI design handle
    */
    XSI_DLLESPEC void xsi_restart(xsiHandle design_handle);

  
    /** Get integer value of the specified property
    *   @param design_handle is XSI handle 
    *   @param property is the XSI property for which to get value for
    *   @returns the value for specific property (See #define's above) 
    *   Example: To get number of top level ports for a design: 
    *   XSI_INT32 numPorts = xsi_get_int(design_handle, xsiNumTopPorts);
    */ 
    XSI_DLLESPEC XSI_INT32 xsi_get_int(xsiHandle design_handle, XSI_INT32 property); 


    /** Get integer value of the specified property for the given port
    *   @param design_handle is XSI handle 
    *   @param port_number is XSI serial number of the port 
    *   @param property is the XSI property for which to get value for
    *   @returns the value for specific property (See #define's above)
    *   Example: To get width of the port whose serial number is 1:
    *   XSI_INT32 width = xsi_get_int(design_handle, 1, xsiWidthTopPort);
    */ 
    XSI_DLLESPEC XSI_INT32 xsi_get_int_port(xsiHandle design_handle, XSI_INT32 port_number, XSI_INT32 property); 

    
    /** Get string value of the specified property for the given port
    *   @param design_handle is XSI handle 
    *   @param port_number is XSI serial number of the port 
    *   @param property is the XSI property for which to get value for
    *   @returns the value for specific property (See #define's above)
    *   Example: To get name of the port with serial number 1:
    *   const char* name = xsi_get_str(design_handle, 1, xsiNameTopPort);
    */ 
    XSI_DLLESPEC const char* xsi_get_str_port(xsiHandle design_handle, XSI_INT32 port_number, XSI_INT32 property);

    /** Get status of the simulation run 
    *   @param design_handle is XSI design handle 
    *   @return current status of design. Returns one of xsiNormal, xsiError, xsiFatalError
    */
    XSI_DLLESPEC XSI_INT32 xsi_get_status(xsiHandle design_handle);

    /** Get the last error message encountered
    *   @param design_handle is XSI design handle 
    *   @returns current error messages. Returns null if no error message printed ever
    */
    XSI_DLLESPEC const char* xsi_get_error_info(xsiHandle design_handle);

    /**
     * Causes all signals in the design to be logged to the waveform database (WDB)
     * BETA FEATURE
     * @param design_handle the XSI design handle
     */
    XSI_DLLESPEC void xsi_trace_all(xsiHandle design_handle);
    
   /** Close simulation and free up memory used by the design
    *   @param design_handle is XSI design handle
    */
    XSI_DLLESPEC void xsi_close(xsiHandle design_handle);

    /** Close simulation and free up memory used by the design
    *   @param design_handle is XSI design handle
    */

    XSI_DLLESPEC XSI_UINT64 xsi_get_time(xsiHandle design_handle); 

    //XSI_FORCE_WAVEFORM 
    /*
     * Single waveform element. It consists of time offset and value 
     * Time offset is reprsented by UNIT64 while value can be one or more s_vlog_value_s consisting of aVal, bVal pair. 
     * For objects <= 32 bits, there will be one t_xsi_vlog_logicval. For bigger values there will be more. Number of these objects is stored in num_logic_vals
     */
    typedef struct t_xsi_waveform_element {
        XSI_UINT64 time_offset;
        XSI_VALUEHANDLE valueHandle;       
        XSI_UINT32 num_logic_vals;
    } s_xsi_waveform_element, *p_xsi_waveform_element;

    
    /* Waveform, which consists of multiple waveform elements.
     * num_waveform_elements indicates how many elements this waveform has
     * t_xsi_waveform_element * points to the array of these waveform elements
     */
    typedef struct t_xsi_waveform {
        XSI_UINT32 num_waveform_elements;
        s_xsi_waveform_element *waveform_elements;
    } s_xsi_waveform, *p_xsi_waveform;
    
    typedef void (*t_fp_xsi_generate_waveform)(xsiHandle,XSI_INT32, XSI_UINT64, XSI_UINT64, s_xsi_waveform*  /*XSI_UINT32, ...*/ );
    typedef void (*t_fp_xsi_force_waveform_simple)(xsiHandle,XSI_INT32, XSI_UINT64, XSI_UINT64,  XSI_UINT32, ...);
    
    typedef void (*t_fp_xsi_force_waveform_simple_va_list_args)(xsiHandle,XSI_INT32, XSI_UINT64, XSI_UINT64, XSI_INT32, va_list args);

    typedef void (*t_fp_xsi_generate_clock_waveform)(xsiHandle,XSI_INT32, XSI_UINT32 val1, XSI_UINT64 time1,XSI_UINT32 val2, XSI_UINT64 time2);
typedef void (*t_fp_xsi_generate_clock)(xsiHandle,XSI_INT32,  XSI_UINT64 timeLow, XSI_UINT64 timeHigh);


    XSI_DLLESPEC void xsi_generate_waveform(xsiHandle design_handle, XSI_INT32 port_number, XSI_UINT64 repeatcycle_time_ticks,  XSI_UINT64 cancel_time_tick,  s_xsi_waveform* waveform);
    XSI_DLLESPEC void xsi_force_waveform_simple(xsiHandle design_handle, XSI_INT32 port_number, XSI_UINT64 repeatcycle_time_ticks,  XSI_UINT64 cancel_time_tick, XSI_INT32  numValueTimePairs, ...);
    XSI_DLLESPEC void xsi_force_waveform_simple_va_list_args(xsiHandle design_handle, XSI_INT32 port_number, XSI_UINT64 repeatcycle_time_ticks,  XSI_UINT64 cancel_time_tick, XSI_INT32  numValueTimePairs, va_list args);
    XSI_DLLESPEC void xsi_generate_clock_waveform(xsiHandle design_handle, XSI_INT32 port_number, XSI_UINT32 val1, XSI_UINT64 time1, XSI_UINT32 val2, XSI_UINT64 time2);
     XSI_DLLESPEC void xsi_generate_clock(xsiHandle design_handle, XSI_INT32 port_number,  XSI_UINT64 timeLow,  XSI_UINT64 timeHigh);



#ifdef  __cplusplus 
} 
#endif 

#endif 



