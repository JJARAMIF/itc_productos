#!/bin/bash
git pull
./MakeBase64.sh product.imagen.csv product.base64.csv
./MakeBase64+.sh product.imagen.csv product.base64+.csv
git add *
git commit -m "Actualizacion"
git push
