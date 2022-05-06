#!/bin/bash

len=$1
useage(){
	echo "Generate a random password"
	echo "Please insert the length of the password"
	echo "Ex: ./passgen.sh 20"
}
len=$1

passwd(){  
pass=$(tr -dc "A-Za-z0-9_#$%&()[]+-"< /dev/urandom | head -c $len | xargs)
echo $pass | xclip -selection -c
notify-send "Password copied"
echo "Would you like to save&encrypt your password?[y/n]"
read sve
if [ "$sve" = "y" ]
then
	touch savedpass
	echo $pass >> savedpass
	openssl enc -aes-256-cbc -base64 -in savedpass -out enc
else
	exit 1
fi
}

if [ -n "$len" ]
then
	passwd
else
	useage
fi
