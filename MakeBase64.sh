#!/bin/bash
# Usage : MakeBase64.sh product_imagen.csv product_base64.csv
# product_imagen.csv columns are : externalID, nombre, jpg
# product_imagen.csv separator MUST BE ;

ext=".jpg"

echo \"External ID\",\"Image\" > $2

while IFS=";" read f1 f2 f3; do

    if [ -f $f3$ext ]; then

	# recopy external ID
	echo -n $f1, >> $2

	#If second  column represents the key to match with the filename, please use this command
	cat $(echo ${f3} | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

	#Carrier return at end of line
	echo  >> $2
    fi

done < $1
