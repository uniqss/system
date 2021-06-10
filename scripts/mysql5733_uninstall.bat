set INSTALL_PATH=..\install\mysql5733\

set ROOT_DIR=%~dp0

cd %INSTALL_PATH%

cd bin

net stop mysql

mysqld --remove

cd %ROOT_DIR%

rd /S /Q %INSTALL_PATH%
