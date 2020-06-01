FROM openresty/openresty
#apt-get更换国内镜像(阿里)
COPY sources.list /etc/apt/sources.list
#更新apt并安装cron
RUN apt-get update && apt-get install cron -y
#添加定时任务
COPY crontab /etc/crontab
#拷贝健康检查脚本
COPY healtycheck.sh /usr/local/healtycheck.sh
#拷贝日志切割脚本
COPY cutlogs.sh usr/local/cutlogs.sh
#拷贝入口脚本
COPY docker-entrypoint.sh /home/docker-entrypoint.sh
#提权
RUN chmod +x /home/docker-entrypoint.sh
RUN chmod +x /usr/local/healtycheck.sh
RUN chmod +x /usr/local/cutlogs.sh
CMD [""]
ENTRYPOINT /home/docker-entrypoint.sh
