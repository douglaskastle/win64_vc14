@Echo off

set LIBDIR=%CD%\..
set PNGDIR=%LIBDIR%\png\libpng-1.6.9

call :Build_Debug

call :Build

cd %LIBDIR%\png

exit /b

:Build

cd %PNGDIR%
 :: create build directory
mkdir build\windows
cd build\windows

cmake -G "NMake Makefiles" ..\..\ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\png ^
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
 
cd %LIBDIR%\png
move /Y lib\libpng16_static.lib lib\libpng16.lib
 
goto:eof

:Build_Debug

cd %PNGDIR%

:: create build directory
mkdir build\windows_dbg
cd build\windows_dbg

cmake -G "NMake Makefiles" ..\..\ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\png ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DZLIB_LIBRARY=%LIBDIR%\zlib\lib\libz_st_d.lib ^
 -DZLIB_INCLUDE_DIR=%LIBDIR%\zlib\include ^
 -DPNG_STATIC=ON ^
 -DCMAKE_BUILD_TYPE=Debug

nmake
nmake install

cd %LIBDIR%\png
move /Y lib\libpng16_staticd.lib lib\libpng16d.lib

goto:eof

 
 


 cd ..\..\..
 
