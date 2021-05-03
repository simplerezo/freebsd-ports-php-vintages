# FreeBSD PHP old ports (freebsd-ports-php-vintages)
Patch your Ports tree for (removed) PHP5.6/PHP7.1/PHP7.2 support

Tested on FreeBSD 11 and 12

**Using EOL versions is, of course, strongly discouraged**

## Patch your Ports tree

First, update your FreeBSD Ports tree by your favourite method (probably "portsnap fetch update").
Then (replacing 72 by desired version):

    fetch https://raw.githubusercontent.com/simplerezo/freebsd-ports-php-vintages/master/php72.sh
    chmod +x php72.sh
    ./php72.sh
    
Note: you need to re-run the script after every FreeBSD Ports tree update.

## Usage

Now you can build or upgrade individual packages:

	cd /usr/local/ports/php72/lang/php72 &&	make install
	cd /usr/local/ports/php72/www/mod_php72 && make install
