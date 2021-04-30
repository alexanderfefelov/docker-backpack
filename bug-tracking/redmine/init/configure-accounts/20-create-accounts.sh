readonly USERNAME=admin_ohmewae5ahyo
readonly PASSWORD=admin
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://redmine.backpack.test:8095

execute_post_request() {
  $HTTP \
    POST $API/$1
}

execute_post_request users.json <<< '{
   "user": {
        "login": "api_shehoh9teigu",
        "password": "meekai6aixey",
        "admin": true,
        "must_change_passwd": false,
        "firstname": "api",
        "lastname": "shehoh9teigu",
        "mail": "api_shehoh9teigu@backpack.test"
    }
}'

execute_post_request users.json <<< '{
   "user": {
        "login": "user_oov3eerae8di",
        "password": "ahah1ahyee0d",
        "admin": false,
        "must_change_passwd": false,
        "firstname": "user",
        "lastname": "oov3eerae8di",
        "mail": "user_oov3eerae8di@backpack.test"
    }
}'
