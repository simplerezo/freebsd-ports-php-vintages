# FreeBSD PHP old ports (freebsd-ports-php-vintages)
Patch your Ports tree for (removed) PHP5.6/PHP7.1/PHP7.2/PHP7.4 support

**Using EOL versions is, of course, strongly discouraged**

## Requirements

For PHP7.4+ you need to have CURL package installed.

## Patch your Ports tree

First, update your FreeBSD Ports tree by your favourite method (probably "portsnap fetch update").
Then (replacing 74 by desired version):

    fetch https://raw.githubusercontent.com/simplerezo/freebsd-ports-php-vintages/master/php74.sh
    chmod +x php74.sh
    ./php74.sh
    
Note: you need to re-run the script after every FreeBSD Ports tree update.

## Usage

Now you can build or upgrade individual packages:

	cd /usr/local/ports/php74/lang/php74 &&	make install
	cd /usr/local/ports/php74/www/mod_php74 && make install
