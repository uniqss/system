set INSTALL_PATH=..\install\redis6379\

set ROOT_DIR=%~dp0

cd %INSTALL_PATH%

.\redis-server --service-stop --service-name redis6379
.\redis-server --service-uninstall --service-name redis6379

cd %ROOT_DIR%

rd /S /Q %INSTALL_PATH%
