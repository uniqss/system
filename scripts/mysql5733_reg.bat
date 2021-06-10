set INSTALL_PATH=..\install\mysql5733\

set ROOT_DIR=%~dp0

cd /D %ROOT_DIR%

7z x ..\zips\mysql-5.7.33-winx64.7z -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%\bin
set CURR_DIR=%~dp0
echo %CURR_DIR%



set "env=HKLM\System\CurrentControlSet\Control\Session Manager\Environment"

for /f "tokens=2*" %%I in (
     'reg query "%env%" /v Path ^| findstr /i "\<Path\>"'
) do setx /m PATH "%%J;%CD%"

pause
