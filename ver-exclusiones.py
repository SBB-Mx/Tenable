import requests , os
if os.path.exists("exception.json"):
    os.remove("exception.json")
url = "https://cloud.tenable.com/exclusions"
headers = {"Accept": "application/json",
        "X-ApiKeys": "accessKey=;secretKey="}
response = requests.request("GET", url, headers=headers)
print(response.text)
f = open("exception.json", "a")
f.write(response.text+'\n')
f.close
