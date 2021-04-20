import json
import socket
import sys
import time
import urllib.request, urllib.parse


def main():
    setup_token = get_setup_token()

    installation_data = {
        "prefs": {
            "site_name": "docker-backpack",
            "site_locale": None,
            "allow_tracking": False
        },
        "user": {
            "email": "admin_cahcho1esei5@backpack.test", "password": "shaezece2chi",
            "first_name": "admin", "last_name": "cahcho1esei5"
        },
        "token": setup_token
    }
    session_id = complete_installation(setup_token, installation_data)

    account_data = {
        "email": "user_rahhaik2shaa@backpack.test", "password": "ofohdiej4thu",
        "first_name": "user", "last_name": "rahhaik2shaa",
        "group_ids": None,
        "login_attributes": None
    }
    create_account(session_id, account_data)


def get_setup_token():
    request = create_api_request('session/properties')
    response = None
    for _ in range(42):
        try:
            print('Querying Metabase installer...', end='', flush=True)
            response = urllib.request.urlopen(request, timeout=42)
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
    if not response:
        abort('No response from Metabase')
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
    return setup_token


def complete_installation(setup_token, data):
    data_json = json.dumps(data).encode('utf-8')
    request = create_api_request('setup')
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
    return session_id


def create_account(session_id, data):
    data_json = json.dumps(data).encode('utf-8')
    request = create_api_request('user')
    request.add_header('Content-Type', 'application/json; charset=utf-8')
    request.add_header('X-Metabase-Session', session_id)
    try:
        response = urllib.request.urlopen(request, data_json)
    except urllib.error.HTTPError as e:
        abort('%d %s' % (e.status, e.reason))


def create_api_request(api):
    url = 'http://metabase.backpack.test:3042/api/' + api
    request = urllib.request.Request(url)
    return request


def abort(message):
    print('ERROR %s' % message, file=sys.stderr)
    sys.exit(1)


if __name__ == '__main__':
    main()
