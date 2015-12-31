@Echo off

set LIBDIR=%CD%\..

cd zlib-1.2.8

call :Build

cd %LIBDIR%\zlib

exit /b

:Build
:: create build directory
mkdir build\windows
cd build\windows
cmake -G "NMake Makefiles" ../../ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\zlib ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_BUILD_TYPE=Release

nmake
nmake install


goto:eof


:Build_Debug
:: create build directory
mkdir build\windows_dbg
cd build\windows_dbg

cmake -G "NMake Makefiles" ../../ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\zlib ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_DEBUG_PREFIX:STRING="lib" ^
 -DCMAKE_DEBUG_POSTFIX:STRING="_st_d" ^
 -DCMAKE_BUILD_TYPE=Debug
 
 nmake
 nmake install
goto:eof
 
 
