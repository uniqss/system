set INSTALL_PATH=..\install\mysql5733\

set ROOT_DIR=%~dp0

7z x ..\zips\mysql-5.7.33-winx64.7z -o%INSTALL_PATH% -aoa
cd %INSTALL_PATH%
set CURR_DIR=%~dp0
echo %CURR_DIR%


echo [mysqld]> my.ini
echo #设置3306端口>> my.ini
echo port = 3306>>my.ini
echo # 设置mysql的安装目录>>my.ini
echo basedir=%CURR_DIR%>>my.ini
echo # 设置mysql数据库的数据的存放目录>>my.ini
echo datadir=%CURR_DIR%/data>>my.ini
echo log-error="%CURR_DIR%/logs/error.log">>my.ini
echo general_log_file="%CURR_DIR%/logs/mysql.log">>my.ini
echo general_log=on>>my.ini
echo slow_query_log=on>>my.ini
echo slow_query_log_file="%CURR_DIR%/logs/slowquery.log">>my.ini
echo # 允许最大连接数>>my.ini
echo max_connections=200>>my.ini
echo # 服务端使用的字符集默认为8比特编码的latin1字符集>>my.ini
echo character-set-server=utf8mb4>>my.ini
echo # 创建新表时将使用的默认存储引擎>>my.ini
echo default-storage-engine=INNODB>>my.ini
echo # 默认使用“mysql_native_password”插件认证>>my.ini
echo #mysql_native_password>>my.ini
echo default_authentication_plugin=mysql_native_password>>my.ini
echo [mysql]>>my.ini
echo # 设置mysql客户端默认字符集>>my.ini
echo default-character-set=utf8mb4>>my.ini
echo [client]>>my.ini
echo # 设置mysql客户端连接服务端时默认使用的端口>>my.ini
echo port=3306>>my.ini
echo default-character-set=utf8mb4>>my.ini

mkdir data
mkdir logs



cd bin
mysqld -install


netstat -ano|findstr 3306

cd %ROOT_DIR%

runas /noprofile /user:mymachine\administrator mysql5733_reg.bat

pause
