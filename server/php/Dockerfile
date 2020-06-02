FROM php:7.4-fpm
LABEL maintainer="<musicsnap@163.com>"
#切换至国内镜像
COPY sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y net-tools procps curl wget vim telnet cron