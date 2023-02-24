// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
// Copyright 2017 Xilinx.  All rights reserved.


#ifndef ISIMK_SYSTEMC_DEF_H
#define ISIMK_SYSTEMC_DEF_H

/* Use to import a symbol into dll */
#if (defined(_MSC_VER) || defined(__MINGW32__) || defined(__CYGWIN__))
#define SYSTEMCLIB_IMP_DLLSPEC __declspec(dllimport)
#else
#define SYSTEMCLIB_IMP_DLLSPEC 
#endif

/* Use to export a symbol from dll */
#if (defined(_MSC_VER) || defined(__MINGW32__) || defined(__CYGWIN__))
#define SYSTEMCLIB_EXP_DLLSPEC __declspec(dllexport)
#else
#define SYSTEMCLIB_EXP_DLLSPEC 
#endif


typedef void (*funPtrTypeRegisterChannelIntCharp)(int, char*);
typedef void (*funPtrTypeRegisterChannelIntCharpInt)(int, char*, int);
typedef int (*funPtrTypeRegisterChannelRBool)();
typedef void (*funPtrTypeRegisterChannel)();
typedef void (*funPtrTypeRegisterChannelVoidp)(void*);
typedef char* (*funPtrTypeRegisterChannelRCharp)();
typedef int (*funPtrTypeRegisterChannelRBoolBool)(int);
typedef void (*funPtrTypeRegisterChannelIntp)(int*);
typedef int (*funPtrTypeRegisterChannelRInt)();
typedef const char* (*funPtrTypeRegisterChannelRCharpException)(char*);
typedef void (*funPtrTypeRegisterChannelCharp)(char*);
typedef int (*funPtrTypeRegisterChannelRIntCharp)(char*);
typedef void (*funPtrTypeDebugGetValueULLCharppUIntp)(unsigned long long, const char**, unsigned*);
typedef void (*funPtrTypeDebugSetValueULLCharpUInt)(unsigned long long, const char*, unsigned);
typedef void (*funPtrTypeXsimGetTraceFlagsULLUp)(unsigned long long , unsigned*);
typedef void  (*funPtrTypeXsimSetTraceFlagsULLU)(unsigned long long, unsigned);
typedef const char* (*funPtrTypeRegisterChannelRConstCharp)();

#endif




