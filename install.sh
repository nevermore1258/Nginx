# install php
apt-get install software-properties-common -y
add-apt-repository ppa:ondrej/php -y
apt-get update -y

# go to root
cd

# Install Web Server
apt-get -y install nginx php7.0-fpm php7.0-cli
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/nevermore1258/Nginx/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<h1 align="center">Server</h1>" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/nevermore1258/Nginx/master/vps.conf"
sed -i 's/listen = \/var\/run\/php7.0-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.0/fpm/pool.d/www.conf
service php7.0-fpm restart
service nginx restart
