echo off

call env.bat

set filename=logMain1
set ext=exe
rem set ext=obj

del /q %filename%.cfg %filename%_opt.obj 

rem %NASM_PATH%\nasm.exe -f win32 -o demo_test1.obj demo_test1.asm 

if exist "%IDA_PATH%\idaq.exe" (
    echo Using IDA to recover CFG
    %BIN_DESCEND_PATH%\bin_descend_wrapper.py  -d -i=%filename%.%ext%  -entry-symbol=_main 
	rem %BIN_DESCEND_PATH%\bin_descend_wrapper.py -b -d -func-map="%STD_DEFS%" -entry-symbol=_doCommand1 -i=%filename%.exe
	
	%CFG_TO_BC_PATH%\cfg_to_bc.exe -i  %filename%.cfg  -o %filename%.bc  -ignore-unsupported     
	rem -driver=_doCommand1,raw,return,C

	rem -driver=start,raw,return,C
	
	rem %LLVM_PATH%\opt.exe -O3 -o %filename%_opt.bc %filename%.bc
	
	rem echo "NOW"
	
	rem %LLVM_PATH%\llvm-dis.exe %filename%_opt.bc
	rem %LLVM_PATH%\llvm-dis.exe %filename%.bc
	
	rem %LLVM_PATH%\llc.exe  -filetype=obj %filename%_opt.bc
	rem cl /Zi /nologo /ENTRY _driver__main %filename%_opt.obj
	rem demo_driver1.exe
) else (
    echo "haaaaa"
	rem exit
)


