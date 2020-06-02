FROM ymphp
LABEL maintainer="<musicsnap@163.com>"

#安装yaf
#ADD ./yaf-3.0.8.tar.gz /root/yaf-3.0.8
#WORKDIR /root/yaf-3.0.8
#RUN phpize
#RUN ./configure --with-php-config=/usr/local/bin/php-config
#RUN make && make install

#RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
#    && tar xfz /tmp/redis.tar.gz \
#    && rm -r /tmp/redis.tar.gz \
#    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
#    && docker-php-ext-install redis

#安装依赖
RUN apt-get install -y \
        zlib1g-dev \
        libz-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev
#安装gd
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

#配置yaf
#RUN docker-php-ext-enable yaf
RUN pecl install yaf-3.0.8 && docker-php-ext-enable yaf

#安装redis
RUN pecl install redis-4.3.0 && docker-php-ext-enable redis

#安装mongodb
RUN pecl install mongodb-1.7.4 && docker-php-ext-enable mongodb

#安装memcached
RUN pecl install memcached-3.1.5 && docker-php-ext-enable memcached

#安装mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install pdo
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring

#安装xdebug
RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug

#安装配置文件
COPY ./php.ini /usr/local/etc/php/
