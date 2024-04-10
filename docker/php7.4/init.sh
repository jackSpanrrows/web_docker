#!/bin/bash

cat>/usr/local/etc/php/php-fpm.conf<<EOF
[global]
pid = /usr/local/php/var/run/php-fpm.pid
error_log = /usr/local/php/var/log/php-fpm.log
log_level = notice

[www]
listen = /tmp/php-cgi.sock
listen.backlog = -1
listen.allowed_clients = 127.0.0.1
listen.owner = www
listen.group = www
listen.mode = 0666
user = www
group = www
pm = dynamic
pm.max_children = 10
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 6
pm.max_requests = 1024
pm.process_idle_timeout = 10s
request_terminate_timeout = 100
request_slowlog_timeout = 0
slowlog = var/log/slow.log
EOF


cat>/usr/local/etc/php/php.ini<<EOF
[PHP]
;user_ini.filename = ".user.ini"
;user_ini.filename =
;user_ini.cache_ttl = 300
engine = On
short_open_tag = Off
asp_tags = Off
precision = 14
output_buffering = 4096
;output_handler =
zlib.output_compression = Off
;zlib.output_handler =
implicit_flush = Off
unserialize_callback_func =
serialize_precision = 17
;open_basedir =
disable_functions =
disable_classes =
;highlight.string  = #DD0000
;highlight.comment = #FF9900
;highlight.keyword = #007700
;highlight.default = #0000BB
;highlight.html    = #000000
;ignore_user_abort = On
;realpath_cache_size = 16k
;realpath_cache_ttl = 120
zend.enable_gc = On
;zend.multibyte = Off
;zend.script_encoding =
expose_php = On
max_execution_time = 30
max_input_time = 60
;max_input_nesting_level = 64
memory_limit = 128M
error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT
display_errors = Off
display_startup_errors = Off
log_errors = On
log_errors_max_len = 1024
ignore_repeated_errors = Off
ignore_repeated_source = Off
report_memleaks = On
;report_zend_debug = 0
track_errors = Off
;xmlrpc_errors = 0
;xmlrpc_error_number = 0
html_errors = On
;docref_root = "/phpmanual/"
;docref_ext = .html
;error_prepend_string = "<span style='color: #ff0000'>"
;error_append_string = "</span>"
;error_log = php_errors.log
;error_log = syslog
;arg_separator.output = "&amp;"
;arg_separator.input = ";&"
variables_order = "GPCS"
request_order = "GP"
register_argc_argv = Off
auto_globals_jit = On
;enable_post_data_reading = Off
post_max_size = 100M
auto_prepend_file =
auto_append_file =
default_mimetype = "text/html"
default_charset = "UTF-8"
;internal_encoding =
;input_encoding =
;output_encoding =
;always_populate_raw_post_data = -1
;include_path = ".:/php/includes"
;include_path = ".;c:\php\includes"
doc_root =
user_dir =
sys_temp_dir = "/tmp"
enable_dl = Off
;cgi.force_redirect = 1
;cgi.nph = 1
;cgi.redirect_status_env =
;cgi.fix_pathinfo=0
;fastcgi.impersonate = 1
;fastcgi.logging = 0
;cgi.rfc2616_headers = 0
file_uploads = On
;upload_tmp_dir =
upload_max_filesize = 100M
max_file_uploads = 20
allow_url_fopen = On
allow_url_include = Off
;from="john@doe.com"
;user_agent="PHP"
default_socket_timeout = 60
;auto_detect_line_endings = Off
;extension=php_bz2.dll
;extension=php_curl.dll
;extension=php_fileinfo.dll
;extension=php_gd2.dll
;extension=php_gettext.dll
;extension=php_gmp.dll
;extension=php_intl.dll
;extension=php_imap.dll
;extension=php_interbase.dll
;extension=php_ldap.dll
;extension=php_mbstring.dll
;extension=php_exif.dll      ; Must be after mbstring as it depends on it
;extension=php_mysql.dll
;extension=php_mysqli.dll
;extension=php_oci8_12c.dll  ; Use with Oracle Database 12c Instant Client
;extension=php_openssl.dll
;extension=php_pdo_firebird.dll
;extension=php_pdo_mysql.dll
;extension=php_pdo_oci.dll
;extension=php_pdo_odbc.dll
;extension=php_pdo_pgsql.dll
;extension=php_pdo_sqlite.dll
;extension=php_pgsql.dll
;extension=php_shmop.dll
;extension=php_snmp.dll
;extension=php_soap.dll
;extension=php_sockets.dll
;extension=php_sqlite3.dll
;extension=php_sybase_ct.dll
;extension=php_tidy.dll
;extension=php_xmlrpc.dll
;extension=php_xsl.dll

;extension=redis.so
;extension=php_pdo.so
;extension=php_pdo_mysql.so
;extension=php_openssl.so
;extension=memcached.so
;extension=swoole.so

[CLI Server]
cli_server.color = On

[Date]
date.timezone = PRC
;date.default_latitude = 31.7667
;date.default_longitude = 35.2333
;date.sunrise_zenith = 90.583333
;date.sunset_zenith = 90.583333

[filter]
;filter.default = unsafe_raw
;filter.default_flags =

[iconv]
;iconv.input_encoding =
;iconv.internal_encoding =
;iconv.output_encoding =

[intl]
;intl.error_level = E_WARNING

[sqlite]
;sqlite.assoc_case = 0

[sqlite3]
;sqlite3.extension_dir =

[Pcre]
;pcre.backtrack_limit=100000
;pcre.recursion_limit=100000

[Pdo]
;pdo_odbc.connection_pooling=strict
;pdo_odbc.db2_instance_name

[Pdo_mysql]
pdo_mysql.cache_size = 2000
pdo_mysql.default_socket=

[Phar]
;phar.readonly = On
;phar.require_hash = On
;phar.cache_list =

[mail function]
SMTP = localhost
smtp_port = 25
;sendmail_from = me@example.com
;sendmail_path =
mail.add_x_header = On
;mail.log =
;mail.log = syslog

[SQL]
sql.safe_mode = Off

[ODBC]
;odbc.default_db    =  Not yet implemented
;odbc.default_user  =  Not yet implemented
;odbc.default_pw    =  Not yet implemented
;odbc.default_cursortype
odbc.allow_persistent = On
odbc.check_persistent = On
odbc.max_persistent = -1
odbc.max_links = -1
odbc.defaultlrl = 4096
odbc.defaultbinmode = 1
;birdstep.max_links = -1

[Interbase]
ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
;ibase.default_db =
;ibase.default_user =
;ibase.default_password =
;ibase.default_charset =
ibase.timestampformat = "%Y-%m-%d %H:%M:%S"
ibase.dateformat = "%Y-%m-%d"
ibase.timeformat = "%H:%M:%S"

[MySQL]
mysql.allow_local_infile = On
mysql.allow_persistent = On
mysql.cache_size = 2000
mysql.max_persistent = -1
mysql.max_links = -1
mysql.default_port =
mysql.default_socket =
mysql.default_host =
mysql.default_user =
mysql.default_password =
mysql.connect_timeout = 60
mysql.trace_mode = Off

[MySQLi]
mysqli.max_persistent = -1
;mysqli.allow_local_infile = On
mysqli.allow_persistent = On
mysqli.max_links = -1
mysqli.cache_size = 2000
mysqli.default_port = 3306
mysqli.default_socket =
mysqli.default_host =
mysqli.default_user =
mysqli.default_pw =
mysqli.reconnect = Off

[mysqlnd]
mysqlnd.collect_statistics = On
mysqlnd.collect_memory_statistics = Off
;mysqlnd.net_cmd_buffer_size = 2048
;mysqlnd.net_read_buffer_size = 32768

[OCI8]
;oci8.privileged_connect = Off
;oci8.max_persistent = -1
;oci8.persistent_timeout = -1
;oci8.ping_interval = 60
;oci8.connection_class =
;oci8.events = Off
;oci8.statement_cache_size = 20
;oci8.default_prefetch = 100
;oci8.old_oci_close_semantics = Off

[PostgreSQL]
pgsql.allow_persistent = On
pgsql.auto_reset_persistent = Off
pgsql.max_persistent = -1
pgsql.max_links = -1
pgsql.ignore_notice = 0
pgsql.log_notice = 0

[Sybase-CT]
sybct.allow_persistent = On
sybct.max_persistent = -1
sybct.max_links = -1
sybct.min_server_severity = 10
sybct.min_client_severity = 10
;sybct.timeout=
;sybct.packet_size
;sybct.login_timeout=
;sybct.hostname=
;sybct.deadlock_retry_count=

[bcmath]
bcmath.scale = 0

[browscap]
;browscap = extra/browscap.ini

[Session]
session.save_handler = files
;session.save_path = "/tmp"
session.use_strict_mode = 0
session.use_cookies = 1
;session.cookie_secure =
session.use_only_cookies = 1
session.name = PHPSESSID
session.auto_start = 0
session.cookie_lifetime = 0
session.cookie_path = /
session.cookie_domain =
session.cookie_httponly =
session.serialize_handler = php
session.gc_probability = 1
session.gc_divisor = 1000
session.gc_maxlifetime = 1440
session.referer_check =
;session.entropy_length = 32
;session.entropy_file = /dev/urandom
session.cache_limiter = nocache
session.cache_expire = 180
session.use_trans_sid = 0
session.hash_function = 0
session.hash_bits_per_character = 5
url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"
;session.upload_progress.enabled = On
;session.upload_progress.cleanup = On
;session.upload_progress.prefix = "upload_progress_"
;session.upload_progress.name = "PHP_SESSION_UPLOAD_PROGRESS"
;session.upload_progress.freq =  "1%"
;session.upload_progress.min_freq = "1"

[MSSQL]
mssql.allow_persistent = On
mssql.max_persistent = -1
mssql.max_links = -1
mssql.min_error_severity = 10
mssql.min_message_severity = 10
mssql.compatibility_mode = Off
;mssql.connect_timeout = 5
;mssql.timeout = 60
;mssql.textlimit = 4096
;mssql.textsize = 4096
;mssql.batchsize = 0
;mssql.datetimeconvert = On
mssql.secure_connection = Off
;mssql.max_procs = -1
;mssql.charset = "ISO-8859-1"

[Assertion]
;assert.active = On
;assert.warning = On
;assert.bail = Off
;assert.callback = 0
;assert.quiet_eval = 0

[COM]
;com.typelib_file =
;com.allow_dcom = true
;com.autoregister_typelib = true
;com.autoregister_casesensitive = false
;com.autoregister_verbose = true
;com.code_page=

[mbstring]
;mbstring.language = Japanese
;mbstring.internal_encoding =
;mbstring.http_input =
;mbstring.http_output =
;mbstring.encoding_translation = Off
;mbstring.detect_order = auto
;mbstring.substitute_character = none
;mbstring.func_overload = 0
;mbstring.strict_detection = On
;mbstring.http_output_conv_mimetype=

[gd]
;gd.jpeg_ignore_warning = 0

[exif]
;exif.encode_unicode = ISO-8859-15
;exif.decode_unicode_motorola = UCS-2BE
;exif.decode_unicode_intel    = UCS-2LE
;exif.encode_jis =
;exif.decode_jis_motorola = JIS
;exif.decode_jis_intel    = JIS

[Tidy]
;tidy.default_config = /usr/local/lib/php/default.tcfg
tidy.clean_output = Off

[soap]
soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir="/tmp"
soap.wsdl_cache_ttl=86400
soap.wsdl_cache_limit = 5

[sysvshm]
;sysvshm.init_mem = 10000

[ldap]
ldap.max_links = -1

[mcrypt]
;mcrypt.algorithms_dir=
;mcrypt.modes_dir=

[dba]
;dba.default_handler=

[opcache]
;opcache.enable=0
;opcache.enable_cli=0
;opcache.memory_consumption=64
;opcache.interned_strings_buffer=4
;opcache.max_accelerated_files=2000
;opcache.max_wasted_percentage=5
;opcache.use_cwd=1
;opcache.validate_timestamps=1
;opcache.revalidate_freq=2
;opcache.revalidate_path=0
;opcache.save_comments=1
;opcache.load_comments=1
;opcache.fast_shutdown=0
;opcache.enable_file_override=0
;opcache.optimization_level=0xffffffff
;opcache.inherited_hack=1
;opcache.dups_fix=0
;opcache.blacklist_filename=
;opcache.max_file_size=0
;opcache.consistency_checks=0
;opcache.force_restart_timeout=180
;opcache.error_log=
;opcache.log_verbosity_level=1
;opcache.preferred_memory_model=
;opcache.protect_memory=0

[curl]
;curl.cainfo =

[openssl]
;openssl.cafile=
;openssl.capath=
EOF

cat >/usr/local/etc/php-fpm.d/www.conf<< EOF
[www]
;prefix = /path/to/pools/$pool
user = www-data
group = www-data
listen = 127.0.0.1:9000
;listen.backlog = 511
;listen.owner = www-data
;listen.group = www-data
;listen.mode = 0660
;listen.acl_users =
;listen.acl_groups =
;listen.allowed_clients = 127.0.0.1
pm = static
pm.max_children = 100
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
;pm.process_idle_timeout = 10s;
;pm.max_requests = 500
;pm.status_path = /status
;ping.path = /ping
;ping.response = pong
;access.log = log/\$pool.access.log

;access.format = "%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"
;slowlog = log/\$pool.log.slow
;request_slowlog_timeout = 0
;request_terminate_timeout = 0
;rlimit_files = 1024
;rlimit_core = 0
;chroot =
;chdir = /var/www
;catch_workers_output = yes
;clear_env = no
;security.limit_extensions = .php .php3 .php4 .php5 .php7
;env[HOSTNAME] = \$HOSTNAME
;env[PATH] = /usr/local/bin:/usr/bin:/bin
;env[TMP] = /tmp
;env[TMPDIR] = /tmp
;env[TEMP] = /tmp
;php_admin_value[sendmail_path] = /usr/sbin/sendmail -t -i -f www@my.domain.com
;php_flag[display_errors] = off
;php_admin_value[error_log] = /var/log/fpm-php.www.log
;php_admin_flag[log_errors] = on
;php_admin_value[memory_limit] = 32M

EOF


cat >/etc/nginx/nginx.conf<< EOF
user  www-data;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    client_max_body_size 2m;
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"'
                      ' \$request_body ';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    gzip  on;
    gzip_disable "MSIE [1-6].(?!.*SV1)";

    include /etc/nginx/conf.d/*.conf;
}
EOF
mkdir -p /home/wwwlogs/
cat >/etc/nginx/conf.d/admin.advertist.imlaoarc.com.conf<< EOF
server {
  listen  80;
  # listen  443 ssl;
  # ssl_certificate      /etc/nginx/server.crt;
  # ssl_certificate_key  /etc/nginx/server.key;
  # ssl_protocols        TLSv1 TLSv1.1 TLSv1.2;
  # ssl_ciphers          HIGH:!aNULL:!MD5;
  # ssl_prefer_server_ciphers  on;

  server_name  _;

  #location /Sapi {
  # proxy_pass http://http_server:8989/request;
  #}


  location / {
    root   /www/web/self_php/backend/web;
    index  index.php index.html index.htm;
    if (!-e \$request_filename) {
      rewrite ^/index.php(.*)$ /index.php?s=\$1 last;
      rewrite ^(.*)$ /index.php?s=\$1 last;
      break;
    }
    add_header Access-Control-Allow-Orign "*";
    add_header Access-Control-Allow-Headers "Origin, X-Requested-With, Content-Type, Accept";
    add_header Access-Control-Allow-Methods "GET, POST, OPTIONS";
  }

  location ~ \.php$ {
    root           html;
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  /www/web/self_php/backend/web/\$fastcgi_script_name;
    include        fastcgi_params;
  }
  location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
   {
       expires      30d;
   }
   location ~* \.(eot|otf|ttf|woff|woff2|svg)$ {
    add_header Access-Control-Allow-Origin *;
   }

   location ~ .*\.(js|css)?$
    {
        expires   12h;
    }

  location ~ /\.ht {
    deny all;
  }
  access_log  /home/wwwlogs/admin.advertist.com.access.log;
  error_log  /home/wwwlogs/admin.advertist.com.error.log;

}
EOF

mkdir -p /www/web/self_php

cd /www/web/self_php

echo "➜➜➜➜➜➜ 透过docker deamon 重启 $BACKEND_API_SERVER..."

curl  -X POST  -s --unix-socket /var/run/docker.sock http:/containers/v1.24/containers/$BACKEND_API_SERVER/restart

echo "➜➜➜➜➜➜ 透过docker deamon 重启 $FRONT_API_SERVER..."

curl  -X POST  -s --unix-socket /var/run/docker.sock http:/containers/v1.24/containers/$FRONT_API_SERVER/restart

echo "➜➜➜➜➜➜ 透过docker deamon 重启 $CRONTAB_WORKER..."
curl  -X POST  -s --unix-socket /var/run/docker.sock http:/containers/v1.24/containers/$CRONTAB_WORKER/restart

echo "➜➜➜➜➜➜ 启动 nginx..."
nginx

echo "➜➜➜➜➜➜ 启动 php-fpm..."
php-fpm


