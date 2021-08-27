from flask import Flask, request
from werkzeug.utils import secure_filename

api = Flask(__name__)


@api.route('/put', methods=['POST'])
def post_code():
    f = open('/home/ec2-user/luafile', mode='wb+')
    f.write(request.data)
    f.close()
    return "accepted"


@api.route('/')
def get_code():
    f = open('/home/ec2-user/luafile', mode='r')
    txt = f.read()
    f.close()
    return txt


api.run(host='0.0.0.0', port=5000)
