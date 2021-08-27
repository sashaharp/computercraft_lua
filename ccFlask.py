import requests
import argparse
import pyperclip as clip

parser = argparse.ArgumentParser(description='Upload a lua program to Pastebin for CC.')
parser.add_argument('filename')
args = parser.parse_args()
filename = 'src/' + args.filename + '.lua'

f = open(filename)
lua = f.read()
f.close()
headers = {'Content-Type': 'text/plain'}

f = open('.server')
ip = f.read()
f.close()

r = requests.post(ip + "put", data=lua, headers=headers)

str = 'http/paste ' + ip + ' ' + args.filename
print(str)
clip.copy(str)

