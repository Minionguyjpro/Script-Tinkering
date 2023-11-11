#!/bin/sh
# Set desktop folder to variable desktopfolder and check whether Xdg-user-dirs is installed for it to work properly
desktopfolder=`xdg-user-dir DESKTOP > /dev/null 2>&1`
if [ $? -eq 127 ]
then
   echo "Xdg-user-dirs is not installed! Please install it using your package manager."
   exit 127
fi
# Check whether Flatpak is installed
flatpak > /dev/null 2>&1
if [ $? -eq 127 ]
then
   echo "Flatpak is not installed! Please install it using your package manager."
   exit 127
fi
# Set the flatpakid variable based on the Flatpak app's ID the user specifies
read -p 'The ID of the Flatpak app where you want to make a desktop shortcut for: ' flatpakid
# Check whether the Flatpak app is installed or the ID is correct
flatpak info $flatpakid > /dev/null 2>&1
if [ $? -eq 1 ]
then
   echo "That Flatpak application is not installed, or the ID wasn't entered correctly!"
   exit 1
fi
# Copy the desktop shortcut to your real desktop! And of course
cp /var/lib/flatpak/app/$flatpakid/current/active/export/share/applications/$flatpakid.desktop $desktopfolder
if [ $? -eq 0 ]
then
   echo "Successfully copied the desktop file! Check your desktop and try to run it. If it gives a warning about integrity, make sure to click 'Mark as executable'."
   exit 0
else
   CPERRCODE=$?
   echo "Something has gone wrong. The error code is $?."
   exit $CPERRCODE
fi
