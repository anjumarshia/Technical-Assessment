import requests
import json


def get_token_info():
    result = requests.get("http://127.0.0.1:8080/api/auth/token",auth=("shahrukh","abcd1234"),headers={"Content-Type":"application/json"},verify=False)
    token_value = result.json()['token']
    print(result.status_code)
    return token_value

def get_testuser_info():
    new_token = get_token_info()
    result2 = requests.get("http://127.0.0.1:8080/api/users/shahrukh",headers={"Content-Type": "application/json","Token":new_token}, verify=False)
    print(result2.text)

def get_alluser_list():
    new_token = get_token_info()
    result3 = requests.get("http://127.0.0.1:8080/api/users",headers={"Content-Type": "application/json","Token":new_token}, verify=False)
    print(result3.text)

def post_newuser():
    file = open("newuser.json","r")
    new_user = file.read()
    json_value = json.loads(new_user)
    result4 = requests.post("http://127.0.0.1:8080/api/users",data=json_value,headers={"Content-Type": "application/json"}, verify=False)
    print(result4.status_code)
    print(result4.text)

def put_useredit():
    new_token = get_token_info()
    new_values = {
        "firstname": "qwertyXYZXYZ",
        "lastname": "keyboardXYZXYZ"
    }
    result5 = requests.put("http://127.0.0.1:8080/api/users/shahrukh",json=new_values,headers={"Content-Type": "application/json", "Token": new_token}, verify=False)
    print(result5.text)

print(post_newuser())