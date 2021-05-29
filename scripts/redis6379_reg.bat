set INSTALL_PATH=..\install\redis6379\

set CURR_DIR=%~dp0

7z x ..\zips\Redis-x64-5.0.10.zip -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%
set R6379PATH=%~dp0
echo %R6379PATH%



set "env=HKLM\System\CurrentControlSet\Control\Session Manager\Environment"

for /f "tokens=2*" %%I in (
     'reg query "%env%" /v Path ^| findstr /i "\<Path\>"'
) do setx /m PATH "%%J;%CD%"

pause
