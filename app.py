import firebase_admin
from firebase_admin import auth
from firebase_admin import credentials
from firebase_admin import db
# import urllib library
from urllib.request import urlopen
# import json
import json
url ='https://raw.githubusercontent.com/Leena-MD/SwapIt_Sprint5/master/serviceAccountKey.json'
response = urlopen(url)

# Initialize the default app
cred = credentials.Certificate(json.loads(response.read()))
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://swapit-474e1-default-rtdb.firebaseio.com/'
})
ref = db.reference('/')
ref.set({
        'boxes': 
            {
                'box001': {
                    'color': 'red',
                    'width': 1,
                    'height': 3,
                    'length': 2
                },
                'box002': {
                    'color': 'green',
                    'width': 1,
                    'height': 2,
                    'length': 3
                },
                'box003': {
                    'color': 'yellow',
                    'width': 3,
                    'height': 2,
                    'length': 1
                }
            }
        })
ref = db.reference('boxes')
box_ref = ref.child('box001')
box_ref.update({
    'color': 'green'
})
        