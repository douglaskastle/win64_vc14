@Echo off

cd freetype-2.5.3

set LIBDIR=%CD%\..\..

:: /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:libc.lib /NODEFAULTLIB:msvcrt.lib /NODEFAULTLIB:msvcmrt.lib /NODEFAULTLIB:msvcurt.lib /NODEFAULTLIB:msvcrtd.lib

:: create build directory
mkdir build\windows
cd build\windows

cmake -G "Visual Studio 12 2013 Win64" ..\..\ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\freetype ^
 -DCMAKE_CXX_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_CXX_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_RELEASE_POSTFIX:STRING="2ST" ^
 -DCMAKE_DEBUG_POSTFIX:STRING="2ST_d" ^
 -DCMAKE_BUILD_TYPE=Release
 
msbuild /p:Configuration=Release /t:Build  /p:Platform="x64" freetype.sln
msbuild /p:Configuration=Release /t:Build  /p:Platform="x64" INSTALL.vcxproj


cd ..\..

:: create build directory
mkdir build\windows_debug
cd build\windows_debug

cmake -G "Visual Studio 12 2013 Win64" ..\..\ ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\freetype ^
 -DCMAKE_CXX_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_CXX_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_MODULE_LINKER_FLAGS="/NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:libc.lib /NODEFAULTLIB:msvcrt.lib /NODEFAULTLIB:msvcmrt.lib /NODEFAULTLIB:msvcurt.lib /NODEFAULTLIB:msvcrtd.lib" ^
 -DCMAKE_RELEASE_POSTFIX:STRING="2ST" ^
 -DCMAKE_DEBUG_POSTFIX:STRING="2ST_d" ^
 -DCMAKE_BUILD_TYPE=Debug
 
msbuild /p:Configuration=Debug /t:Build  /p:Platform="x64" freetype.sln
msbuild /p:Configuration=Debug /t:Build  /p:Platform="x64" INSTALL.vcxproj
 
 cd ..\..\..
