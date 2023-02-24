/* 
 * File:   iki_bridge.h
 * Author: dliddell
 *
 * Created on May 8, 2012, 5:58 PM
 */

#ifndef IKI_BRIDGE_H
#define	IKI_BRIDGE_H
#ifndef US
#ifdef CC_CLANG
#define US(X) _##X
#else
#define US(X) X
#endif
#endif

#if defined(_WIN32)
#ifdef RDI_SIMBRIDGE_KERNEL_SOURCE
#define RDI_SIMBRIDGE_KERNEL_EXPORT __declspec(dllexport)
#else
#define RDI_SIMBRIDGE_KERNEL_EXPORT __declspec(dllimport)
#endif

#else
#define RDI_SIMBRIDGE_KERNEL_EXPORT
#endif

#ifdef  __cplusplus
extern "C" {
#endif
//US is define as "_" for  clang/Win64 flow in iki.h
    extern RDI_SIMBRIDGE_KERNEL_EXPORT void *US(isimBridge_getWdbWriter)();
    extern RDI_SIMBRIDGE_KERNEL_EXPORT void *US(isimBridge_getStandAloneWdbWriter)();

#ifdef  __cplusplus
}
#endif

#undef US
#endif	/* IKI_BRIDGE_H */



