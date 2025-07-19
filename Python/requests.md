# Requests

## installation
```sh
pip install requests
```

## Send a GET request to a specified url
```sh
r = requests.get(url)
```

## return the html code
```sh
print(r.text)
```

## Save the a media file through an url
```sh
r = requests.get(media_url)
with open(media.extension, 'wb') as f:
    f.write(r.content)
```

## get the http status code of a request
```
print(r.status_code)
```
or
```sh
print(r.ok)# return True if the request succeed 
```

## get the headers info of the webpage (such as the name of the server, the charset encoding, ...)
```sh
print(r.headers)
```
## Test http requests
> (httbin)[https://httpbin.org/] is a webpage on which we can test http requests with the `requests` module.

**GET**
_Example_
```sh
payload = {'page': 2, 'count': 25 }
r = requests.get('https://httpbin.org/get', params = payload)
print(r.content)
```

**POST**
> _could be used to fill the forms_
```sh
payload = {'username': 'manu', 'password': 1234 }
r = requests.post('https://httpbin.org/post', data = payload)
print(r.content)
```