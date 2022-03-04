import json
import csv
#abrir el archivo salida.json
with open('salida2.json') as json_file:
    data = json.load(json_file)
#    print(data)
    json_data = data['assets']
data_file = open('asset_file.csv','w',newline="")
csv_write = csv.writer(data_file)

count = 0
for data in json_data:
    if count == 0:
          header = data.keys()
          csv_write.writerow(header)
          count += 1
    csv_write.writerow(data.values())
data_file.close()
