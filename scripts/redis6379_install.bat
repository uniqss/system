set INSTALL_PATH=..\install\redis6379\

set ROOT_DIR=%~dp0

7z x ..\zips\Redis-x64-5.0.10.7z -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%
set CURR_DIR=%~dp0
echo %CURR_DIR%

.\redis-server --service-install redis.windows-service.conf --service-name redis6379 --loglevel verbose  --port 6379

.\redis-server --service-start --service-name redis6379


netstat -ano|findstr 6379

cd %ROOT_DIR%

runas /noprofile /user:mymachine\administrator redis6379_reg.bat

pause
