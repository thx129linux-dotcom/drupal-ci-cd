#!/bin/bash

set -e

until mysqladmin ping \
-h"$DB_HOST" \
-u"$DB_USER" \
-p"$DB_PASS" \
--silent
do
    echo "Attente de MariaDB..."
    sleep 2
done

cd /var/www/html

if [ ! -f web/sites/default/settings.php ]; then

    cp web/sites/default/default.settings.php \
       web/sites/default/settings.php

    mkdir -p web/sites/default/files

    chmod -R 775 web/sites/default/files

    chown -R www-data:www-data web/sites/default

    vendor/bin/drush site:install standard \
        --root=web \
        --db-url=mysql://$DB_USER:$DB_PASS@$DB_HOST/$DB_NAME \
        --account-name=admin \
        --account-pass=admin \
        --site-name="Drupal CI/CD" \
        -y

    vendor/bin/drush theme:enable informatikadomicile -y

    vendor/bin/drush config:set system.theme default informatikadomicile -y

    vendor/bin/drush cache:rebuild -y    
fi

exec apache2-foreground