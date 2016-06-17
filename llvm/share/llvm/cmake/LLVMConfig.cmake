# This file provides information and services to the final user.

set(LLVM_VERSION_MAJOR 3)
set(LLVM_VERSION_MINOR 4)
set(LLVM_PACKAGE_VERSION 3.4.2)

set(LLVM_COMMON_DEPENDS )

set_property( GLOBAL PROPERTY LLVM_LIBS "LLVMSupport;LLVMTableGen;LLVMCore;LLVMIRReader;LLVMCodeGen;LLVMSelectionDAG;LLVMAsmPrinter;LLVMBitReader;LLVMBitWriter;LLVMTransformUtils;LLVMInstrumentation;LLVMInstCombine;LLVMScalarOpts;LLVMipo;LLVMVectorize;LLVMObjCARCOpts;LLVMLinker;LLVMAnalysis;LLVMipa;LLVMLTO;LLVMMC;LLVMMCParser;LLVMMCDisassembler;LLVMObject;LLVMOption;LLVMDebugInfo;LLVMExecutionEngine;LLVMInterpreter;LLVMJIT;LLVMMCJIT;LLVMRuntimeDyld;LLVMTarget;LLVMX86CodeGen;LLVMX86AsmParser;LLVMX86Disassembler;LLVMX86AsmPrinter;LLVMX86Desc;LLVMX86Info;LLVMX86Utils;LLVMAsmParser;LTO;LTO_static")

set(LLVM_ALL_TARGETS AArch64;ARM;CppBackend;Hexagon;Mips;MSP430;NVPTX;PowerPC;R600;Sparc;SystemZ;X86;XCore)

set(LLVM_TARGETS_TO_BUILD X86)

set(LLVM_TARGETS_WITH_JIT X86;PowerPC;AArch64;ARM;Mips;SystemZ)


set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMSupport )
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMTableGen LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMCore LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMIRReader LLVMAsmParser;LLVMBitReader;LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMCodeGen LLVMAnalysis;LLVMCore;LLVMMC;LLVMObjCARCOpts;LLVMScalarOpts;LLVMSupport;LLVMTarget;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMSelectionDAG LLVMAnalysis;LLVMCodeGen;LLVMCore;LLVMMC;LLVMSupport;LLVMTarget;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMAsmPrinter LLVMAnalysis;LLVMCodeGen;LLVMCore;LLVMMC;LLVMMCParser;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMBitReader LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMBitWriter LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMTransformUtils LLVMAnalysis;LLVMCore;LLVMSupport;LLVMTarget;LLVMipa)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMInstrumentation LLVMAnalysis;LLVMCore;LLVMSupport;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMInstCombine LLVMAnalysis;LLVMCore;LLVMSupport;LLVMTarget;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMScalarOpts LLVMAnalysis;LLVMCore;LLVMInstCombine;LLVMSupport;LLVMTarget;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMipo LLVMAnalysis;LLVMCore;LLVMInstCombine;LLVMObjCARCOpts;LLVMScalarOpts;LLVMSupport;LLVMTarget;LLVMTransformUtils;LLVMVectorize;LLVMipa)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMVectorize LLVMAnalysis;LLVMCore;LLVMInstCombine;LLVMSupport;LLVMTarget;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMObjCARCOpts LLVMAnalysis;LLVMCore;LLVMSupport;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMLinker LLVMCore;LLVMSupport;LLVMTransformUtils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMAnalysis LLVMCore;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMipa LLVMAnalysis;LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMLTO LLVMAnalysis;LLVMBitReader;LLVMBitWriter;LLVMCore;LLVMLinker;LLVMMC;LLVMMCParser;LLVMScalarOpts;LLVMSupport;LLVMTarget;LLVMVectorize;LLVMipo)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMMC LLVMObject;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMMCParser LLVMMC;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMMCDisassembler LLVMMC;LLVMMCParser;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMObject LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMOption LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMDebugInfo LLVMObject;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMExecutionEngine LLVMCore;LLVMMC;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMInterpreter LLVMCodeGen;LLVMCore;LLVMExecutionEngine;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMJIT LLVMCodeGen;LLVMCore;LLVMExecutionEngine;LLVMMC;LLVMRuntimeDyld;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMMCJIT LLVMCore;LLVMExecutionEngine;LLVMJIT;LLVMRuntimeDyld;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMRuntimeDyld LLVMObject;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMTarget LLVMCore;LLVMMC;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86CodeGen LLVMAnalysis;LLVMAsmPrinter;LLVMCodeGen;LLVMCore;LLVMMC;LLVMSelectionDAG;LLVMSupport;LLVMTarget;LLVMX86AsmPrinter;LLVMX86Desc;LLVMX86Info;LLVMX86Utils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86AsmParser LLVMMC;LLVMMCParser;LLVMSupport;LLVMX86Desc;LLVMX86Info)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86Disassembler LLVMMC;LLVMSupport;LLVMX86Desc;LLVMX86Info)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86AsmPrinter LLVMMC;LLVMSupport;LLVMX86Utils)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86Desc LLVMMC;LLVMSupport;LLVMX86AsmPrinter;LLVMX86Info)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86Info LLVMMC;LLVMSupport;LLVMTarget)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMX86Utils LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LLVMAsmParser LLVMCore;LLVMSupport)
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LTO )
set_property(GLOBAL PROPERTY LLVMBUILD_LIB_DEPS_LTO_static )

set(TARGET_TRIPLE "x86_64-pc-win32")

set(LLVM_TOOLS_BINARY_DIR Z:/test_lib/blender_dependencies/Build2015_Release/build/llvm/src/external_llvm-build/bin)

set(LLVM_ENABLE_TERMINFO OFF)

set(LLVM_ENABLE_THREADS ON)

set(LLVM_ENABLE_ZLIB 0)

set(LLVM_NATIVE_ARCH X86)

set(LLVM_ENABLE_PIC ON)

set(HAVE_TERMINFO )
set(TERMINFO_LIBS )
set(HAVE_LIBDL )
set(HAVE_LIBPTHREAD )
set(HAVE_LIBZ )
set(LLVM_ON_UNIX 0)
set(LLVM_ON_WIN32 1)

set(LLVM_INSTALL_PREFIX "Z:/test_lib/blender_dependencies/Build2015_Release/Release/llvm")
set(LLVM_INCLUDE_DIRS ${LLVM_INSTALL_PREFIX}/include)
set(LLVM_LIBRARY_DIRS ${LLVM_INSTALL_PREFIX}/lib)
set(LLVM_DEFINITIONS "-D__STDC_LIMIT_MACROS" "-D__STDC_CONSTANT_MACROS")

# We try to include using the current setting of CMAKE_MODULE_PATH,
# which suppossedly was filled by the user with the directory where
# this file was installed:
include( LLVM-Config OPTIONAL RESULT_VARIABLE LLVMCONFIG_INCLUDED )

# If failed, we assume that this is an un-installed build:
if( NOT LLVMCONFIG_INCLUDED )
  set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}
    "Z:/test_lib/blender_dependencies/Build2015_Release/build/llvm/src/external_llvm/cmake/modules")
  include( LLVM-Config )
endif()

