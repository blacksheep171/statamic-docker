#!/bin/bash

cd /var/www/html/terrace

#sudo chown -R $USER:www-data storage
#sudo chown -R $USER:www-data bootstrap/cache
#chmod -R 777 storage
# install composer 
composer install

#sudo chmod -R 755 /var/www/example.com
#sudo chown -R www-data:www-data /var/www/html/terrace
#sudo chown -R www-data:www-data /var/www/html/terrace/storage
#sudo chown -R www-data:www-data /var/www/html/terrace/content
#sudo chown -R www-data:www-data /var/www/html/terrace/bootstrap/cache
# get output
php-fpm 

echo All Done!