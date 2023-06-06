#!/bin/bash

URL=$1
#"3 g k o p w wg ic 3 biz ck diy fa fit gd his lit mu n out sci sp trv xs"
BOARDS=( $2 )

echo "{" > tempfinal.json
for i in "${BOARDS[@]}";
do
    echo $i
    # Wait as to not spam
    sleep 1s
    wget https://${URL}/${i}/catalog -O temp
    awk -F'catalog = ' '{ printf "%s%s", $2, RT }' temp > temp-1
    awk -F'var style' '{ printf "%s%s", $1, RT }' temp-1 > temp-2
    cat temp-2 | jq '.threads | to_entries[] | {id: .key, sticky: .value.sticky, head: .value.sub, body: .value.teaser} | select((.sticky) or (.head | ascii_downcase | contains("general")) or (.head | ascii_downcase | contains("friendly")))' > temp.json
    echo "\"${i}\":" | tr -d '\n'>> tempfinal.json
    jq -s '.' temp.json >> tempfinal.json
    echo "," >> tempfinal.json
done
sed -i '$ s/,$//g' tempfinal.json
echo "}">> tempfinal.json
jq "." tempfinal.json > final.json
rm temp*
