"""
-----
Plocfolio main file
-----
Author: Ploc300
"""
import flask

app = flask.Flask(__name__)

@app.route('/')
def index() -> str:
    """Index page for the app

    Returns:
        str: Hello, World!
    """
    return 'Hello, World!'
