######
# See: https://hub.docker.com/_/php/
######

FROM php:7.4-fpm
#ENVREFRESH_DATE 2020-08-11 18:43:20
######
# You can install php extensions using docker-php-ext-install
######

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian-security buster/updates main' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib' >> /etc/apt/sources.list \
    #&& echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
    #&& echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
    #&& echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
    && apt-get update

RUN pecl list-channels && pecl update-channels 

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions xdebug memcached memcache mongodb mcrypt yaml \
           solr xhprof gd pdo_mysql pdo_pgsql pgsql intl \
           redis opcache bcmath swoole zip imagick

RUN apt-get update\
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && apt-get autoremove 

RUN apt-get remove libssl1.0-dev libxml2-dev libzstd-dev zlib1g-dev

RUN apt-get autoremove && apt-get autoclean 

RUN apt-get install -y --fix-missing  nginx\
        apt-utils vim \
       --no-install-recommends libfreetype6-dev libjpeg62-turbo-dev \
       git \
       g++ \
       && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear

RUN echo "Asia/ShangHai" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN mkdir -p /home/wwwlogs
RUN chmod 777 -R /etc/nginx/conf.d
RUN chmod 777 -R /home/wwwlogs
RUN mkdir -p /www/web/self_php
# 生成 php.ini 配置
# WORKDIR /usr/share/nginx/html
WORKDIR /www/web/self_php/
COPY ./init.sh /
RUN /bin/sh /init.sh

CMD ["nginx"]
CMD ["php-fpm"]


