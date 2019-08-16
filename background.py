from PIL import Image
import random
random.seed()
r=random.randint(0,255)
g=random.randint(0,255)
b=random.randint(0,255)
img=Image.new('RGB',(300,300),"white")
pix=img.load()
for j in range(img.size[0]):
    for i in range(img.size[1]):
        pix[j,i]=(r,g,b)
img.save("/home/liam/.bin/background.png")
