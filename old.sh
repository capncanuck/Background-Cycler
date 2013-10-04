#!/bin/bash

list="$HOME/Pictures/backgrounds"
chosen=$(shuf -n1 $list)

#Choices of style:
#	-	'none'
#	-	'wallpaper'
#	-	'centered'
#	-	'scaled'
#	-	'stretched'
#	-	'zoom'
#	-	'spanned'

case $chosen in
	Skyrock.jpg)
		style='wallpaper'
		;;
	Torque.png)
		style='stretched'
		;;
	*)
		style='zoom'
esac

export $(ps e | grep $USER | grep -oP 'DBUS_SESSION_BUS_ADDRESS=.*? ' | head -1)

gsettings set org.gnome.desktop.background picture-uri file:///home/capncanuck/Pictures/"$(echo $chosen | sed 's/ /%20/g')"
gsettings set org.gnome.desktop.background picture-options $style

exit
