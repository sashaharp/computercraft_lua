import argparse
import urllib
import urllib.request
from pbwrap import Pastebin as pb
from hashlib import md5
import pyperclip as clip

urllib.urlopen = urllib.request.urlopen
urllib.urlencode = urllib.parse.urlencode

parser = argparse.ArgumentParser(description='Upload a lua program to Pastebin for CC.')
parser.add_argument('filename')
args = parser.parse_args()
filename = 'src/' + args.filename + '.lua'


f = open('.login')
k, u, p = f.read().split(',')
pbo = pb(k)
pbo.authenticate(u, p)
f.close()

f = open(filename)
lua = f.read()
link = pbo.create_paste(lua, 1, md5(lua.encode()).hexdigest() + '.lua', '10M', 'lua')

str = 'pastebin get ' + link.split('/')[-1] + ' ' + args.filename
print(str)
clip.copy(str)
