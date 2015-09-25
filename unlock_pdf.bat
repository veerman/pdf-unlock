@echo off
set /p encrypted_pdf_path="PDF File (use full path eg. C:\Users\You\Desktop\locked.pdf): "
REM echo %encrypted_pdf_path%

call set decrypted_pdf_path=%%encrypted_pdf_path:.pdf=.unencrypted.pdf%%
echo.
echo Attempting to save %decrypted_pdf_path%
echo.

REM set gs_path_x86=
REM for /f "delims=" %%a in ('where /R "c:\Program Files (x86)" gswin*c.exe') do @set gs_path_x86=%%a
REM echo x86 %gs_path_x86%

set gs_path_x64=
for /f "delims=" %%a in ('where /R "c:\Program Files" gswin*c.exe') do @set gs_path_x64=%%a
REM echo x64 %gs_path_x64%

set gs_path=%gs_path_x64%

"%gs_path%" -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="%decrypted_pdf_path%" -c .setpdfwrite -f "%encrypted_pdf_path%"

echo Done.