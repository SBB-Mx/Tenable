# Este scrip crea 2 archvios con la lista de escaneos fallidos (aborted) y la lista de todos los escaneos con la fecha que se ejecuta
# Archivo 1 Json formato 
file=aborted-scans-$(date +"%d-%m-%Y").json
# Archivo 2 Json formato
file2=scan-$(date +"%d-%m-%Y").json
# Archivo 3
file3=schedule_uuid-aborted-scans-$(date +"%d-%m-%Y").txt
# peticion de listado de los escaneos
# solo se requiere agrear Keys
curl --request GET --url https://cloud.tenable.com/scans --header 'X-ApiKeys: accessKey=;secretKey=' --header 'accept: application/json' > $file2
# Extrae todos los que tiene un estados de aborted si quieres otro estatus cambiar
jq '.scans | map(select(.status == "aborted"))' $file2 > $file 
jq '. | map(.schedule_uuid)' $file > $file3
# crea una archivo con solo los UUID
awk -F '"' '{print $2 }' $file3 > schedule_uuid.txt
