set INSTALL_PATH=..\install\mysql5733\

set ROOT_DIR=%~dp0
cd /D %ROOT_DIR%

7z x ..\zips\mysql-5.7.33-winx64.7z -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%
set CURR_DIR=%CD%
echo %CURR_DIR%
SET CURR_DIR_MODIFIED=%CURR_DIR:\=/%
echo %CURR_DIR_MODIFIED%
SET CURR_DIR=%CURR_DIR_MODIFIED%

echo [mysqld]> my.ini
echo port = 3306>>my.ini
echo basedir=%CURR_DIR%>>my.ini
echo datadir=%CURR_DIR%/data>>my.ini
echo log-error="%CURR_DIR%/logs/error.log">>my.ini
echo general_log_file="%CURR_DIR%/logs/mysql.log">>my.ini
echo general_log=on>>my.ini
echo slow_query_log=on>>my.ini
echo slow_query_log_file="%CURR_DIR%/logs/slowquery.log">>my.ini
echo max_connections=200>>my.ini
echo character-set-server=utf8mb4>>my.ini
echo default-storage-engine=INNODB>>my.ini
echo #mysql_native_password>>my.ini
echo default_authentication_plugin=mysql_native_password>>my.ini
echo [mysql]>>my.ini
echo default-character-set=utf8mb4>>my.ini
echo [client]>>my.ini
echo port=3306>>my.ini
echo default-character-set=utf8mb4>>my.ini

mkdir data
mkdir logs



cd bin
mysqld -install

mysqld --initialize --console

net start mysql



@echo off
echo alter user 'root'@'localhost' identified by 'toorex';
echo commit;
echo flush privileges;
echo exit;
@echo on



mysql -uroot -p


cd ..


cd %ROOT_DIR%

runas /noprofile /user:mymachine\administrator mysql5733_reg.bat

pause
