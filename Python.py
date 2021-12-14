pip install python-ffmpeg
import requests
url = 'https://www.dropbox.com/s/hs7yoa9hkxa6ugd/vlc-3.0.11.1-w64.7z'
myfile = requests.get(url)
