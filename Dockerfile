FROM freistil/lamp
MAINTAINER Jochen Lillich <jochen@freistil.it>

RUN apt-get update && \
    apt-get -y install \
      drush \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

#
# Drupal
#

# Setup script
ADD drupal/setup.sh /setup/init/mysql/50-drupal.sh
RUN chmod a+x /setup/init/mysql/50-drupal.sh
# Name of the Drupal directory
ENV DRUPAL_DIR="html"
# The Drupal directory's parent path
ENV DRUPAL_PARENT_DIR="/var/www"
# Major Drupal version to install
ENV DRUPAL_MAJOR_VERSION="7"
# Drupal login
ENV DRUPAL_ACCOUNT_NAME="admin"
ENV DRUPAL_ACCOUNT_PASS="drupal"
# Website name
ENV DRUPAL_SITE_NAME="Docker"
# Install Drupal
WORKDIR /var/www
RUN rm -r $DRUPAL_DIR
RUN drush dl -y --default-major=$DRUPAL_MAJOR_VERSION --drupal-project-rename=$DRUPAL_DIR
RUN chown -R www-data:www-data $DRUPAL_DIR


#
# MySQL
#

# Create a database at startup
ENV MYSQL_PASS="admin"
ENV MYSQL_DATABASE_NAME="drupal"
ENV MYSQL_DATABASE_USER="drupal"
ENV MYSQL_DATABASE_PASSWORD="drupal"
