#!/bin/bash
# Usage : MakeBase64+.sh product_imagenes.csv product_base64+.csv
# product_imagen.csv columns are : externalID, jpg, nombre
# product_imagen.csv separator MUST BE ;

ext=".jpg"
a="_product_template"
b1="_01"
c1="-01"
b2="_02"
c2="-02"
b3="_03"
c3="-03"

echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"Image\" > $2

while IFS=";" read f1 f2 f3 ; do

    if [ -f $f2$c1$ext ]; then
       	# recopy external ID y Encabezados
	echo -n  $f1$b1,$f1$a,$f2$c1, >> $2

	cat $(echo ${f2}$c1 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

	#Carrier return at end of line
	echo  >> $2
    fi
    if [ -f $f2$c2$ext ]; then
	echo -n  $f1$b2,$f1$a,$f2$c2, >> $2
	cat $(echo ${f2}$c2 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi
    if [ -f $f2$c3$ext ]; then
	echo -n  $f1$b3,$f1$a,$f2$c3, >> $2
	cat $(echo ${f2}$c3 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi
done < $1
