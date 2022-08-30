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
#sudo mysql_secure_installation
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
    ErrorLog /\${APACHE_LOG_DIR}/error.log
    CustomLog /\${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

EOF
)"
echo "${apache2}" > /etc/apache2/sites-available/${domain}.conf

sudo ln -s /etc/apache2/sites-available/${domain}.conf /etc/apache2/sites-enabled/${domain}.conf

sudo a2ensite ${domain}.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2

#run certification
sudo certbot --apache

# Setup MYSQL DB
mysqlpwd=$(cat /dev/urandom | tr -dc 'A-Za-z0-9%&+?@^~' | fold -w 20 | head -n 1)
mysqlusr=$(cat /dev/urandom | tr -dc 'A-Za-z0-9%&+?@^~' | fold -w 8 | head -n 1)
mysqldb=$(cat /dev/urandom | tr -dc 'A-Za-z0-9%&+?@^~' | fold -w 8 | head -n 1)


#Create MySQl DB
    mysql -e "CREATE DATABASE ${mysqldb} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${mysqlusr}@localhost IDENTIFIED BY '${mysqlpwd}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${mysqldb}.* TO '${mysqlusr}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"

echo "Username is '${mysqlusr}'"
echo "Password is '${mysqlpwd}'"
echo "DB is called '${mysqldb}'"


