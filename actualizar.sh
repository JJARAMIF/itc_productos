#!/bin/bash
git pull
./MakeBase64.sh productos.csv product.base64.csv
./MakeBase64+.sh productos.csv product.base64+.csv
./MakeBase64+.sh productos.csv product.template.attribute.line.csv
git add *
git commit -m "Actualizacion"
git push
