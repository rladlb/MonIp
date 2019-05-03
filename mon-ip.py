#!/usr/local/bin/python3.8

import requests
from bs4 import BeautifulSoup

headers = {'user-agent': 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0'}
url = 'http://www.mon-ip.com'


response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, features="html.parser")

ip = soup.find("span", {'id': 'ip4'})
print(ip.get_text())
