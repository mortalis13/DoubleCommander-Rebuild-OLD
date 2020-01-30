echo off

cd source

echo Deleting *.o
for /R %%a in (*.o) do del %%a

echo Deleting *.ppu
for /R %%a in (*.ppu) do del %%a

echo Deleting *.bak
for /R %%a in (*.bak) do del %%a

echo Deleting *.obj
for /R %%a in (*.obj) do del %%a

echo Deleting *.or
for /R %%a in (*.or) do del %%a

echo Deleting *.exe
for /R %%a in (*.exe) do del %%a

echo Deleting *.dbg
for /R %%a in (*.dbg) do del %%a

echo Deleting units\i386-win32-win32\*
for /R %%a in (units\i386-win32-win32\*) do del %%a

echo.
echo finish
