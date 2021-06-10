set INSTALL_PATH=..\install\mysql5733\

cd %INSTALL_PATH%

cd bin
mysqld --remove

cd ..\..\scripts\

rd /S /Q %INSTALL_PATH%
