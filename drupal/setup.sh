#!/bin/bash

DRUPAL_DOCROOT="$DRUPAL_PARENT_DIR/$DRUPAL_DIR"

if [[ ! -f $DRUPAL_DOCROOT/index.php ]]; then
  echo "=> Downloading Drupal to $DRUPAL_PARENT_DIR"
  drush dl --destination=$DRUPAL_PARENT_DIR --default-major=$DRUPAL_MAJOR_VERSION --drupal-project-rename=$DRUPAL_DIR
  chown -R www-data:www-data $DRUPAL_DOCROOT

  echo "=> Initialising Drupal site"
  echo "Drupal site name:     $DRUPAL_SITE_NAME"
  echo "Drupal user name:     $DRUPAL_ACCOUNT_NAME"
  echo "Drupal user password: $DRUPAL_ACCOUNT_PASS"
  cd $DRUPAL_DOCROOT
  drush site-install standard -y --account-name=$DRUPAL_ACCOUNT_NAME --account-pass=$DRUPAL_ACCOUNT_PASS \
    --site-name="$DRUPAL_SITE_NAME" \
    --db-url="mysqli://$MYSQL_DATABASE_USER:$MYSQL_DATABASE_PASSWORD@localhost:3306/$MYSQL_DATABASE_NAME"

  echo "=> Done!"
else
  echo "=> index.php already exists, skipping Drupal installation"
fi
