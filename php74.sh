#!/usr/bin/env bash

DIR_PORTS=/usr/ports
GIT_BRANCH=2022Q4
PHP_VER=74
URL_GIT=https://github.com/freebsd/freebsd-ports/tree/$GIT_BRANCH
URL_GHGET=https://raw.githubusercontent.com/mohd-akram/ghget/master/ghget

# Check for CURL 
if ! which curl >/dev/null; then
  echo CURL required!
  echo '# make -C /usr/ports/ftp/curl'
  exit 1
fi

# Download ghget
curl -so /tmp/ghget $URL_GHGET || exit 0
chmod +x /tmp/ghget

# Dirty hack for ghget errors
function ghget() {
  while ! /tmp/ghget -o $1 $2; do
    rm -rf $1
    sleep 1
  done
}

# Retrieve ports from FreeBSD SVN
for i in \
  archivers/php${PHP_VER}-bz2 \
  archivers/php${PHP_VER}-phar \
  archivers/php${PHP_VER}-zip \
  archivers/php${PHP_VER}-zlib \
  converters/php${PHP_VER}-iconv \
  converters/php${PHP_VER}-mbstring \
  databases/php${PHP_VER}-dba \
  databases/php${PHP_VER}-mysqli \
  databases/php${PHP_VER}-odbc \
  databases/php${PHP_VER}-pdo \
  databases/php${PHP_VER}-pdo_dblib \
  databases/php${PHP_VER}-pdo_firebird \
  databases/php${PHP_VER}-pdo_mysql \
  databases/php${PHP_VER}-pdo_odbc \
  databases/php${PHP_VER}-pdo_pgsql \
  databases/php${PHP_VER}-pdo_sqlite \
  databases/php${PHP_VER}-pgsql \
  databases/php${PHP_VER}-sqlite3 \
  devel/php${PHP_VER}-gettext \
  devel/php${PHP_VER}-intl \
  devel/php${PHP_VER}-json \
  devel/php${PHP_VER}-pcntl \
  devel/php${PHP_VER}-readline \
  devel/php${PHP_VER}-shmop \
  devel/php${PHP_VER}-sysvmsg \
  devel/php${PHP_VER}-sysvsem \
  devel/php${PHP_VER}-sysvshm \
  devel/php${PHP_VER}-tokenizer \
  ftp/php${PHP_VER}-curl \
  ftp/php${PHP_VER}-ftp \
  graphics/php${PHP_VER}-exif \
  graphics/php${PHP_VER}-gd \
  lang/php${PHP_VER} \
  lang/php${PHP_VER}-extensions \
  mail/php${PHP_VER}-imap \
  math/php${PHP_VER}-bcmath \
  math/php${PHP_VER}-gmp \
  misc/php${PHP_VER}-calendar \
  net/php${PHP_VER}-ldap \
  net/php${PHP_VER}-soap \
  net/php${PHP_VER}-sockets \
  net/php${PHP_VER}-xmlrpc \
  net-mgmt/php${PHP_VER}-snmp \
  security/php${PHP_VER}-filter \
  security/php${PHP_VER}-openssl \
  sysutils/php${PHP_VER}-fileinfo \
  sysutils/php${PHP_VER}-posix \
  textproc/php${PHP_VER}-ctype \
  textproc/php${PHP_VER}-dom \
  textproc/php${PHP_VER}-enchant \
  textproc/php${PHP_VER}-pspell \
  textproc/php${PHP_VER}-simplexml \
  textproc/php${PHP_VER}-xml \
  textproc/php${PHP_VER}-xmlreader \
  textproc/php${PHP_VER}-xmlwriter \
  textproc/php${PHP_VER}-xsl \
  www/mod_php${PHP_VER} \
  www/php${PHP_VER}-opcache \
  www/php${PHP_VER}-session \
  www/php${PHP_VER}-tidy \
    ; do
  echo "+ $i"
  ghget $DIR_PORTS/$i $URL_GIT/$i
done
echo '= php.mk'
ghget $DIR_PORTS/Mk/Uses/php.mk ${URL_GIT/tree/blob}/Mk/Uses/php.mk

# Clean
rm /tmp/ghget
