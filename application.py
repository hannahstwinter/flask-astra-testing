from flask import Flask
application = Flask(__name__)

@application.route('/')
def init():
    return 'Astra Testing'

if __name__ == '__main__':
    application.run(debug=True,host='0.0.0.0')
