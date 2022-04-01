from PIL import Image, ImageDraw, ImageFont #dynamic import


for x in range(100, 110):
    gif=f'frame_{x}_delay-0.01s.gif'
    img = Image.open(gif)
    img.save(gif+".png",'png', optimize=True, quality=70)