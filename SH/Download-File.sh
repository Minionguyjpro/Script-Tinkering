#!/bin/sh
# Check for root priviliges
if [ `id -u` != 0 ]
then
   echo "Please run as root (or with sudo)!"
   exit
fi
# Check whether wget is installed
wget > /dev/null 2>&1
if [ $? -eq 127 ]
then
   echo "Wget is not installed! Please install wget for your operating system!"
   exit 127
fi
# Set url variable based on input
read -p 'The URL of the file that you want to download: ' url
wget "${url}"
