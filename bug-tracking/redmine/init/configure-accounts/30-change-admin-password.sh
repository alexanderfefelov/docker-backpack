readonly USERNAME=admin_ohmewae5ahyo
readonly PASSWORD=admin
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://redmine.backpack.test:8095

execute_put_request() {
  $HTTP \
    PUT $API/$1
}

execute_put_request users/1.json <<< '{
   "user": {
        "password": "usaeva6tie6a"
    }
}'
