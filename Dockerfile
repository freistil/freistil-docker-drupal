FROM freistil/lamp
MAINTAINER Jochen Lillich <jochen@freistil.it>

RUN apt-get update && \
    apt-get -y install \
      drush \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Drupal
ADD drupal/setup.sh /setup/init/mysql/50-drupal.sh
RUN chmod a+x /setup/init/mysql/50-drupal.sh
ENV DRUPAL_PARENT_DIR="/var/www"
ENV DRUPAL_DIR="html"
ENV DRUPAL_MAJOR_VERSION="7"
ENV DRUPAL_ACCOUNT_NAME="admin"
ENV DRUPAL_ACCOUNT_PASS="drupal"
ENV DRUPAL_SITE_NAME="Docker"
RUN rm -rf $DRUPAL_PARENT_DIR/$DRUPAL_DIR
VOLUME /var/www/html

# MySQL
ENV MYSQL_PASS="admin"
ENV MYSQL_DATABASE_NAME="drupal"
ENV MYSQL_DATABASE_USER="drupal"
ENV MYSQL_DATABASE_PASSWORD="drupal"

# OpenSSH
EXPOSE 22
