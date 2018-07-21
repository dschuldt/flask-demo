from flask import Flask
import socket

app = Flask(__name__)


@app.route('/')
def startpage():
    version = '1.1'
    hostname = socket.gethostname()
    ip = socket.gethostbyname(hostname)
    return 'Flask Demo v{0} running on {1} ({2})'.format(version, hostname, ip)


if __name__ == '__main__':
    app.run()
