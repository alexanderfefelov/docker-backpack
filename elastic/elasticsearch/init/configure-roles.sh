# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly HTTP="http --check-status --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat"

# https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-put-role.html

# https://www.elastic.co/guide/en/logstash/current/ls-security.html
echo -n Creating role logstash_writer...
request='{
  "cluster": [
    "manage_index_templates",
    "monitor"
  ],
  "indices": [
    {
      "names": ["logstash-*"],
      "privileges": ["write","create","create_index","manage"]
    }
  ]
}'
$HTTP POST http://elasticsearch.backpack.test:9200/_security/role/logstash_writer <<< "$request" > /dev/null
echo done
