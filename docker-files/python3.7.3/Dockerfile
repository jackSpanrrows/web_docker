FROM debian

RUN apt-get update

RUN apt-get install -y vim wget zip apt-utils git ssh gnupg2 python3 python3-pip locate

RUN apt-get remove -y libssl1.0-dev libxml2-dev libzstd-dev zlib1g-dev

RUN apt-get autoremove -y  && apt-get autoclean -y

RUN echo "Asia/ShangHai" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /www/web/self_python

RUN python3 -m pip install --upgrade pip

RUN mkdir -p /www/web/self_python/lottery_spider

WORKDIR /www/web/self_python

RUN python3 -m pip install jieba wordcloud numpy pandas bs4 requests pymysql pymongo pillow pyvirtualdisplay selenium  more-itertools whois browsercookie Downloader arrow builtwith pyxvfb

# 重新安装pycurl
# RUN curl-config --configure

RUN apt-get purge curl

#RUN apt-get curl

RUN mkdir ~/curl && cd ~/curl && wget http://curl.haxx.se/download/curl-7.51.0.tar.bz2 && tar -xvjf curl-7.51.0.tar.bz2 && \
    cd curl-7.51.0 && ./configure && make && make install

RUN pip3.7 install pycurl

# 纠正时区
RUN rm -rf /etc/localtime && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime