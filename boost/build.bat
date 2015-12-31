@echo off

set LIBDIR=%CD%\..

set BOOST_VERSION=1.60.0
set BOOST_VERSION_NODOTS=1_60_0
set BOOST_SOURCE="http://sourceforge.net/projects/boost/files/boost/%BOOST_VERSION%/boost_%BOOST_VERSION_NODOTS%.tar.bz2/download"

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (set bit=x64) ELSE (set bit=x86)

cd boost_1_60_0

:: build
call bootstrap.bat

bjam -j4 architecture=x86 ^
 address-model=64 ^
 variant=debug ^
 link=static ^
 runtime-link=static ^
 threading=multi ^
 --with-filesystem ^
 --with-locale ^
 --with-thread ^
 --with-regex ^
 --with-system ^
 --with-date_time ^
 --with-wave ^
 --prefix=%CD%/.. ^
 install


bjam -j4 architecture=x86 ^
 address-model=64 ^
 variant=release ^
 link=static ^
 runtime-link=static ^
 threading=multi ^
 --with-filesystem ^
 --with-locale ^
 --with-thread ^
 --with-regex ^
 --with-system ^
 --with-date_time ^
 --with-wave ^
 --prefix=%CD%/.. ^
 install
 

 
:: copy files
:: mkdir ..\lib
:: mkdir ..\include\boost
:: xcopy /E /Y stage\lib  ..\lib
:: xcopy /E /Y boost ..\include\boost

cd %LIBDIR%\boost



