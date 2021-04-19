import json
import socket
import sys
import time
import urllib.request, urllib.parse


def abort(message):
    print('ERROR %s' % message, file=sys.stderr)
    sys.exit(1)


request = urllib.request.Request('http://metabase.backpack.test:3042/api/session/properties')
for _ in range(7):
    try:
        print('Querying Metabase installer...', end='', flush=True)
        response = urllib.request.urlopen(request, timeout=90)
        print('done')
        break
    except urllib.error.HTTPError as e:
        print(e.status, e.reason)
        print('Wait a little...')
        time.sleep(13)
        continue
    except socket.timeout:
        print('timeout expired')
        continue
response_body = response.read().decode('utf8')
try:
    response_json = json.loads(response_body)
    setup_token = response_json['setup-token']
except json.decoder.JSONDecodeError:
    abort('Invalid response received')
except KeyError:
    abort('Setup token not found')
if not setup_token:
    abort('Empty setup token found')

data = {
    "prefs": {
        "site_name": "docker-backpack",
        "site_locale": None,
        "allow_tracking": False
    },
    "user": {
        "email": "admin_cahcho1esei5@backpack.test",
        "first_name": "admin",
        "last_name": "cahcho1esei5",
        "password": "shaezece2chi"
    },
    "token": setup_token
}
data_json = json.dumps(data).encode('utf-8')
request = urllib.request.Request('http://metabase.backpack.test:3042/api/setup')
request.add_header('Content-Type', 'application/json; charset=utf-8')
try:
    response = urllib.request.urlopen(request, data_json)
except urllib.error.HTTPError as e:
    abort('%d %s' % (e.status, e.reason))
response_body = response.read().decode('utf8')
try:
    response_json = json.loads(response_body)
    session_id = response_json['id']
except json.decoder.JSONDecodeError:
    abort('Invalid response received')
except KeyError:
    abort('Session ID not found')
if not setup_token:
    abort('Empty session ID found')

data = {
    "email": "user_rahhaik2shaa@backpack.test",
    "first_name": "user",
    "last_name": "rahhaik2shaa",
    "password": "ofohdiej4thu",
    "group_ids": None,
    "login_attributes": None
}
data_json = json.dumps(data).encode('utf-8')
request = urllib.request.Request('http://metabase.backpack.test:3042/api/user')
request.add_header('Content-Type', 'application/json; charset=utf-8')
request.add_header('X-Metabase-Session', session_id)
try:
    response = urllib.request.urlopen(request, data_json)
except urllib.error.HTTPError as e:
    abort('%d %s' % (e.status, e.reason))
