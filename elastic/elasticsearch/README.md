# backpack-elasticsearch

![Elasticsearch](../../doc/assets/logos/elasticsearch.png)

Hostnames:

- `elasticsearch-node-1.backpack.test`
- `elasticsearch-node-2.backpack.test`
- `elasticsearch-node-3.backpack.test`

## Services

| Port | Service | Credentials
| ---: | :------ | :----------
| 9200 (node-1), 9201 (node-2), 9202 (node-3) | HTTP [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) | See [`init/configure-accounts.data`](init/configure-accounts.data)
| 9300 (node-1), 9301 (node-2), 9302 (node-3) | Transport | -
