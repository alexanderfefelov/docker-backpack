readonly USERNAME=jasperadmin
readonly PASSWORD=jasperadmin
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://jasperreports.backpack.test:8097/jasperserver/rest_v2

execute_put_request() {
  $HTTP \
    PUT $API/$1
}

execute_put_request users/admin_coopa2eewei6 <<< '{
    "password": "ooh6eilahciy",
    "enabled": true,
    "fullName": "Administrator",
    "roles": [
        {"name": "ROLE_ADMINISTRATOR"},
        {"name": "ROLE_USER" }
    ]
}'

execute_put_request users/user_iolaeshooth2 <<< '{
    "password": "pu9aht3baesu",
    "enabled": true,
    "fullName": "User",
    "roles": [
        {"name": "ROLE_USER"}
    ]
}'

execute_put_request users/jasperadmin <<< '{
    "enabled": false
}'
