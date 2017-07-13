#! /bin/sh
# appLariats generic tomcat build script
# Requirements - A valid package.json file exists within the code_dir
# Copies the package.json file from the code_dir and copies it into /usr/src/app/

#Log everything in /tmp/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

mkdir -p /usr/src/app
cp -rf /code/* /usr/src/app
cd /usr/src/app

npm install \
    && npm install -g bower \
    && npm install -g gulp \
    && bower install --allow-root \
    && gulp build


#Cleaning up after ourselves
rm -rf /code
