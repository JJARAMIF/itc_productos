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
b4="_04"
c4="-04"
b5="_05"
c5="-05"
b6="_06"
c6="-06"
b7="_07"
c7="-07"
b8="_08"
c8="-08"

echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"Image\" > $2

while IFS=";" read f1 f2 f3 ; do

    if [ -f $f2$c1$ext ]; then
       	# recopy external ID y Encabezados
	echo -n  $f1$b1,$f1$a,$f2$c1, >> $2

	# transforma a base64
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

    if [ -f $f2$c4$ext ]; then
	echo -n  $f1$b4,$f1$a,$f2$c4, >> $2
	cat $(echo ${f2}$c4 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi

    if [ -f $f2$c5$ext ]; then
	echo -n  $f1$b5,$f1$a,$f2$c5, >> $2
	cat $(echo ${f2}$c5 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi

    if [ -f $f2$c6$ext ]; then
	echo -n  $f1$b6,$f1$a,$f2$c6, >> $2
	cat $(echo ${f2}$c6 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi

    if [ -f $f2$c7$ext ]; then
	echo -n  $f1$b7,$f1$a,$f2$c7, >> $2
	cat $(echo ${f2}$c7 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi

    if [ -f $f2$c8$ext ]; then
	echo -n  $f1$b8,$f1$a,$f2$c8, >> $2
	cat $(echo ${f2}$c8 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
	echo  >> $2
    fi

done < $1
