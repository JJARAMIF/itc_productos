#!/bin/bash
# Usage : MakeBase64CSV+.sh product_imagen+.csv product_base64+.csv
# product_imagen+.csv columns are : externalID, nombre, producto, url
# product_imagen+.csv separator MUST BE ;

echo \"External ID\",\"Name\",\"product_tmpl_id/id\",\"video_url\",\"Image\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

# recopy external ID
echo -n  $f1,\"$f2\",\"$f3\",\"$f4\", >> $2

#If second  column represents the key to match with the filename, please use this command
cat $(echo ${f1} | tr -d '\r' | tr -d '"').jpg | base64 --wrap=0 >> $2

#Carrier return at end of line
echo  >> $2
done < $1
