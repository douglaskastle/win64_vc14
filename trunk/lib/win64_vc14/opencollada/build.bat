@Echo off

:: we should not pollute the global scope
setlocal

set OPENCOLLADA_SOURCE="https://github.com/KhronosGroup/OpenCOLLADA.git"
set OPENCOLLADA_REPO_UID="3335ac164e68b2512a40914b14c74db260e6ff7d"

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (set bit=x64) ELSE (set bit=x86)


call :CheckPath

if not exist opencollada (
    echo getting source
    call :PrepareSource
)

set LIBDIR=%CD%\..

cd opencollada

set RET_DIR=%LIBDIR%\opencollada
:: create build directory
echo Libdir set to: %LIBDIR%

call :Build_Debug

cd %RET_DIR%

cd opencollada
call :Build

cd %RET_DIR%


exit /b


:Build
mkdir build\windows
cd build\windows

cmake -G "Visual Studio 12 2013 Win64" ..\.. ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\opencollada ^
 -DCMAKE_CXX_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_CXX_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_STANDARD_LIBRARIES:STRING="kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib psapi.lib" ^
 -DUSE_STATIC=ON
if NOT errorlevel 0 (
    echo cmake failed
    exit /b
)

call msbuild INSTALL.vcxproj /p:Configuration=Release

goto:eof


:Build_Debug

mkdir build\windows_debug
cd build\windows_debug

cmake -G "Visual Studio 12 2013 Win64" ..\.. ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\opencollada\debug ^
 -DCMAKE_CXX_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_CXX_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_C_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_C_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_STANDARD_LIBRARIES:STRING="kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib psapi.lib" ^
 -DUSE_STATIC=ON
if NOT errorlevel 0 (
    echo cmake failed
    exit /b
)

call msbuild INSTALL.vcxproj /p:Configuration=Debug

goto:eof




:PrepareSource
git clone %OPENCOLLADA_SOURCE% opencollada
cd opencollada
git checkout %OPENCOLLADA_REPO_UID%
cd ..
pause
if VISUALSTUDIOVERSION GEW 12.0 (
    :: MSVC 2013 needs patch for min/max 
    echo Patching for MSVC 2013
    patch -i msvc_2013.patch -p0
)
pause
goto:eof

:CheckPath
echo Checking for git in the path
diff >nul 2>&1
if errorlevel 9009 (
    echo diff is not in the current path, it needs to be 
    if %bit%==x64 (
        set "PATH=%PATH%;%PROGRAMFILES(X86)%\Git\bin"
    ) else (
        set "PATH=%PATH%;%PROGRAMFILES%\Git\bin"
    )
    diff >nul 2>&1
    if errorlevel 9009 (
    echo please install msys git
    exit /b
    )
) 
echo We got git/diff/patch etc
goto:eof

:Test_MSVC2013
echo Testing for cl Version 18
cl 2>&1 | findstr c:\"Version 18"
if errorlevel 0 (
echo found MSVC_VER 2013
set MSVC=2013
)
goto:eof






