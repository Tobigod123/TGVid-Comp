#    Copyright (c) 2021 Danish_00
#    Improved By @Zylern

from decouple import config

try:
    APP_ID = config("APP_ID", default=3847632, cast=int)
    API_HASH = config("API_HASH", default="1a9708f807ddd06b10337f2091c67657")
    BOT_TOKEN = config("BOT_TOKEN", default="6498059135:AAH1mMqrtwL5cX-djJqQ9BkNkiN-bcmUFdE")
    DEV = 6748415360
    OWNER = config("OWNER", default=6748415360, cast=int)
    ffmpegcode = ["-preset faster -c:v libx265 -s 854x480 -x265-params 'bframes=8:psy-rd=1:ref=3:aq-mode=3:aq-strength=0.8:deblock=1,1' -metadata 'title=Encoded By TGVid-Comp (https://github.com/Zylern/TGVid-Comp)' -pix_fmt yuv420p -crf 30 -c:a libopus -b:a 32k -c:s copy -map 0 -ac 2 -ab 32k -vbr 2 -level 3.1 -threads 1"]
    THUMBNAIL = config("THUMBNAIL", default="https://telegra.ph/file/1c2a8f45940e4cb43dbeb.jpg")
except Exception as e:
    print("Environment vars Missing! Exiting App.")
    print(str(e))
    exit(1)
