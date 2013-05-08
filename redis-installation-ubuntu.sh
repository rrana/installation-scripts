#!/bin/bash

# Redis installation script. Tested in ubuntu 12.04 with redis version 2.6.13

# Sudo is required to install everything properly
if [ "$(whoami)" != "root" ]; then
echo "You need to use sudo to run this script"
exit 0;
fi

cd /home/ubuntu && mkdir redis-installation
cd /home/ubuntu/redis-installation

wget http://redis.googlecode.com/files/redis-2.6.13.tar.gz # Make sure that your are downloading the latest redis stable version: http://redis.io/download
tar xzf redis-2.6.13.tar.gz
cd redis-2.6.13
make
sudo make install # This will be installed in /usr/local/bin

# To run Redis as a Background Daemon, there is a script provided by Redis itself
cd /home/ubuntu/redis-installation/redis-2.6.13/utils/
yes | sudo sh install_server.sh
#sudo /etc/init.d/redis_6379 start