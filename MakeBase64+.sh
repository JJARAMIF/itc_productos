#!/bin/bash
# Usage : MakeBase64+.sh product_imagen.csv product_base64+.csv
# product_imagen.csv columns are : externalID, jpg, nombre
# product_imagen.csv separator MUST BE ;


NUM=1
ext=".jpg"
a="_product_template"
b="_0"
c="-0"


echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"Image\" > $2

while IFS=";" read f1 f2 f3 ; do

	while [ $NUM -le 10 ]; do
    
    		b=$b$NUM
    		c=$c$NUM
    		
		if [ -f $f2$c$ext ]; then
       			
			# recopy external ID y Encabezados
			echo -n  $f1$b,$f1$a,$f2$c, >> $2

			# transforma a base64
			cat $(echo ${f2}$c | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

			#Carrier return at end of line
			echo  >> $2
    		fi

    		let NUM=$NUM+1
	done

done < $1
