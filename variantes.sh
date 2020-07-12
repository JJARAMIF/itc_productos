#!/bin/bash
# Usage : variantes.sh product.variantes.csv variantes.csv
# product.variantes.csv columns are : productID, nombre, jpg, color
# variantes.csv separator MUST BE ;

ptm="_product_template"
ali="_atribute_line"
aid="product_attribute_01"
ava="product_attribute_value_01_"

echo \"product_tmpl_id/id\",\"name\",\"id\",\"attribute_id/id\",\"value_ids/id\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

    cad=""

    if (( ${#f4} > 1 )); then

	echo -n $f1$ptm,$f2,$f1$ali,$aid, >> $2
	bakIFS=$IFS
	IFS="-"

	for item in $f4 ; do
	    case $item in
		"ne") cad=$cad$ava"01,";;
		"gr") cad=$cad$ava"02,";;
		"pl") cad=$cad$ava"03,";;
		"bl") cad=$cad$ava"04,";;
		"do") cad=$cad$ava"05,";;
		"az") cad=$cad$ava"06,";;
		"li") cad=$cad$ava"07,";;
		"pi") cad=$cad$ava"08,";;
		"ro") cad=$cad$ava"09,";;
		"ve") cad=$cad$ava"10,";;
		"am") cad=$cad$ava"11,";;
		*)    echo No hay el color $item;;
	    esac
	done

	IFS=$bakIFS

	cad=${cad:0:${#cad}-1}
    	echo $cad >> $2

    fi

done < $1
