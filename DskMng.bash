#!bin/bash
# Disk Management Script
# Name: Muhammed Hedyia
# ID  : 42014096
# Course Name: Red Hat Enterprise Linux

clear # clear a screen

# Check if a user is root
if [[ $EUID -ne 0 ]]
then
	echo "This script must be run as root"
	exit 1
fi
echo -e "Disk Management tool. for manage a disk press h for display help menu.\nCreated by Muhammed Hedyia"


input=1
while true;do
	read -p "dskmng (-h for help) >  " input

	case $input in
		"d" )
		ls -l /dev/sd* ;;
		"m" )
		echo -e "dir > \c"
		read dirname
		if [ -d $dirname ];then

			echo -e "par > \c"
			read partation
			mount /dev/$partation $dirname
		else
			echo "Invalid directory"
		fi
		;;
		"e" )
		echo -e "dir > \c"
		read dirname
		if [ -d $dirname ];then

			echo -e "par > \c"
			read partation
			mount /dev/$partation $dirname
			echo -e "/dev/$partation\t$dirname\text4\tdefaults\t0\t0" >> /etc/fstab

		else
			echo "Invalid directory..."
		fi
		;;
		"u" )
		echo -e "par > \c"
		read partation
		umount /dev/$partation  ;;

		"f" )
		echo -e "par > \c"
		read partation
		mkfs.ext4 /dev/$partation
		;;
		"a" )
		df -h  | grep sd;;
		"h" )
		echo help menu:
		echo "d) Show available Partations "
		echo "m) Mount a partation (not permanent)"
		echo "e) Mount a partation (permanent)"
		echo "u) Unmount a partation"
		echo "f) Make a file system"
		echo "a) Displays the amount of disk space"
		echo "clear) for clear"
		echo #"h) Displays help menu"
		echo "q) Quit" ;;
		"q" )
		exit 1 ;;
		"clear" )
		clear ;;
		"" )
		;;
		* )
		echo "Invalid Input.. insert correct sysntax"
	esac
done
