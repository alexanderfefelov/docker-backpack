# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly HTTP="http --check-status --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat"

# https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-put-role.html

# https://www.elastic.co/guide/en/logstash/current/ls-security.html
echo -n Creating role logstash_writer...
request='{
  "cluster": [
    "cluster:admin/xpack/monitoring/bulk",
    "manage_ilm",
    "manage_index_templates",
    "monitor"
  ],
  "indices": [
    {
      "names": [
        "logstash*",
        "%3Clogstash*"
      ],
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
$HTTP POST http://elasticsearch-node-1.backpack.test:9200/_security/role/logstash_writer <<< "$request" > /dev/null
echo done

echo -n Creating role telegraph_monitor...
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
$HTTP POST http://elasticsearch-node-1.backpack.test:9200/_security/role/telegraph_monitor <<< "$request" > /dev/null
echo done

echo -n Creating role grafana_reader...
request='{
  "indices": [
    {
      "names": ["logstash-*"],
      "privileges": [
        "read",
        "view_index_metadata"
      ]
    }
  ]
}'
$HTTP POST http://elasticsearch-node-1.backpack.test:9200/_security/role/grafana_reader <<< "$request" > /dev/null
echo done
