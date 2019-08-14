#!/bin/sh

DIR_PORTS=/usr/ports
SVN_REVISION=488893
SVN_URL=https://svn.freebsd.org/ports

# Retrieve ports from FreeBSD SVN
for i in \
    archivers/php56-bz2 archivers/php56-phar archivers/php56-zip archivers/php56-zlib \
    converters/php56-iconv converters/php56-mbstring converters/php56-recode \
    databases/php56-dba databases/php56-interbase databases/php56-mssql databases/php56-mysql databases/php56-mysqli databases/php56-pdo databases/php56-pdo_dblib databases/php56-pdo_firebird databases/php56-pdo_mysql databases/php56-pdo_odbc databases/php56-pdo_pgsql databases/php56-pdo_sqlite databases/php56-pgsql databases/php56-sqlite3 databases/php56-sybase_ct \
    devel/pecl-intl devel/php56-gettext devel/php56-json devel/php56-pcntl devel/php56-readline devel/php56-shmop devel/php56-sysvmsg devel/php56-sysvsem devel/php56-sysvshm devel/php56-tokenizer \
    ftp/php56-curl ftp/php56-ftp \
    graphics/php56-exif graphics/php56-gd \
    lang/php56 \
    mail/php56-imap \
    math/php56-bcmath math/php56-gmp \
    misc/php56-calendar \
    net/php56-ldap net/php56-soap net/php56-sockets net/php56-xmlrpc \
    net-mgmt/php56-snmp \
    security/php56-filter security/php56-hash security/php56-mcrypt security/php56-openssl \
    sysutils/php56-fileinfo sysutils/php56-posix \
    textproc/php56-ctype textproc/php56-dom textproc/php56-enchant textproc/php56-pspell textproc/php56-simplexml textproc/php56-wddx textproc/php56-xml textproc/php56-xmlreader textproc/php56-xmlwriter textproc/php56-xsl \
    www/mod_php56 www/php56-opcache www/php56-session www/php56-tidy \
    ; do 
  # svnlite co -r $SVN_REVISION ${SVN_URL}/branches/2019Q1/$i $DIR_PORTS/$i
done
svnlite co -r $SVN_REVISION ${SVN_URL}/branches/2018Q4/lang/php56-extensions $DIR_PORTS/lang/php56-extensions

# Patch Uses/php.mk
patch -N $DIR_PORTS/Mk/Uses/php.mk <<EOF
113c113
< _ALL_PHP_VERSIONS=	71 72 73
---
> _ALL_PHP_VERSIONS=	56 71 72 73
185a186,188
> .    elif \${PHP_VER} == 56
> PHP_EXT_DIR=   20131226
> PHP_EXT_INC=    pcre spl
222c225
< 		(doesn't support PHP \${IGNORE_WITH_PHP:C/^(7)/\\1./})
---
> 		(doesn't support PHP \${IGNORE_WITH_PHP:C/^([57])/\\1./})
371c374
< 		memcache memcached mysqli odbc opcache \\
---
> 		memcache memcached mysql mysqli odbc opcache \\
377a381
> _USE_PHP_VER56=	\${_USE_PHP_ALL} mssql mysql sybase_ct
415a420
> mysql_DEPENDS=	databases/php\${PHP_VER}-mysql
EOF

# Update to 5.6.40
sed -i '' 's/5\.6\.39/5\.6\.40/' $DIR_PORTS/lang/php56/Makefile
echo 'TIMESTAMP = 1561383984
SHA256 (php-5.6.40.tar.xz) = 1369a51eee3995d7fbd1c5342e5cc917760e276d561595b6052b21ace2656d1c
SIZE (php-5.6.40.tar.xz) = 12472236' > $DIR_PORTS/lang/php56/distinfo
