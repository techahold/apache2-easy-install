#Enter domain
while [[ $domain != *[.]*[.]* ]]
do
echo -ne "Enter your Domain${NC}: "
read domain
done

#run update
sudo apt-get update && sudo apt-get -y upgrade

#Install apache2 & mysql
sudo apt-get install -y apache2
sudo apt-get install -y mysql-server
sudo mysql_secure_installation
sudo apt-get install -y php libapache2-mod-php php-mysql php-mbstring php-curl 
sudo apt-get install -y rewrite libapache2-mod-md
sudo apt-get install -y certbot python3-certbot-apache
sudo a2enmod md
sudo a2enmod ssl
#Restart apache2
sudo service apache2 restart

#Set firewall
sudo ufw allow OpenSSH
sudo ufw allow 'Apache Full'
sudo ufw enable

mkdir /var/www/${domain}

chown -R www-data:www-data /var/www/

#Set Apache2 config file
apache2="$(cat << EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName ${domain}
    ServerAlias ${domain}
    DocumentRoot /var/www/${domain}
    ErrorLog /${APACHE_LOG_DIR}/error.log
    CustomLog /${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

EOF
)"
echo "${apache2}" > /etc/apache2/sites-available/${domain}.conf

sudo a2ensite ${domain}.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

#run certification
sudo certbot --apache



