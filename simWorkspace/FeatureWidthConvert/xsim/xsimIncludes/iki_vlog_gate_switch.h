// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

#ifndef IKI_VLOG_GATES_CHECKER_H
#define IKI_VLOG_GATES_CHECKER_H

//-------BEGIN: Verilog gate/switch functions: should we move this somewhere else----------------
    //n-input gates - non array versions
    IKI_DLLESPEC char *US(iki_vlog_AndGate)( char *aReturn, int noOfInputs, ...);      
    IKI_DLLESPEC char *US(iki_vlog_NandGate)( char *aReturn, int noOfInputs, ...); 
    IKI_DLLESPEC char *US(iki_vlog_OrGate)( char *aReturn, int noOfInputs, ...); 
    IKI_DLLESPEC char *US(iki_vlog_NorGate)( char *aReturn, int noOfInputs, ...); 
    IKI_DLLESPEC char *US(iki_vlog_XorGate)( char *aReturn, int noOfInputs, ...);
    IKI_DLLESPEC char *US(iki_vlog_XnorGate)( char *aReturn, int noOfInputs, ...); 
    //n-input gates - array versions
    IKI_DLLESPEC char *US(iki_vlog_andArrayGate)( char *aReturn, int lenRet, int noOfInputs, ... ); 
    IKI_DLLESPEC char *US(iki_vlog_nandArrayGate)( char *aReturn, int lenRet, int noOfInputs, ... ); 
    IKI_DLLESPEC char *US(iki_vlog_orArrayGate)(char *aReturn, int lenRet, int noOfInputs, ... ); 
    IKI_DLLESPEC char *US(iki_vlog_norArrayGate)( char *aReturn, int lenRet, int noOfInputs, ... ); 
    IKI_DLLESPEC char *US(iki_vlog_xorArrayGate)( char *aReturn, int lenRet, int noOfInputs, ... );   
    IKI_DLLESPEC char *US(iki_vlog_xnorArrayGate)(char *aReturn, int lenRet, int noOfInputs, ... ); 

    //n-output gate functions - non-array
    IKI_DLLESPEC char *US(iki_vlog_bufGate)( char *aReturn, const char *aX ); 
    IKI_DLLESPEC char *US(iki_vlog_notGate)( char *aReturn, const char *aX ); 
    //n-output -- array versions --
    IKI_DLLESPEC char *US(iki_vlog_bufArrayGate)( char *aReturn, int lenRet,const char *aX ); 
    IKI_DLLESPEC char *US(iki_vlog_notArrayGate)( char *aReturn, int lenRet,const char *aX ); 


    //enable gate types )(3 -state gates) - non array versions
    IKI_DLLESPEC char* US(iki_vlog_bufIf0Gate)( char *aReturn, const char *data, const char *control );
    IKI_DLLESPEC char* US(iki_vlog_bufIf1Gate)( char *aReturn, const char *data, const char *control );
    IKI_DLLESPEC char* US(iki_vlog_notIf0Gate)( char *aReturn, const char *data, const char *control );
    IKI_DLLESPEC char* US(iki_vlog_notIf1Gate)( char *aReturn, const char *data, const char *control );
    //enable gate types )(3 -state gates) - array versions
    IKI_DLLESPEC char *US(iki_vlog_bufIf0ArrayGate)( char *aReturn, int lenRet, const char *data, 
                                                 const char *control );
    IKI_DLLESPEC char *US(iki_vlog_bufIf1ArrayGate)( char *aReturn, int lenRet, const char *data,
                                                 const char *control );  
    IKI_DLLESPEC char *US(iki_vlog_notIf0ArrayGate)( char *aReturn, int lenRet, const char *data,
                                                 const char* control ); 
    IKI_DLLESPEC char *US(iki_vlog_notIf1ArrayGate)( char *aReturn, int lenRet, const char *data,
                                                 const char *control ); 


    //MOS Switches
    IKI_DLLESPEC char* US(iki_vlog_nmosSwitch)( char *aReturn, const char *data, const char* control );
    IKI_DLLESPEC char* US(iki_vlog_pmosSwitch)( char *aReturn, const char *data, const char *control );
    IKI_DLLESPEC char* US(iki_vlog_rnmosSwitch)( char *aReturn, const char* data, const char *control );
    IKI_DLLESPEC char* US(iki_vlog_rpmosSwitch)( char *aReturn, const char *data, const char *control );
    IKI_DLLESPEC char *US(iki_vlog_pmosORrpmosArraySwitch)( char *aReturn1, int lenRet, const char *data1, 
        const char *control1);
    IKI_DLLESPEC char *US(iki_vlog_nmosORrnmosArraySwitch)( char *aReturn1, int lenRet, const char *data1, 
        const char *control1);

    //-------End : Verilog gate/switch functions

    // Verilog UDPs
    IKI_DLLESPEC unsigned char US(iki_vlog_get_udp_edge)(char* oldValue, int oldSI, char* newValue, int newSI);
     IKI_DLLESPEC unsigned char US(iki_vlog_get_udp_edge_0_0)(char* oldValue,  char* newValue);                                                  
    IKI_DLLESPEC char US(iki_vlog_udp_matching)(char *udp_result, char *pWaitinfoProps, char *pUdpTableProps);
    IKI_DLLESPEC char US(iki_vlog_udp_matching_64)(char *udp_result, char *pWaitinfoProps, char *pUdpTableProps);
    IKI_DLLESPEC unsigned US(iki_hash)(unsigned long long  key, unsigned power);

#ifdef DEBUG_UDP
    IKI_DLLESPEC void US(iki_vlog_udp_print_wait_info_table)(char* udpWaitInfoProps);
#endif

#endif


