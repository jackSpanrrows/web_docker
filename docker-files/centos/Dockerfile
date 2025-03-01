# 使用CentOS作为基础镜像
FROM centos:latest

# 安装必要的软件包
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install httpd && \
    yum -y install php php-cli php-mysqlnd && \
    yum clean all

# 设置Apache配置
RUN echo '<?php phpinfo(); ?>' > /var/www/html/info.php

# 启用Apache
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]