﻿cmake_minimum_required(VERSION 3.16.6)
project(FreeImage VERSION 3.18.0)

set(CMAKE_C_STANDARD 90)
set(CMAKE_CXX_STANDARD 98)

# LibJXR
add_compile_definitions(DISABLE_PERF_MEASUREMENT)
# OpenJPEG
add_compile_definitions(OPJ_STATIC)
if(WIN32)
	# __declspec(dllexport) or __declspec(dllimport) for LibRawLite
	add_compile_definitions(LIBRAW_NODLL)
	# __declspec(dllexport) or __declspec(dllimport) for FreeImage
	add_compile_definitions(FREEIMAGE_EXPORTS)
else()
	# LibRaw
	add_compile_definitions(NO_LCMS)
	# LibJXR
	add_compile_definitions(__ANSI__)
endif()

##set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
#if(MSVC)
#    set(CMAKE_DEBUG_POSTFIX "d")
#endif()

#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${CMAKE_CXX_COMPILER_VERSION}_install)










if(NOT CMAKE_BUILD_TYPE)
    # set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif(NOT CMAKE_BUILD_TYPE)

# set(CMAKE_AUTOUIC ON)
# set(CMAKE_AUTOMOC ON)
# set(CMAKE_AUTORCC ON)
# set(CMAKE_INCLUDE_CURRENT_DIR ON)

# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS  Network Xml Multimedia MultimediaWidgets Widgets )# Widgets #WebEngineWidgets WebChannel Widgets LinguistTools Core Gui  WebEngineWidgets PrintSupport
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Network Xml Multimedia MultimediaWidgets Widgets)





if (CMAKE_SYSTEM_NAME MATCHES "Linux")
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
elseif (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
else ()
    MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")


if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    # using Clang
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    # using GCC
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    # using Intel C++
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    # using Visual Studio C++
endif ()

set(CMAKE_PREFIX_PATH "D:\\Qt\\Qt5.12.12;D:\\binWin10\\LLVM;D:\\binWin10\\llvm-mingw-20220906-msvcrt-x86_64")

message(STATUS "------------> CMAKE_SYSTEM_NAME= ${CMAKE_SYSTEM_NAME}")

set(toolChainMy "MinGWTCh")
#if (CMAKE_GENERATOR MATCHES "MinGW")
#  message(STATUS "CMake is using MinGW")
#  set(toolChainMy "MinGWTCh")
#elseif (CMAKE_GENERATOR MATCHES "MSVC")
#  set(toolChainMy "MSVCTCh")
#elseif (CMAKE_GENERATOR MATCHES "CYGWIN")
#  set(toolChainMy "CYGWINTCh")
#elseif (CMAKE_GENERATOR MATCHES "GNU")
#  set(toolChainMy "GNUTCh")
#else ()
#  message(STATUS "CMake is not kowning what.")
#  set(toolChainMy "UnkownTCh")
#endif ()
#cmake.exe -G "MinGW Makefiles"
message(STATUS "_________________________________")
# 判断CMAKE_C_COMPILER的类型
if (CMAKE_C_COMPILER MATCHES "gcc")
    if (CMAKE_SYSTEM_NAME MATCHES "Windows")
        message(STATUS "Cygwin/MinGW Compiler")
        set(toolChainMy "CygwinMinGWTCh")
    elseif (CMAKE_SYSTEM_NAME MATCHES "Linux")
        MESSAGE(STATUS "GNU Compiler")
        set(toolChainMy "GNUTCh")
    else ()
        message(STATUS "other Compiler")
        set(toolChainMy "OtherTCh")
    endif ()
elseif (CMAKE_C_COMPILER MATCHES "clang")
    message(STATUS "Clang Compiler")
    set(toolChainMy "ClangTCh")
elseif (CMAKE_C_COMPILER MATCHES "cl")
    message(STATUS "MSVC Compiler")
    set(toolChainMy "")
else ()
    message(STATUS "Unknown Compiler")
    set(toolChainMy "UnknownTCh")
endif ()
message(STATUS "_________________________________")
if (0)
    include(CheckCXXSourceCompiles)
    set(CMAKE_REQUIRED_DEFINITIONS -D_MSC_VER)
    CHECK_CXX_SOURCE_COMPILES("
#include <Windows.h>
int main() {
    #ifdef _MSC_VER
    // 如果定义了_MSC_VER，这里的代码将会被编译
    #endif
    return 0;
}" MSCRT_SUPPORTED)

    if (MSCRT_SUPPORTED)
        message(STATUS "MS CRT is supported")
    else ()
        message(STATUS "MS CRT is not supported")
    endif ()
    message(STATUS "_________________________________")
endif ()

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
    MESSAGE(STATUS "current platform: Linux ")
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
    MESSAGE(STATUS "current platform: Windows")
elseif (CMAKE_SYSTEM_NAME MATCHES "Darwin")
    MESSAGE(STATUS "current platform: Mac OS X")
else ()
    MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")

cmake_host_system_information(RESULT PRETTY_NAME QUERY DISTRIB_PRETTY_NAME)
message(STATUS "${PRETTY_NAME}")

cmake_host_system_information(RESULT DISTRO QUERY DISTRIB_INFO)
foreach (VAR IN LISTS DISTRO)
    message(STATUS "${VAR}=`${${VAR}}`")
endforeach ()



if(0)
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MT")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
    if (MSVC)
        set(CompilerFlags
            CMAKE_CXX_FLAGS
            CMAKE_CXX_FLAGS_DEBUG
            CMAKE_CXX_FLAGS_RELEASE
            CMAKE_C_FLAGS
            CMAKE_C_FLAGS_DEBUG
            CMAKE_C_FLAGS_RELEASE
        )
    foreach(CompilerFlag ${CompilerFlags})
        string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
    endforeach()
endif(MSVC)
endif( )

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_DEBUG_POSTFIX "d")
endif ()


if (MSVC)
    # set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(CMAKE_DEBUG_POSTFIX "d")
    elseif (CMAKE_BUILD_TYPE STREQUAL "Release")
        set(CMAKE_DEBUG_POSTFIX "")
    endif ()
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /utf-8")
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fexec-charset=utf-8 /source-charset=utf-8 /execution-charset=utf-8")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fexec-charset=utf-8 /source-charset:utf-8 /execution-charset:utf-8")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fexec-charset=GBK")
    #set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -fexec-charset=GBK")
else ()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexec-charset=utf-8")
endif ()
#link_directories(${CMAKE_BINARY_DIR} )

message("CMAKE_C_COMPILER = ${CMAKE_C_COMPILER}")
message("CMAKE_C_COMPILER_VERSION = ${CMAKE_C_COMPILER_VERSION}")
message("CMAKE_C_COMPILER_ID = ${CMAKE_C_COMPILER_ID}")
message("CMAKE_CXX_PLATFORM_ID = ${CMAKE_CXX_PLATFORM_ID}")
message("CMAKE_CXX_COMPILER_TARGET = ${CMAKE_CXX_COMPILER_TARGET}")
message("CMAKE_CXX_COMPILER_AR = ${CMAKE_CXX_COMPILER_AR}")
message("CMAKE_C_COMPILER_ABI = ${CMAKE_C_COMPILER_ABI}")
message("CMAKE_C_COMPILER_TARGET = ${CMAKE_C_COMPILER_TARGET}")
message("CMAKE_HOST_SYSTEM = ${CMAKE_HOST_SYSTEM}")
message("CMAKE_HOST_SYSTEM_NAME = ${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_VS_PLATFORM_NAME = ${CMAKE_VS_PLATFORM_NAME}")
message("CMAKE_VS_PLATFORM_TOOLSET = ${CMAKE_VS_PLATFORM_TOOLSET}")
message("CMAKE_CXX_COMPILER_VERSION = ${CMAKE_CXX_COMPILER_VERSION}")
#message("CMAKE_CXX_COMPILER_TARGET= ${CMAKE_CXX_COMPILER_TARGET}")
message("CMAKE_CXX_COMPILER_ABI= ${CMAKE_CXX_COMPILER_ABI}")
message("CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN= ${CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN}")
message("CMAKE_CXX_COMPILER_ID= ${CMAKE_CXX_COMPILER_ID}")
message("CMAKE_CXX_COMPILER_ARCHITECTURE_ID= ${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}")
#message("CMAKE_HOST_SYSTEM_NAME= ${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_Fortran_FORMAT= ${CMAKE_Fortran_FORMAT}")
message("CMAKE_Fortran_COMPILER= ${CMAKE_Fortran_COMPILER}")
message("CMAKE_Fortran_COMPILER_VERSION= ${CMAKE_Fortran_COMPILER_VERSION}")
message("CMAKE_Fortran_COMPILER_ID= ${CMAKE_Fortran_COMPILER_ID}")
message("CMAKE_GENERATOR= ${CMAKE_GENERATOR}")
message("CMAKE_SYSTEM_NAME= ${CMAKE_SYSTEM_NAME}")
message("{QT_VERSION_MAJOR}=${QT_VERSION_MAJOR}")
message("{QT_VERSION_MAJORREVISION}=${QT_VERSION_MAJORREVISION}")
#MajorRevision
message("{QT_VERSION_MINOR}=${QT_VERSION_MINOR}")
message("{QT_VERSION_MINORREVISION}=${QT_VERSION_MINORREVISION}")
#MinorRevision
message("{QT_VERSION_PATCH}=${QT_VERSION_PATCH}")
message("{QT_VERSION_BUILD}=${QT_VERSION_BUILD}")
#Build


# 改变安装路径可以使用下面的语句，Unix: "/usr/local", Windows: "c:/Program Files/${PROJECT_NAME}" 为默认值，所有的DESTINATION均以此目录为根目录
# set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/mymath)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_HOST_SYSTEM}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_install)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_install)
#set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_${CMAKE_HOST_SYSTEM_NAME}_${CMAKE_CXX_PLATFORM_ID}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_install)
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_QT_${QT_VERSION_MAJOR}_${QT_VERSION_MINOR}_${QT_VERSION_PATCH}_${toolChainMy}_${CMAKE_C_COMPILER_ID}_${CMAKE_C_COMPILER_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}_install)
# CMAKE_SYSTEM_NAME  toolChainMy

set(OUTPUT_DIR_KENT ${CMAKE_SOURCE_DIR}/../${PROJECT_NAME}_${PROJECT_VERSION}_QT_${QT_VERSION_MAJOR}_${QT_VERSION_MINOR}_${QT_VERSION_PATCH}_${toolChainMy}_${CMAKE_C_COMPILER_ID}_${CMAKE_C_COMPILER_VERSION}_${CMAKE_CXX_COMPILER_ID}_${CMAKE_CXX_COMPILER_VERSION}_${CMAKE_Fortran_COMPILER_ID}_${CMAKE_Fortran_COMPILER_VERSION}_CXX_${CMAKE_CXX_STANDARD}_${CMAKE_SYSTEM_PROCESSOR}_${CMAKE_CXX_COMPILER_ARCHITECTURE_ID}_bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIR_KENT})

# install
include(CMakePackageConfigHelpers)

# aux_source_directory(./  sourceAll )
# file(GLOB_RECURSE  ./*.cpp  all_source_files )
#file(GLOB_RECURSE sources  *.cpp *.h)
#file(GLOB_RECURSE sourcesBuild  build/*.cpp  )
#list(REMOVE_ITEM sources ${sourcesBuild})















# copy the directores from Source/Makefile.srcs
include_directories(./ Source Source/Metadata Source/FreeImageToolkit Source/LibJPEG Source/LibPNG Source/LibTIFF4 Source/ZLib Source/LibOpenJPEG Source/OpenEXR Source/OpenEXR/Half Source/OpenEXR/Iex Source/OpenEXR/IlmImf Source/OpenEXR/IlmThread Source/OpenEXR/Imath Source/OpenEXR/IexMath Source/LibRawLite Source/LibRawLite/dcraw Source/LibRawLite/internal Source/LibRawLite/libraw Source/LibRawLite/src Source/LibWebP Source/LibJXR Source/LibJXR/common/include Source/LibJXR/image/sys Source/LibJXR/jxrgluelib)

# copy the path of source files from Source/Makefile.srcs
set(SOURCE_FILES ./Source/FreeImage/BitmapAccess.cpp ./Source/FreeImage/ColorLookup.cpp ./Source/FreeImage/ConversionRGBA16.cpp ./Source/FreeImage/ConversionRGBAF.cpp ./Source/FreeImage/FreeImage.cpp ./Source/FreeImage/FreeImageC.c ./Source/FreeImage/FreeImageIO.cpp ./Source/FreeImage/GetType.cpp ./Source/FreeImage/LFPQuantizer.cpp ./Source/FreeImage/MemoryIO.cpp ./Source/FreeImage/PixelAccess.cpp ./Source/FreeImage/J2KHelper.cpp ./Source/FreeImage/MNGHelper.cpp ./Source/FreeImage/Plugin.cpp ./Source/FreeImage/PluginBMP.cpp ./Source/FreeImage/PluginCUT.cpp ./Source/FreeImage/PluginDDS.cpp ./Source/FreeImage/PluginEXR.cpp ./Source/FreeImage/PluginG3.cpp ./Source/FreeImage/PluginGIF.cpp ./Source/FreeImage/PluginHDR.cpp ./Source/FreeImage/PluginICO.cpp ./Source/FreeImage/PluginIFF.cpp ./Source/FreeImage/PluginJ2K.cpp ./Source/FreeImage/PluginJNG.cpp ./Source/FreeImage/PluginJP2.cpp ./Source/FreeImage/PluginJPEG.cpp ./Source/FreeImage/PluginJXR.cpp ./Source/FreeImage/PluginKOALA.cpp ./Source/FreeImage/PluginMNG.cpp ./Source/FreeImage/PluginPCD.cpp ./Source/FreeImage/PluginPCX.cpp ./Source/FreeImage/PluginPFM.cpp ./Source/FreeImage/PluginPICT.cpp ./Source/FreeImage/PluginPNG.cpp ./Source/FreeImage/PluginPNM.cpp ./Source/FreeImage/PluginPSD.cpp ./Source/FreeImage/PluginRAS.cpp ./Source/FreeImage/PluginRAW.cpp ./Source/FreeImage/PluginSGI.cpp ./Source/FreeImage/PluginTARGA.cpp ./Source/FreeImage/PluginTIFF.cpp ./Source/FreeImage/PluginWBMP.cpp ./Source/FreeImage/PluginWebP.cpp ./Source/FreeImage/PluginXBM.cpp ./Source/FreeImage/PluginXPM.cpp ./Source/FreeImage/PSDParser.cpp ./Source/FreeImage/TIFFLogLuv.cpp ./Source/FreeImage/Conversion.cpp ./Source/FreeImage/Conversion16_555.cpp ./Source/FreeImage/Conversion16_565.cpp ./Source/FreeImage/Conversion24.cpp ./Source/FreeImage/Conversion32.cpp ./Source/FreeImage/Conversion4.cpp ./Source/FreeImage/Conversion8.cpp ./Source/FreeImage/ConversionFloat.cpp ./Source/FreeImage/ConversionRGB16.cpp ./Source/FreeImage/ConversionRGBF.cpp ./Source/FreeImage/ConversionType.cpp ./Source/FreeImage/ConversionUINT16.cpp ./Source/FreeImage/Halftoning.cpp ./Source/FreeImage/tmoColorConvert.cpp ./Source/FreeImage/tmoDrago03.cpp ./Source/FreeImage/tmoFattal02.cpp ./Source/FreeImage/tmoReinhard05.cpp ./Source/FreeImage/ToneMapping.cpp ./Source/FreeImage/NNQuantizer.cpp ./Source/FreeImage/WuQuantizer.cpp ./Source/FreeImage/CacheFile.cpp ./Source/FreeImage/MultiPage.cpp ./Source/FreeImage/ZLibInterface.cpp ./Source/Metadata/Exif.cpp ./Source/Metadata/FIRational.cpp ./Source/Metadata/FreeImageTag.cpp ./Source/Metadata/IPTC.cpp ./Source/Metadata/TagConversion.cpp ./Source/Metadata/TagLib.cpp ./Source/Metadata/XTIFF.cpp ./Source/FreeImageToolkit/Background.cpp ./Source/FreeImageToolkit/BSplineRotate.cpp ./Source/FreeImageToolkit/Channels.cpp ./Source/FreeImageToolkit/ClassicRotate.cpp ./Source/FreeImageToolkit/Colors.cpp ./Source/FreeImageToolkit/CopyPaste.cpp ./Source/FreeImageToolkit/Display.cpp ./Source/FreeImageToolkit/Flip.cpp ./Source/FreeImageToolkit/JPEGTransform.cpp ./Source/FreeImageToolkit/MultigridPoissonSolver.cpp ./Source/FreeImageToolkit/Rescale.cpp ./Source/FreeImageToolkit/Resize.cpp Source/LibJPEG/jaricom.c Source/LibJPEG/jcapimin.c Source/LibJPEG/jcapistd.c Source/LibJPEG/jcarith.c Source/LibJPEG/jccoefct.c Source/LibJPEG/jccolor.c Source/LibJPEG/jcdctmgr.c Source/LibJPEG/jchuff.c Source/LibJPEG/jcinit.c Source/LibJPEG/jcmainct.c Source/LibJPEG/jcmarker.c Source/LibJPEG/jcmaster.c Source/LibJPEG/jcomapi.c Source/LibJPEG/jcparam.c Source/LibJPEG/jcprepct.c Source/LibJPEG/jcsample.c Source/LibJPEG/jctrans.c Source/LibJPEG/jdapimin.c Source/LibJPEG/jdapistd.c Source/LibJPEG/jdarith.c Source/LibJPEG/jdatadst.c Source/LibJPEG/jdatasrc.c Source/LibJPEG/jdcoefct.c Source/LibJPEG/jdcolor.c Source/LibJPEG/jddctmgr.c Source/LibJPEG/jdhuff.c Source/LibJPEG/jdinput.c Source/LibJPEG/jdmainct.c Source/LibJPEG/jdmarker.c Source/LibJPEG/jdmaster.c Source/LibJPEG/jdmerge.c Source/LibJPEG/jdpostct.c Source/LibJPEG/jdsample.c Source/LibJPEG/jdtrans.c Source/LibJPEG/jerror.c Source/LibJPEG/jfdctflt.c Source/LibJPEG/jfdctfst.c Source/LibJPEG/jfdctint.c Source/LibJPEG/jidctflt.c Source/LibJPEG/jidctfst.c Source/LibJPEG/jidctint.c Source/LibJPEG/jmemmgr.c Source/LibJPEG/jmemnobs.c Source/LibJPEG/jquant1.c Source/LibJPEG/jquant2.c Source/LibJPEG/jutils.c Source/LibJPEG/transupp.c Source/LibPNG/png.c Source/LibPNG/pngerror.c Source/LibPNG/pngget.c Source/LibPNG/pngmem.c Source/LibPNG/pngpread.c Source/LibPNG/pngread.c Source/LibPNG/pngrio.c Source/LibPNG/pngrtran.c Source/LibPNG/pngrutil.c Source/LibPNG/pngset.c Source/LibPNG/pngtrans.c Source/LibPNG/pngwio.c Source/LibPNG/pngwrite.c Source/LibPNG/pngwtran.c Source/LibPNG/pngwutil.c Source/LibTIFF4/tif_aux.c Source/LibTIFF4/tif_close.c Source/LibTIFF4/tif_codec.c Source/LibTIFF4/tif_color.c Source/LibTIFF4/tif_compress.c Source/LibTIFF4/tif_dir.c Source/LibTIFF4/tif_dirinfo.c Source/LibTIFF4/tif_dirread.c Source/LibTIFF4/tif_dirwrite.c Source/LibTIFF4/tif_dumpmode.c Source/LibTIFF4/tif_error.c Source/LibTIFF4/tif_extension.c Source/LibTIFF4/tif_fax3.c Source/LibTIFF4/tif_fax3sm.c Source/LibTIFF4/tif_flush.c Source/LibTIFF4/tif_getimage.c Source/LibTIFF4/tif_jpeg.c Source/LibTIFF4/tif_luv.c Source/LibTIFF4/tif_lzma.c Source/LibTIFF4/tif_lzw.c Source/LibTIFF4/tif_next.c Source/LibTIFF4/tif_ojpeg.c Source/LibTIFF4/tif_open.c Source/LibTIFF4/tif_packbits.c Source/LibTIFF4/tif_pixarlog.c Source/LibTIFF4/tif_predict.c Source/LibTIFF4/tif_print.c Source/LibTIFF4/tif_read.c Source/LibTIFF4/tif_strip.c Source/LibTIFF4/tif_swab.c Source/LibTIFF4/tif_thunder.c Source/LibTIFF4/tif_tile.c Source/LibTIFF4/tif_version.c Source/LibTIFF4/tif_warning.c Source/LibTIFF4/tif_write.c Source/LibTIFF4/tif_zip.c Source/ZLib/adler32.c Source/ZLib/compress.c Source/ZLib/crc32.c Source/ZLib/deflate.c Source/ZLib/gzclose.c Source/ZLib/gzlib.c Source/ZLib/gzread.c Source/ZLib/gzwrite.c Source/ZLib/infback.c Source/ZLib/inffast.c Source/ZLib/inflate.c Source/ZLib/inftrees.c Source/ZLib/trees.c Source/ZLib/uncompr.c Source/ZLib/zutil.c Source/LibOpenJPEG/bio.c Source/LibOpenJPEG/cio.c Source/LibOpenJPEG/dwt.c Source/LibOpenJPEG/event.c Source/LibOpenJPEG/function_list.c Source/LibOpenJPEG/image.c Source/LibOpenJPEG/invert.c Source/LibOpenJPEG/j2k.c Source/LibOpenJPEG/jp2.c Source/LibOpenJPEG/mct.c Source/LibOpenJPEG/mqc.c Source/LibOpenJPEG/openjpeg.c Source/LibOpenJPEG/opj_clock.c Source/LibOpenJPEG/pi.c Source/LibOpenJPEG/raw.c Source/LibOpenJPEG/t1.c Source/LibOpenJPEG/t2.c Source/LibOpenJPEG/tcd.c Source/LibOpenJPEG/tgt.c Source/OpenEXR/IexMath/IexMathFpu.cpp Source/OpenEXR/IlmImf/b44ExpLogTable.cpp Source/OpenEXR/IlmImf/ImfAcesFile.cpp Source/OpenEXR/IlmImf/ImfAttribute.cpp Source/OpenEXR/IlmImf/ImfB44Compressor.cpp Source/OpenEXR/IlmImf/ImfBoxAttribute.cpp Source/OpenEXR/IlmImf/ImfChannelList.cpp Source/OpenEXR/IlmImf/ImfChannelListAttribute.cpp Source/OpenEXR/IlmImf/ImfChromaticities.cpp Source/OpenEXR/IlmImf/ImfChromaticitiesAttribute.cpp Source/OpenEXR/IlmImf/ImfCompositeDeepScanLine.cpp Source/OpenEXR/IlmImf/ImfCompressionAttribute.cpp Source/OpenEXR/IlmImf/ImfCompressor.cpp Source/OpenEXR/IlmImf/ImfConvert.cpp Source/OpenEXR/IlmImf/ImfCRgbaFile.cpp Source/OpenEXR/IlmImf/ImfDeepCompositing.cpp Source/OpenEXR/IlmImf/ImfDeepFrameBuffer.cpp Source/OpenEXR/IlmImf/ImfDeepImageStateAttribute.cpp Source/OpenEXR/IlmImf/ImfDeepScanLineInputFile.cpp Source/OpenEXR/IlmImf/ImfDeepScanLineInputPart.cpp Source/OpenEXR/IlmImf/ImfDeepScanLineOutputFile.cpp Source/OpenEXR/IlmImf/ImfDeepScanLineOutputPart.cpp Source/OpenEXR/IlmImf/ImfDeepTiledInputFile.cpp Source/OpenEXR/IlmImf/ImfDeepTiledInputPart.cpp Source/OpenEXR/IlmImf/ImfDeepTiledOutputFile.cpp Source/OpenEXR/IlmImf/ImfDeepTiledOutputPart.cpp Source/OpenEXR/IlmImf/ImfDoubleAttribute.cpp Source/OpenEXR/IlmImf/ImfDwaCompressor.cpp Source/OpenEXR/IlmImf/ImfEnvmap.cpp Source/OpenEXR/IlmImf/ImfEnvmapAttribute.cpp Source/OpenEXR/IlmImf/ImfFastHuf.cpp Source/OpenEXR/IlmImf/ImfFloatAttribute.cpp Source/OpenEXR/IlmImf/ImfFloatVectorAttribute.cpp Source/OpenEXR/IlmImf/ImfFrameBuffer.cpp Source/OpenEXR/IlmImf/ImfFramesPerSecond.cpp Source/OpenEXR/IlmImf/ImfGenericInputFile.cpp Source/OpenEXR/IlmImf/ImfGenericOutputFile.cpp Source/OpenEXR/IlmImf/ImfHeader.cpp Source/OpenEXR/IlmImf/ImfHuf.cpp Source/OpenEXR/IlmImf/ImfInputFile.cpp Source/OpenEXR/IlmImf/ImfInputPart.cpp Source/OpenEXR/IlmImf/ImfInputPartData.cpp Source/OpenEXR/IlmImf/ImfIntAttribute.cpp Source/OpenEXR/IlmImf/ImfIO.cpp Source/OpenEXR/IlmImf/ImfKeyCode.cpp Source/OpenEXR/IlmImf/ImfKeyCodeAttribute.cpp Source/OpenEXR/IlmImf/ImfLineOrderAttribute.cpp Source/OpenEXR/IlmImf/ImfLut.cpp Source/OpenEXR/IlmImf/ImfMatrixAttribute.cpp Source/OpenEXR/IlmImf/ImfMisc.cpp Source/OpenEXR/IlmImf/ImfMultiPartInputFile.cpp Source/OpenEXR/IlmImf/ImfMultiPartOutputFile.cpp Source/OpenEXR/IlmImf/ImfMultiView.cpp Source/OpenEXR/IlmImf/ImfOpaqueAttribute.cpp Source/OpenEXR/IlmImf/ImfOutputFile.cpp Source/OpenEXR/IlmImf/ImfOutputPart.cpp Source/OpenEXR/IlmImf/ImfOutputPartData.cpp Source/OpenEXR/IlmImf/ImfPartType.cpp Source/OpenEXR/IlmImf/ImfPizCompressor.cpp Source/OpenEXR/IlmImf/ImfPreviewImage.cpp Source/OpenEXR/IlmImf/ImfPreviewImageAttribute.cpp Source/OpenEXR/IlmImf/ImfPxr24Compressor.cpp Source/OpenEXR/IlmImf/ImfRational.cpp Source/OpenEXR/IlmImf/ImfRationalAttribute.cpp Source/OpenEXR/IlmImf/ImfRgbaFile.cpp Source/OpenEXR/IlmImf/ImfRgbaYca.cpp Source/OpenEXR/IlmImf/ImfRle.cpp Source/OpenEXR/IlmImf/ImfRleCompressor.cpp Source/OpenEXR/IlmImf/ImfScanLineInputFile.cpp Source/OpenEXR/IlmImf/ImfStandardAttributes.cpp Source/OpenEXR/IlmImf/ImfStdIO.cpp Source/OpenEXR/IlmImf/ImfStringAttribute.cpp Source/OpenEXR/IlmImf/ImfStringVectorAttribute.cpp Source/OpenEXR/IlmImf/ImfSystemSpecific.cpp Source/OpenEXR/IlmImf/ImfTestFile.cpp Source/OpenEXR/IlmImf/ImfThreading.cpp Source/OpenEXR/IlmImf/ImfTileDescriptionAttribute.cpp Source/OpenEXR/IlmImf/ImfTiledInputFile.cpp Source/OpenEXR/IlmImf/ImfTiledInputPart.cpp Source/OpenEXR/IlmImf/ImfTiledMisc.cpp Source/OpenEXR/IlmImf/ImfTiledOutputFile.cpp Source/OpenEXR/IlmImf/ImfTiledOutputPart.cpp Source/OpenEXR/IlmImf/ImfTiledRgbaFile.cpp Source/OpenEXR/IlmImf/ImfTileOffsets.cpp Source/OpenEXR/IlmImf/ImfTimeCode.cpp Source/OpenEXR/IlmImf/ImfTimeCodeAttribute.cpp Source/OpenEXR/IlmImf/ImfVecAttribute.cpp Source/OpenEXR/IlmImf/ImfVersion.cpp Source/OpenEXR/IlmImf/ImfWav.cpp Source/OpenEXR/IlmImf/ImfZip.cpp Source/OpenEXR/IlmImf/ImfZipCompressor.cpp Source/OpenEXR/Imath/ImathBox.cpp Source/OpenEXR/Imath/ImathColorAlgo.cpp Source/OpenEXR/Imath/ImathFun.cpp Source/OpenEXR/Imath/ImathMatrixAlgo.cpp Source/OpenEXR/Imath/ImathRandom.cpp Source/OpenEXR/Imath/ImathShear.cpp Source/OpenEXR/Imath/ImathVec.cpp Source/OpenEXR/Iex/IexBaseExc.cpp Source/OpenEXR/Iex/IexThrowErrnoExc.cpp Source/OpenEXR/Half/half.cpp Source/OpenEXR/IlmThread/IlmThread.cpp Source/OpenEXR/IlmThread/IlmThreadMutex.cpp Source/OpenEXR/IlmThread/IlmThreadPool.cpp Source/OpenEXR/IlmThread/IlmThreadSemaphore.cpp Source/OpenEXR/IexMath/IexMathFloatExc.cpp Source/LibRawLite/internal/dcraw_common.cpp Source/LibRawLite/internal/dcraw_fileio.cpp Source/LibRawLite/internal/demosaic_packs.cpp Source/LibRawLite/src/libraw_c_api.cpp Source/LibRawLite/src/libraw_cxx.cpp Source/LibRawLite/src/libraw_datastream.cpp Source/LibWebP/src/dec/alpha_dec.c Source/LibWebP/src/dec/buffer_dec.c Source/LibWebP/src/dec/frame_dec.c Source/LibWebP/src/dec/idec_dec.c Source/LibWebP/src/dec/io_dec.c Source/LibWebP/src/dec/quant_dec.c Source/LibWebP/src/dec/tree_dec.c Source/LibWebP/src/dec/vp8l_dec.c Source/LibWebP/src/dec/vp8_dec.c Source/LibWebP/src/dec/webp_dec.c Source/LibWebP/src/demux/anim_decode.c Source/LibWebP/src/demux/demux.c Source/LibWebP/src/dsp/alpha_processing.c Source/LibWebP/src/dsp/alpha_processing_mips_dsp_r2.c Source/LibWebP/src/dsp/alpha_processing_neon.c Source/LibWebP/src/dsp/alpha_processing_sse2.c Source/LibWebP/src/dsp/alpha_processing_sse41.c Source/LibWebP/src/dsp/cost.c Source/LibWebP/src/dsp/cost_mips32.c Source/LibWebP/src/dsp/cost_mips_dsp_r2.c Source/LibWebP/src/dsp/cost_sse2.c Source/LibWebP/src/dsp/cpu.c Source/LibWebP/src/dsp/dec.c Source/LibWebP/src/dsp/dec_clip_tables.c Source/LibWebP/src/dsp/dec_mips32.c Source/LibWebP/src/dsp/dec_mips_dsp_r2.c Source/LibWebP/src/dsp/dec_msa.c Source/LibWebP/src/dsp/dec_neon.c Source/LibWebP/src/dsp/dec_sse2.c Source/LibWebP/src/dsp/dec_sse41.c Source/LibWebP/src/dsp/enc.c Source/LibWebP/src/dsp/enc_avx2.c Source/LibWebP/src/dsp/enc_mips32.c Source/LibWebP/src/dsp/enc_mips_dsp_r2.c Source/LibWebP/src/dsp/enc_msa.c Source/LibWebP/src/dsp/enc_neon.c Source/LibWebP/src/dsp/enc_sse2.c Source/LibWebP/src/dsp/enc_sse41.c Source/LibWebP/src/dsp/filters.c Source/LibWebP/src/dsp/filters_mips_dsp_r2.c Source/LibWebP/src/dsp/filters_msa.c Source/LibWebP/src/dsp/filters_neon.c Source/LibWebP/src/dsp/filters_sse2.c Source/LibWebP/src/dsp/lossless.c Source/LibWebP/src/dsp/lossless_enc.c Source/LibWebP/src/dsp/lossless_enc_mips32.c Source/LibWebP/src/dsp/lossless_enc_mips_dsp_r2.c Source/LibWebP/src/dsp/lossless_enc_msa.c Source/LibWebP/src/dsp/lossless_enc_neon.c Source/LibWebP/src/dsp/lossless_enc_sse2.c Source/LibWebP/src/dsp/lossless_enc_sse41.c Source/LibWebP/src/dsp/lossless_mips_dsp_r2.c Source/LibWebP/src/dsp/lossless_msa.c Source/LibWebP/src/dsp/lossless_neon.c Source/LibWebP/src/dsp/lossless_sse2.c Source/LibWebP/src/dsp/rescaler.c Source/LibWebP/src/dsp/rescaler_mips32.c Source/LibWebP/src/dsp/rescaler_mips_dsp_r2.c Source/LibWebP/src/dsp/rescaler_msa.c Source/LibWebP/src/dsp/rescaler_neon.c Source/LibWebP/src/dsp/rescaler_sse2.c Source/LibWebP/src/dsp/ssim.c Source/LibWebP/src/dsp/ssim_sse2.c Source/LibWebP/src/dsp/upsampling.c Source/LibWebP/src/dsp/upsampling_mips_dsp_r2.c Source/LibWebP/src/dsp/upsampling_msa.c Source/LibWebP/src/dsp/upsampling_neon.c Source/LibWebP/src/dsp/upsampling_sse2.c Source/LibWebP/src/dsp/upsampling_sse41.c Source/LibWebP/src/dsp/yuv.c Source/LibWebP/src/dsp/yuv_mips32.c Source/LibWebP/src/dsp/yuv_mips_dsp_r2.c Source/LibWebP/src/dsp/yuv_neon.c Source/LibWebP/src/dsp/yuv_sse2.c Source/LibWebP/src/dsp/yuv_sse41.c Source/LibWebP/src/enc/alpha_enc.c Source/LibWebP/src/enc/analysis_enc.c Source/LibWebP/src/enc/backward_references_cost_enc.c Source/LibWebP/src/enc/backward_references_enc.c Source/LibWebP/src/enc/config_enc.c Source/LibWebP/src/enc/cost_enc.c Source/LibWebP/src/enc/filter_enc.c Source/LibWebP/src/enc/frame_enc.c Source/LibWebP/src/enc/histogram_enc.c Source/LibWebP/src/enc/iterator_enc.c Source/LibWebP/src/enc/near_lossless_enc.c Source/LibWebP/src/enc/picture_csp_enc.c Source/LibWebP/src/enc/picture_enc.c Source/LibWebP/src/enc/picture_psnr_enc.c Source/LibWebP/src/enc/picture_rescale_enc.c Source/LibWebP/src/enc/picture_tools_enc.c Source/LibWebP/src/enc/predictor_enc.c Source/LibWebP/src/enc/quant_enc.c Source/LibWebP/src/enc/syntax_enc.c Source/LibWebP/src/enc/token_enc.c Source/LibWebP/src/enc/tree_enc.c Source/LibWebP/src/enc/vp8l_enc.c Source/LibWebP/src/enc/webp_enc.c Source/LibWebP/src/mux/anim_encode.c Source/LibWebP/src/mux/muxedit.c Source/LibWebP/src/mux/muxinternal.c Source/LibWebP/src/mux/muxread.c Source/LibWebP/src/utils/bit_reader_utils.c Source/LibWebP/src/utils/bit_writer_utils.c Source/LibWebP/src/utils/color_cache_utils.c Source/LibWebP/src/utils/filters_utils.c Source/LibWebP/src/utils/huffman_encode_utils.c Source/LibWebP/src/utils/huffman_utils.c Source/LibWebP/src/utils/quant_levels_dec_utils.c Source/LibWebP/src/utils/quant_levels_utils.c Source/LibWebP/src/utils/random_utils.c Source/LibWebP/src/utils/rescaler_utils.c Source/LibWebP/src/utils/thread_utils.c Source/LibWebP/src/utils/utils.c Source/LibJXR/image/decode/decode.c Source/LibJXR/image/decode/JXRTranscode.c Source/LibJXR/image/decode/postprocess.c Source/LibJXR/image/decode/segdec.c Source/LibJXR/image/decode/strdec.c Source/LibJXR/image/decode/strdec_x86.c Source/LibJXR/image/decode/strInvTransform.c Source/LibJXR/image/decode/strPredQuantDec.c Source/LibJXR/image/encode/encode.c Source/LibJXR/image/encode/segenc.c Source/LibJXR/image/encode/strenc.c Source/LibJXR/image/encode/strenc_x86.c Source/LibJXR/image/encode/strFwdTransform.c Source/LibJXR/image/encode/strPredQuantEnc.c Source/LibJXR/image/sys/adapthuff.c Source/LibJXR/image/sys/image.c Source/LibJXR/image/sys/strcodec.c Source/LibJXR/image/sys/strPredQuant.c Source/LibJXR/image/sys/strTransform.c Source/LibJXR/jxrgluelib/JXRGlue.c Source/LibJXR/jxrgluelib/JXRGlueJxr.c Source/LibJXR/jxrgluelib/JXRGluePFC.c Source/LibJXR/jxrgluelib/JXRMeta.c)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES DEBUG_POSTFIX "d")

#set(${PROJECT_NAME}_INCLUDE_DIR_TT ${CMAKE_CURRENT_SOURCE_DIR}/Source)
#target_include_directories(${PROJECT_NAME} PUBLIC ${${PROJECT_NAME}_INCLUDE_DIR_TT})

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/Source  ${CMAKE_SOURCE_DIR}/include )


#message( "{${PROJECT_NAME}_INCLUDE_DIR_TT} = ${${PROJECT_NAME}_INCLUDE_DIR_TT}"  )
#message( "{${PROJECT_NAME}_INCLUDE_DIRT} = ${${PROJECT_NAME}_INCLUDE_DIR}"  )


add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/TestAPI)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Wrapper/FreeImagePlus)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Wrapper/FreeImagePlus/test)

enable_testing ()
if(WIN32)
	set(FreeImageTest_Working_DIR "${FreeImageTest_BINARY_DIR}/$<CONFIG>/")
	set(FreeImagePlusTest_Working_DIR "${FreeImagePlusTest_BINARY_DIR}/$<CONFIG>/")
else()
	set(FreeImageTest_Working_DIR "${FreeImageTest_BINARY_DIR}/")
	set(FreeImagePlusTest_Working_DIR "${FreeImagePlusTest_BINARY_DIR}/")
endif()
add_test (NAME FreeImagetTest COMMAND FreeImageTest WORKING_DIRECTORY ${FreeImageTest_Working_DIR})
add_test (NAME FreeImagetPlusTest COMMAND FreeImagePlusTest WORKING_DIRECTORY ${FreeImagePlusTest_Working_DIR})


# install
include(CMakePackageConfigHelpers)

#//--------------------------------------------------------------

target_include_directories(FreeImage PRIVATE  ${CMAKE_SOURCE_DIR}/include)
set_target_properties(FreeImage PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/include/FreeImage.h)




#//---MyMath---------------------------------------------
# 写入库的版本信息

write_basic_package_version_file(
    FreeImageConfigVersion.cmake
    VERSION ${PACKAGE_VERSION}
    COMPATIBILITY AnyNewerVersion
)

# 将库文件，可执行文件，头文件安装到指定目录
install(TARGETS FreeImage
    EXPORT FreeImageTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    PUBLIC_HEADER DESTINATION  include
)

# 将库的相关信息输出为MyMathConfig.cmake，供find_package查找
install(EXPORT FreeImageTargets
    FILE   FreeImageTargets.cmake
    NAMESPACE FreeImage::
    DESTINATION lib/cmake/FreeImage
)

configure_file( FreeImageConfig.cmake.in  FreeImage/FreeImageConfig.cmake @ONLY)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/FreeImage/FreeImageConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/FreeImageConfigVersion.cmake"
    DESTINATION lib/cmake/FreeImage
)


