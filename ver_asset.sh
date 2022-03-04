#!/bin/bash
# listar equipos solo requiere un archivo lista.txt en el cual se requiere el UID
#fecha = date
#$fecha
echo "" > assets.json
while read data
do
        echo $data
        curl --request GET --url https://cloud.tenable.com/assets/$data --header 'Accept: application/json' --header 'X-ApiKeys: accessKey=;secretKey=' >> assets.json
done<lista.txt
jq . assets.json > assets_final.json
