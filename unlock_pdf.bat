@echo off
rem Windows Batch Script created by Steve Veerman

set /p locked_pdf_path="PDF File (use full path eg. C:\Users\You\Desktop\locked.pdf): "
echo.
rem echo %locked_pdf_path%

if not exist %locked_pdf_path% (
	echo PDF File not found. Please try again.
	goto done
)

call set unlocked_pdf_path=%%locked_pdf_path:.pdf=.unlocked.pdf%%
echo Saving %unlocked_pdf_path%

set gs_exec="gswin*c.exe"

set gs_path_x64=
for /f "delims=" %%a in ('where /R "c:\Program Files" %gs_exec%') do @set gs_path_x64=%%a
rem echo x64 path="%gs_path_x64%"

if not ["%gs_path_x64%"] == [""] (
	rem echo is x64
	set gs_path=%gs_path_x64%
	goto run_gs
)

set gs_path_x86=
for /f "delims=" %%a in ('where /R "c:\Program Files (x86)" %gs_exec%') do @set gs_path_x86=%%a
rem echo x86 path="%gs_path_x86%"

if not ["%gs_path_x86%"] == [""] (
	rem echo is x86
	set gs_path=%gs_path_x86%
	goto run_gs
)

echo %gs_exec% not found. Please install Ghostscript.
goto done

:run_gs
rem echo Working...
"%gs_path%" -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=%unlocked_pdf_path% -c .setpdfwrite -f %locked_pdf_path%
goto done

:done
echo.
echo Done.
echo.
pause
exit /B