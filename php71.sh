#!/bin/sh

DIR_PORTS=/usr/ports
PHP_VER=71
SVN_BRANCH=2019Q4
SVN_REVISION=520344
SVN_URL=https://svn.freebsd.org/ports

# Retrieve ports from FreeBSD SVN
for i in \
  archivers/php${PHP_VER}-bz2 \
  archivers/php${PHP_VER}-phar \
  archivers/php${PHP_VER}-zip \
  archivers/php${PHP_VER}-zlib \
  converters/php${PHP_VER}-iconv \
  converters/php${PHP_VER}-mbstring \
  converters/php${PHP_VER}-recode \
  databases/php${PHP_VER}-dba \
  databases/php${PHP_VER}-interbase \
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
  security/php${PHP_VER}-hash \
  security/php${PHP_VER}-mcrypt \
  security/php${PHP_VER}-openssl \
  sysutils/php${PHP_VER}-fileinfo \
  sysutils/php${PHP_VER}-posix \
  textproc/php${PHP_VER}-ctype \
  textproc/php${PHP_VER}-dom \
  textproc/php${PHP_VER}-enchant \
  textproc/php${PHP_VER}-pspell \
  textproc/php${PHP_VER}-simplexml \
  textproc/php${PHP_VER}-wddx \
  textproc/php${PHP_VER}-xml \
  textproc/php${PHP_VER}-xmlreader \
  textproc/php${PHP_VER}-xmlwriter \
  textproc/php${PHP_VER}-xsl \
  www/mod_php${PHP_VER} \
  www/php${PHP_VER}-opcache \
  www/php${PHP_VER}-session \
  www/php${PHP_VER}-tidy \
    ; do 
  svnlite co -r $SVN_REVISION ${SVN_URL}/branches/$SVN_BRANCH/$i $DIR_PORTS/$i || exit $?
done
svnlite co -r $SVN_REVISION ${SVN_URL}/branches/$SVN_BRANCH/lang/php${PHP_VER}-extensions $DIR_PORTS/lang/php${PHP_VER}-extensions || exit $?
svnlite co -r $SVN_REVISION ${SVN_URL}/branches/$SVN_BRANCH/Mk/Uses $DIR_PORTS/Mk/Uses.php${PHP_VER} || exit $?
cp $DIR_PORTS/Mk/Uses.php${PHP_VER}/php.mk $DIR_PORTS/Mk/Uses
