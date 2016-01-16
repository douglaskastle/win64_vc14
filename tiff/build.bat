@Echo off

set LIBDIR=%CD%\..

cd tiff-4.0.6

:: create build directory
mkdir build\windows
cd build\windows

cmake -G "NMake Makefiles" ..\..\ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\tiff ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DZLIB_LIBRARY=%LIBDIR%\zlib\lib\libz_st.lib ^
 -DZLIB_INCLUDE_DIR=%LIBDIR%\zlib\include ^
 -DPNG_STATIC=ON ^
 -DCMAKE_BUILD_TYPE=Release

nmake
nmake install

 cd ..\..\..
 
 
