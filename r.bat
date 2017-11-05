
@echo off

rem add 'Silent' project profile with Lazarus to disable hints and warnings, activate 'silent' build in the :build method

set OS_TARGET=win64
rem set OS_TARGET=win32

if "%OS_TARGET%" == "win64" (
  set CPU_TARGET=x86_64
  set lazpath=e:\tools\lazarus-1.8.0
)
if "%OS_TARGET%" == "win32" (
  set CPU_TARGET=i386
  set lazpath=e:\tools\lazarus-1.8.0_32
)
set PATH=%lazpath%;%PATH%

echo Build params: %OS_TARGET%, %CPU_TARGET%, %lazpath%
if "%1"=="a" (
  pause
)

rem ---------------------------------

del /Q doublecmd.exe

if "%1"=="a" (
  call :all
)
if "%1"=="r" (
  call :rebuild
)
if "%1"=="p" (
  call :package
)
if "%1"=="" (
  call :build
)

call :run
goto:eof

rem ----------------------------------

:all
  echo all method
  call clean
  call components\build.bat
  call plugins\build.bat
  call :build
goto:eof

:rebuild
  echo rebuild method
  call clean
  call :build
goto:eof

:build
  echo build method
  lazbuild -q --bm=debug --os=%OS_TARGET% --cpu=%CPU_TARGET% src\doublecmd.lpi
  rem lazbuild -q --bm=silent --os=%OS_TARGET% --cpu=%CPU_TARGET% src\doublecmd.lpi
goto:eof

:package
  echo package method
  call clean
  lazbuild -q --bm=beta --os=%OS_TARGET% --cpu=%CPU_TARGET% src\doublecmd.lpi
goto:eof

:run
  echo run method
  if exist doublecmd.exe (
    start doublecmd.exe
  )
goto:eof
