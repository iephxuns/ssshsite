#!/bin/bash

# SSH SITE Script by : IEPH-Raf
# CREDITS TO Dreyannz

MYIP=$(wget -qO- ipv4.icanhazip.com);

clear

echo -e "\e[0m                                                   "
echo -e "\e[94m[][][]======================================[][][]"
echo -e "\e[0m                                                   "
echo -e "\e[93m                Processing Request                "
echo -e "\e[94m                                                  "
echo -e "\e[94m[][][]======================================[][][]\e[0m"
sleep 3

echo -e ""
apt-get update > /dev/null 2>1;

apt-get install nginx -y > /dev/null 2>1;

apt-get install libssh2-php -y > /dev/null 2>1;

apt-get install php5-fpm -y > /dev/null 2>1;

apt-get install php5-cli -y > /dev/null 2>1;


rm /etc/nginx/sites-enabled/default

rm /etc/nginx/sites-available/default

wget --quiet -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/iephxuns/ssshsite/master/nginx.conf"

mkdir -p /home/vps/public_html

wget --quiet -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/iephxuns/ssshsite/master/vps.conf"

sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

service php5-fpm restart

service nginx restart

	
# Installing ssh site
	apt-get -y install zip unzip
cd /home/vps/public_html
wget https://raw.githubusercontent.com/iephxuns/ssshsite/master/ssh.zip
unzip ssh.zip
rm -f ssh.zip
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html

	clear

echo -e "\e[0m                                                   "
	echo -e "\e[94m[][][]======================================[][][]"
	echo -e "\e[0m                                                   "
	echo -e "\e[93m            SSH SITE Iis Installed            "
	echo -e "\e[93m      Dont Forget To Input The Server Details     "
	echo -e "\e[93m             at server.php             "
	echo -e "\e[94m                                                  "
	echo -e "\e[93m                 "$MYIP
	echo -e "\e[94m                                                  "
	echo -e "\e[94m[][][]======================================[][][]\e[0m"
	exit
	;;

esac

