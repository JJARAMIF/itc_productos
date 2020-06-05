#!/bin/bash
# Usage : MakeBase64+.sh product_imagenes.csv product_base64+.csv
# product_imagen.csv columns are : externalID, jpg, nombre
# product_imagen.csv separator MUST BE ;

a="_product_template"
b1="_01"
c1="-01"
b2="_02"
c2="-02"
b3="_03"
c3="-03"

echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"jpg\",\"Image\" > $2

while IFS=";" read f1 f2 f3 ; do

# recopy external ID y Encabezados
echo -n  $f1$b1,$f1$a,$f2$c1,${f2}$c1 >> $2

cat $(echo ${f2}$c1 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

#Carrier return at end of line
echo  >> $2

echo -n  $f1$b2,$f1$a,$f2$c2,${f2}$c2 >> $2
cat $(echo ${f2}$c2 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
echo  >> $2

echo -n  $f1$b3,$f1$a,$f2$c3,${f2}$c3 >> $2
cat $(echo ${f2}$c3 | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2
echo  >> $2

done < $1
