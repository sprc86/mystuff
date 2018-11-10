#!/bin/bash


#source variables.txt

#echo $vartest

url=http://validate.jsontest.com

json=$(curl -X POST -d "json={1:1,2:2,3:3,4:4}"  $url | grep '"size"' | cut -d":" -f2)

#var3=$(curl -X POST -d "json={$key1,$key2,$key3,$key4}"  http://validate.jsontest.com | grep '"size"' | cut -d":" -f2)

#json=1

if [ "$json" -ge "4" ]; then   
	echo "equal or greater than 4 - OK"; exit $json
fi



if [ "$json" -eq "3" ]; then
	echo "greater than 2, but not higher than 4 - WARNING"; exit $json
fi


if [ "$json" -lt "2" ]; then
	echo "less than 2 - CRITICAL"; exit $json
fi
