#!/bin/bash
year=`date +%Y`
month=`date +%m`
day=`date +%d`
hour=`date +%H`
minute=`date +%M`
logs_backup_path="/usr/local/openresty/nginx/logs/logs_backup"               #日志存储路径
logs_path="/usr/local/openresty/nginx/logs/"                                                             #要切割的日志路径
logs_access="host.access"                                                                            #要切割的日志
logs_error="error"
#pid_path="/usr/local/nginx/logs/nginx.pid"                                                 #nginx的pid

[ -d $logs_backup_path ]||mkdir -p $logs_backup_path
rq=`date +%Y-%m-%d_%H-%M`
mv ${logs_path}${logs_access}.log ${logs_backup_path}/${logs_access}_${rq}.log
#mv ${logs_path}${logs_error}.log ${logs_backup_path}/${logs_error}_${rq}.log
kill -USR1 $(cat /usr/local/openresty/nginx/logs/nginx.pid)