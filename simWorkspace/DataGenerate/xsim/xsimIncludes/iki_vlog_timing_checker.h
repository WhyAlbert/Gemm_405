// This is merely broken out from iki.h
// Do not use this as a normal header file
// Must not include any other header file

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only


#ifndef IKI_VLOG_TIMING_CHECKER_H
#define IKI_VLOG_TIMING_CHECKER_H



IKI_DLLESPEC int US(iki_vlog_get_transition_edge_index0_length1)(char* oldValue, char* newValue);
//IKI_DLLESPEC int US(iki_vlog_get_encoded_transition_edge)(char* oldValue, int oldSI, char* newValue, int newSI, int length);
IKI_DLLESPEC int US(iki_vlog_get_transition_edge)(char* oldValue, int oldSI, char* newValue, int newSI, int length);
IKI_DLLESPEC int US(iki_vlog_get_transition_edge_from_encoded_edge)(int encoded_edge);
IKI_DLLESPEC int64 US(iki_return_smallest_delay_in_array)(int numOfDelays, char *delayBuffer);
IKI_DLLESPEC int64 US(iki_compute_specify_delay_signal)(char* signal, char* driver,  unsigned setback, unsigned noOfDrivenBits);
IKI_DLLESPEC int64 US(iki_compute_specify_delay_net)(char* net_prop , char* driver_prop ,  unsigned setback, unsigned noOfDrivenBits);
#endif






