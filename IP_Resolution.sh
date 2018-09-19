#!/bin/bash
echo  "Init..."
echo "IP,Country" > output.txt
echo "  "
inputFile=~/Documents/IP_List
echo "Currently Using...  $inputFile"
echo " "
inputContents=$(cat $inputFile)
for i  in $inputContents
do
	curl -s http://api.ipstack.com/$i?access_key=<Insert your  Key  Here>| jq -r '.ip','.country_name' | tr '\n\' ',' >> output.txt
	echo -e  " " >> output.txt
	echo "Sent $i"
	#echo "curl -s http://api.ipstack.com/$i?access_key=<Insert your  Key  Here>| jq -r '.ip','.country_name' | tr '\n\' ' ' >> output.txt"
done
