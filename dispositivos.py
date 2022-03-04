import requests
import csv, os
if os.path.exists('salida.json'):
    os.remove('salida.json')
d = open('salida.json','a')
with open('lista.txt') as f:
    for line in f:
        print(line+'\n')
        url = "https://cloud.tenable.com/assets/"+line
        headers = {"Accept": "application/json","X-ApiKeys": "accessKey=;secretKey="}
        response = requests.request("GET", url, headers=headers)
        d.write(response.text+'\n')
        print(response.text)

f.close()
d.close()
