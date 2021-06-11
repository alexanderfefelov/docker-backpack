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
    "monitor",
    "manage_ilm"
  ],
  "indices": [
    {
      "names": ["logstash-*"],
      "privileges": [
        "create_index",
        "create",
        "manage_ilm",
        "manage",
        "write"
      ]
    }
  ]
}'
$HTTP POST http://elasticsearch.backpack.test:9200/_security/role/logstash_writer <<< "$request" > /dev/null
echo done

echo -n Creating role telegraph_monitoring_user...
request='{
  "cluster": [
    "monitor"
  ],
  "indices": [
    {
      "names": ["*"],
      "privileges": [
        "monitor"
      ]
    }
  ]
}'
$HTTP POST http://elasticsearch.backpack.test:9200/_security/role/telegraph_monitoring_user <<< "$request" > /dev/null
echo done
