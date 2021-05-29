set INSTALL_PATH=..\install\redis6379\

7z x ..\zips\Redis-x64-5.0.10.zip -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%
set R6379PATH=%~dp0
echo %R6379PATH%

.\redis-server --service-install redis.windows-service.conf --service-name redis6379 --loglevel verbose  --port 6379

.\redis-server --service-start --service-name redis6379


netstat -ano|findstr 6379
