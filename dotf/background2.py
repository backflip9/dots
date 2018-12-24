#!/usr/bin/python3
from PIL import Image
import os
import random
os.remove('background2.png')
random.seed()
r=random.randint(20,255)
g=random.randint(20,255)
b=random.randint(20,255)
tilewidth=random.randint(100,200)
r2=random.randint(20,255)
g2=random.randint(20,255)
b2=random.randint(20,255)
sideindent=random.randint(20,80)
topindent=random.randint(20,80)

img=Image.new('RGB',(1600,900),"white")
pix=img.load()
def create_image():
    columncount=-1
    rgb1=True
    while True:
        rgb1=not rgb1
        for j in range(tilewidth):

            columncount+=1
            rowpixcount=0
            indent=True
            while(rowpixcount<img.size[0]):
                if(indent):
                    for k in range(sideindent):
                        if(rowpixcount>=img.size[0]):
                            break
                        if(columncount>=img.size[1]):
                            return 0
                        if(rgb1):
                            pix[rowpixcount,columncount]=(r2,g2,b2)
                            rowpixcount+=1
                        if(not rgb1):
                            pix[rowpixcount,columncount]=(r,g,b)
                            rowpixcount+=1
                    rgb1=not rgb1
                    indent=False


                for o in range(tilewidth):
                    if(columncount>=img.size[1]):
                        return 0
                    if(rowpixcount>=img.size[0]):
                        break
                    if(rgb1):
                        pix[rowpixcount,columncount]=(r2,g2,b2)
                    if(rgb1 == False):
                        pix[rowpixcount,columncount]=(r,g,b)
                    rowpixcount+=1
                rgb1=not rgb1


create_image()
img.save('background2.png')
