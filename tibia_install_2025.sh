#!/bin/bash
# Autor: Xose
# Require root for running the script
# WARNING: Comment with # the last line if you want don't delete this script
if [ "`id -u`" != 0 ] ;
        then
            echo -e "\n"
            clear
            echo "Tibia installer created by Xose."
            echo "It requires root to run the script."
            echo "Abort, press any key to continue..."
            read abort
            clear
            exit 1
fi
SCRIPT=$(readlink -f $0);
mkdir /tmp/tibia_temp
cd /tmp/tibia_temp
wget https://static.tibia.com/download/tibia.x64.tar.gz
tar zxf tibia.x64.tar.gz
mv Tibia /opt/Tibia
chmod +x /opt/Tibia/Tibia
cd /tmp
rm -rf /tmp/tibia_temp
echo "[Desktop Entry]" > Tibia.txt
echo "Type=Application" >> Tibia.txt
echo "Name=Tibia" >> Tibia.txt
echo "Comment=Tibia Linux" >> Tibia.txt
echo "Icon=/opt/Tibia/tibia.ico" >> Tibia.txt
echo 'Exec="/opt/Tibia/./Tibia"'>> Tibia.txt
echo "Categories=Games;" >> Tibia.txt
echo "Path=/opt/Tibia/" >> Tibia.txt
mv Tibia.txt /usr/share/applications/Tibia.desktop
rm -rf $SCRIPT
