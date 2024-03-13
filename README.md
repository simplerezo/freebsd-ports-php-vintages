# FreeBSD PHP old ports (freebsd-ports-php-vintages)
Patch your Ports tree for (removed) PHP5.6/PHP7.1/PHP7.2/PHP7.4/PHP8.0 support

**Using EOL versions is, of course, strongly discouraged**

## Requirements

For PHP7.4+ you need to have CURL package installed.

## Patch your Ports tree

First, update your FreeBSD Ports tree by your favourite method (probably "portsnap fetch update").
Then (replacing 80 by desired version):

    fetch https://raw.githubusercontent.com/simplerezo/freebsd-ports-php-vintages/master/php80.sh
    chmod +x php80.sh
    ./php80.sh
    
Note: you need to re-run the script after every FreeBSD Ports tree update.

## Usage

Now you can build or upgrade individual packages:

	cd /usr/local/ports/php80/lang/php80 &&	make install
	cd /usr/local/ports/php80/www/mod_php80 && make install
