from flask import Flask, render_template, request, url_for
app = Flask(__name__)
from datetime import datetime as dt
import random
from os import listdir

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/content')
def content():
    return render_template('content.html')

@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/server', methods = ['POST'])
def server():

    input = request.get_data().decode().split()


    if input[0] == 'content':
            return "<script>window.location.href = '/content';</script>"
    elif input[0] == 'date':
        return str(dt.now())
    elif input[0] == 'help':
        return 'Try one of these commands: content, date, info, ls, mentoring,  open, random'
    elif input[0] == 'info':
        return 'Terminal interface for http://joshuacook.me<br>Email questions to me@joshuacook.me'
    elif input[0] == 'ls':
        # return str(listdir('static/filesystem'))
        files = listdir('static/filesystem')
        files = sorted(files)
        return '<br>'.join(files)
    elif input[0] == 'mentoring':
        return "<script>window.location.href = '/signup';</script>"
    elif input[0] == 'open':
        return "<script>window.location.href = '/static/filesystem/{}';</script>".format(input[1])
    elif input[0] == 'random':
        return str(random.random())
    else:
        return "ERROR: {}".format(str(input))

if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', port=80)
