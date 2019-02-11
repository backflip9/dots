#!/usr/bin/python3
from PIL import Image
from bs4 import BeautifulSoup
import requests

content=requests.get('https://www.qwertee.com').text
soup=BeautifulSoup(content,features="html.parser")
imageList=soup.find_all("div",{"class","big-slides"})[0].find_all("div",{"class","big-slide"})
counter=1;
for oneImage in imageList:
    img=Image.open(requests.get(oneImage.find("img")['src'],stream=True).raw)
    img.save('./shirt'+str(counter)+'.jpg')
    counter+=1
