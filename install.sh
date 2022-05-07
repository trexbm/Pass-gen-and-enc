#!/bin/bash

install (){
	cp passgen /usr/local/bin
	printf "Installed!"
} 
rootpls (){
	printf "Run as root!" | xargs
}
if [[ "$USER" = "root" ]]
then
	install
else
	rootpls
fi
