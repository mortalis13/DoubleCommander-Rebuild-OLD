@echo Clean up output directory
@del /Q /S units\i386-win32-win32\*.*
@del /Q /S units\x86_64-win64-win32\*.*
@del /Q src\*.*~
@del /Q src\*.~*
@del /Q doublecmd.dbg
@del /Q doublecmd.zdli
@del /Q doublecmd*.exe
@del /Q doublecmd*.old

@echo Remove generated help files
@del /Q doc\en\dev-help\*.*

@echo Clean up tools output directories
@del /Q /S tools\lib\*.*
@del /Q tools\extractdwrflnfo.exe

@echo Clean up plugins output directories
rem @del /Q /S plugins\*.dsx
rem @del /Q /S plugins\*.w?x

rem @del /Q /S plugins\dsx\DSXLocate\lib\*.*

rem @del /Q /S plugins\wcx\cpio\lib\*.*
rem @del /Q /S plugins\wcx\deb\lib\*.*
rem @del /Q /S plugins\wcx\lzma\lib\*.*
rem @del /Q /S plugins\wcx\rpm\lib\*.*
rem @del /Q /S plugins\wcx\sevenzip\lib\*.*
rem @del /Q /S plugins\wcx\unbz2\lib\*.*
rem @del /Q /S plugins\wcx\unrar\lib\*.*
rem @del /Q /S plugins\wcx\zip\lib\*.*

rem @del /Q /S plugins\wdx\deb_wdx\lib\*.*
rem @del /Q /S plugins\wdx\rpm_wdx\lib\*.*
rem @del /Q /S plugins\wdx\svn_wdx\lib\*.*
rem @del /Q /S plugins\wdx\xpi_wdx\lib\*.*

rem @del /Q /S plugins\wfx\ftp\lib\*.*
rem @del /Q /S plugins\wfx\gvfs\lib\*.*
rem @del /Q /S plugins\wfx\samba\lib\*.*
rem @del /Q /S plugins\wfx\sample\lib\*.*

rem @del /Q /S plugins\wlx\simplewlx\lib\*.*
rem @del /Q /S plugins\wlx\WlxMplayer\lib\*.*

rem @echo Remove backup files
rem @del /Q /S plugins\*.*~
rem @del /Q /S plugins\*.bak

@echo Clean up components output directories

@del /Q /S components\chsdet\lib\*.*
@del /Q /S components\CmdLine\lib\*.*
@del /Q /S components\dcpcrypt\lib\*.*
@del /Q /S components\doublecmd\lib\*.*
@del /Q /S components\gifanim\lib\*.*
@del /Q /S components\KASToolBar\lib\*.*
@del /Q /S components\multithreadprocs\lib\*.*
@del /Q /S components\viewer\lib\*.*
@del /Q /S components\synunihighlighter\lib\*.*

@echo Done.