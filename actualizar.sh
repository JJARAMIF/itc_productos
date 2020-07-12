#!/bin/bash
git pull
./MakeBase64.sh productos.csv product.base64.csv
./MakeBase64+.sh productos.csv product.base64+.csv
./clumna.sh producto.csv temp.csv
./variantes.sh temp.csv product.template.attribute.line.csv
rm temp.csv
git add *
git commit -m "Actualizacion"
git push
