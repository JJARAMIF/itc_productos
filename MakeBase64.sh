#!/bin/bash
# Usage : MakeBase64.sh productos.csv product_base64.csv
# productos.csv columns are : id, nombre, jpg, color
# productos.csv separator MUST BE ;

ext=".jpg"

echo \"External ID\",\"Image\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

    if [ -f $f3$ext ]; then

	# recopy external ID
	echo -n $f1, >> $2

	#If second  column represents the key to match with the filename, please use this command
	cat $(echo ${f3} | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

	#Carrier return at end of line
	echo  >> $2
    fi

done < $1
