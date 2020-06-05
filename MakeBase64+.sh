#!/bin/bash
# Usage : MakeBase64+.sh product_imagenes.csv product_base64+.csv
# product_imagen.csv columns are : externalID, jpg, nombre
# product_imagen.csv separator MUST BE ;

a="_product_template"
b="_01"
c="-01"

echo \"External ID\",\"product_tmpl_id/id\",\"name\",\"Image\" > $2

while IFS=";" read f1 f2 f3 ; do

# recopy external ID y Encabezados
echo -n  $f1$b,$f1$a,$f2$c, >> $2

cat $(echo ${f2}${c} | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

#Carrier return at end of line
echo  >> $2
done < $1
