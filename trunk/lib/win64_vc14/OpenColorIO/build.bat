@Echo off

cd OpenColorIO-1.0.9

set LIBDIR=%CD%\..\..

:: create build directory

echo Libdir set to: %LIBDIR%

mkdir build\windows
cd build\windows

cmake -G "NMake Makefiles" ..\.. ^
 -DCMAKE_INSTALL_PREFIX=%LIBDIR%\OpenColorIO ^
 -DCMAKE_CXX_FLAGS_DEBUG="/D_DEBUG /MTd /Zi /Ob0 /Od /RTC1" ^
 -DCMAKE_CXX_FLAGS_MINSIZEREL="/MT /O1 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /D NDEBUG" ^
 -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="/MT /Zi /O2 /Ob1 /D NDEBUG" ^
 -DCMAKE_CXX_STANDARD_LIBRARIES:STRING="kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib psapi.lib" ^
 -DBoost_COMPILER:STRING="-vc120" ^
 -DBoost_USE_MULTITHREADED=ON ^
 -DBoost_USE_STATIC_LIBS=ON ^
 -DBoost_USE_STATIC_RUNTIME=ON ^
 -DBOOST_ROOT=%LIBDIR%\boost ^
 -DOCIO_USE_BOOST_PTR=ON ^
 -DOCIO_BUILD_STATIC=OFF ^
 -DOCIO_BUILD_SHARED=ON ^
 -DOCIO_BUILD_APPS=OFF ^
 -DOCIO_BUILD_PYGLUE=OFF ^
 -DOCIO_BUILD_NUKE=OFF ^
 -DCMAKE_BUILD_TYPE=Release

nmake
nmake install

cd ../../..
mkdir bin
copy /Y lib\OpenColorIO.dll bin\

