# crear un archivo por cada uno de los scans utlila UUID que le pasemos en una archivo (sh listofScans.sh File1.txt)
#el archivo solo debe tener listados los UUID
while read  -r line; do
	curl --request GET --url https://cloud.tenable.com/scans/$line --header 'X-ApiKeys: accessKey=;secretKey=' --header 'accept: application/json' >> salida/$line.json
done<$1
