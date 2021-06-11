# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly CONTAINER_NAME=$1

grep --invert-match --regexp="^#" --regexp="^\s*$" `dirname $0`/configure-accounts.data | \
while IFS=: read -r username password roles; do
  echo -n Creating account $username with roles $roles...
  # https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-put-user.html
  request='{
    "password": "'`echo $password`'",
    "roles": '`echo $roles`'
  }'
  http --check-status --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat \
    POST http://elasticsearch.backpack.test:9200/_security/user/`echo $username` <<< "$request" > /dev/null
  echo done
done

echo -n Deleting installer account...
# https://www.elastic.co/guide/en/elasticsearch/reference/current/users-command.html
docker exec --tty --interactive $CONTAINER_NAME \
  elasticsearch-users userdel installer_uru6oushi7oh
echo done
