FROM ymphp
LABEL maintainer="<musicsnap@163.com>"

#安装依赖
RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        openssl \
        libssl-dev
#安装gd
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

#配置yaf
RUN pecl install yaf-3.2.3 && docker-php-ext-enable yaf

RUN pecl install swoole-4.5.2 && docker-php-ext-enable swoole

#安装redis
RUN pecl install redis-4.3.0 && docker-php-ext-enable redis

#安装mongodb
RUN pecl install mongodb-1.7.4 && docker-php-ext-enable mongodb

#安装memcached
RUN apt-get install libsasl2-dev
WORKDIR /root
#下面抱错 make[1]: *** [Makefile:5832: clients/memflush.o] Error 1
#ADD libmemcached-1.0.18.tar.gz/ /root/libmemcached
#RUN cd libmemcached/libmemcached-1.0.18 && ls -l && ./configure --disable-sasl && make && make install
#RUN pecl install memcached-3.1.3 && docker-php-ext-enable memcached

#RUN apt-get install wget
#RUN wget http://pecl.php.net/get/memcache-3.0.8.tgz && tar -zxvf memcache-3.0.8.tgz && cd memcache-3.0.8 && phpize && ./configure --enable-memcache && make && make install
#RUN docker-php-ext-enable memcache

#安装mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring

#安装xdebug
RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug

#安装配置文件
COPY ./php.ini /usr/local/etc/php/
