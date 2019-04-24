#!/bin/bash
# autoaddusers v0.1
# You need makes a file with the next structure:
# user:password:group (note! password with ":" is not supported)
# Require root for running the script
if [ "`id -u`" != 0 ] ; 
	then
	  echo -e "\n"
	  clear
	  echo "It requires root to run the script."
	  echo "Press any key to continue..."
          read a
	  clear
	  exit 1
fi
# Take a file in specific route, require the full path!
echo "Please select the full path of file:"
read userfile
if [ -f $userfile ]
    then 
        echo "Loading File..."
    else
	echo "File not found!"
	echo "Make sure the path <$userfile> is correct and try again!"
	echo "Press any key to continue..."
	read a
      	clear
	exit 1
fi
echo "Creating users, please wait a moment!"
# Filter options configuration
users=`cat $userfile | tr " " _`
for i in $users
	do
		# Creating variables from file
		user=(`echo $i|cut -d: -f1`)
		password=(`echo $i|cut -d: -f2`) 
		group=(`echo $i|cut -d: -f3`) 
		# Make group, users and assign password
		addgroup $group --quiet &> /dev/null
		adduser $user --gecos "" --ingroup $group --disabled-password --quiet &> /dev/null	
		echo "$user:$password" | chpasswd &> /dev/null
done
# remove the users data file
echo "Done!, now remove the users data file."
rm $userfile
echo "Finished, press any key to continue..."
read a
clear
exit 0
