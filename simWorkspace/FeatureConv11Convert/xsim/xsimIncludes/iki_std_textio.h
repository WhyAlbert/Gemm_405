// $Id: $
// Copyright 2009-2017, Xilinx Inc.  All rights reserved.

// DO not include iki.h in any of the iki_<blah>.h files as client should include
// iki.h always and iki.h should include iki_<blah>.h . Treat iki.h as the one big Kernel
// interface. The splitting of functions in separate iki_<blah>.h files is for convenience only

#if defined(_WIN32)
#ifdef IKI_EXPORT
#define STD_TEXIO_DLLESPEC __declspec(dllexport)
#else
#define STD_TEXIO_DLLESPEC __declspec(dllimport)
#endif
#else
#ifndef STD_TEXIO_DLLESPEC
#define STD_TEXIO_DLLESPEC
#endif
#endif

STD_TEXIO_DLLESPEC void US(iki_std_textio_writeline)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write1)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write2)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write3)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write4)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write5)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write6)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write7)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_tee)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_write8)(char* dp, char* ip, char* block);

STD_TEXIO_DLLESPEC void US(iki_std_textio_readline)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read1)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read2)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read3)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read4)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read5)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read6)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read7)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read8)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read9)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read10)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read11)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read12)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read13)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read14)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read15)(char* dp, char* ip, char* block);
STD_TEXIO_DLLESPEC void US(iki_std_textio_read16)(char* dp, char* ip, char* block);



