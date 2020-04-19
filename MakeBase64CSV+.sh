#!/bin/bash
# Usage : MakeBase64CSV+.sh product_imagenes.csv product_base64+.csv
# product_imagenes.csv columns are : externalID, nombre, producto, url
# product_imagenes.csv separator MUST BE ;

echo \"External ID\",\"Image\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

# recopy external ID y Encabezados
echo -n  \"$f1\", >> $2

#If second  column represents the key to match with the filename, please use this command
cat $(echo ${f2} | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

#Carrier return at end of line
echo  >> $2
done < $1
