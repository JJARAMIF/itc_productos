#!/bin/bash
# Usage : MakeBase64+.sh productos.csv product_base64+.csv
# productos.csv columns are : externalID, nombre, jpg, color
# productos.csv separator MUST BE ;


ext=".jpg"
a="_product_template"
b="_0"
c="-0"


echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"Image\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

	NUM=1

	while [ $NUM -le 9 ]; do

    		bb=$b$NUM
    		cc=$c$NUM
		file=$f3$cc$ext

		if [ -f $file ]; then

			# recopy external ID y Encabezados
			echo -n  $f1$bb,$f1$a,$f3$cc, >> $2

			# transforma a base64
			cat $(echo ${f3}$cc | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

			#Carrier return at end of line
			echo  >> $2
    		fi

    		let NUM=$NUM+1
	done

done < $1
