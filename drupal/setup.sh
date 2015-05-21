#!/bin/bash

cd $DRUPAL_PARENT_DIR/$DRUPAL_DIR
if ! drush status | grep -q 'Drupal bootstrap.*Successful'; then
  echo "=> Initialising Drupal site"
  echo "Drupal site name:     $DRUPAL_SITE_NAME"
  echo "Drupal user name:     $DRUPAL_ACCOUNT_NAME"
  echo "Drupal user password: $DRUPAL_ACCOUNT_PASS"
  drush site-install standard -y --account-name=$DRUPAL_ACCOUNT_NAME --account-pass=$DRUPAL_ACCOUNT_PASS \
    --site-name="$DRUPAL_SITE_NAME" \
    --db-url="mysqli://$MYSQL_DATABASE_USER:$MYSQL_DATABASE_PASSWORD@localhost:3306/$MYSQL_DATABASE_NAME"

  echo "=> Done!"
else
  echo "=> Drupal is already installed"
fi
