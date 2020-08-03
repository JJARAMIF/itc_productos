#!/bin/bash
# Usage : variantes.sh productos.csv product.template.attribute.line.csv
# productos.csv columns are : id, nombre, jpg, color
# productos.csv separator MUST BE ;

#ptm="_product_template"
ptm=""
ali="_atribute_line_01"
aid="product_attribute_01"
ava="product_attribute_value_01_"

echo \"product_tmpl_id/id\"";"\"name\"";"\"id\"";"\"attribute_id/id\"";"\"value_ids/id\" > $2

while IFS=";" read f1 f2 f3 f4 ; do

    cad=""

    if (( ${#f4} > 1 )); then

	echo -n $f1$ptm";"$f2";"$f1$ali";"$aid";" >> $2
	bakIFS=$IFS
	IFS="-"

	for item in $f4 ; do
	    if (( ${#item} > 1 )); then
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
		    "ci") cad=$cad$ava"12,";;
		    "ma") cad=$cad$ava"13,";;
		    *) echo No existe el color $item
	    	esac
	    fi
	done

	IFS=$bakIFS

	cad=${cad:0:${#cad}-1}
    	echo $cad >> $2

    fi

done < $1
