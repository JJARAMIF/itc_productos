#!/bin/bash
# Usage : columna.sh productos.csv
# productos.csv columns are : id, nombre, jpg, color
# productos.csv separator MUST BE ;

while IFS=";" read f1 f2 f3 f4 ; do

    echo -n $f1";"$f2";"$f3";"$f4";fin" >> $2
    echo >> $2

done < $1
