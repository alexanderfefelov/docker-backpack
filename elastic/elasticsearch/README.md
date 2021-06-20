# backpack-elasticsearch

![Elasticsearch](../../doc/assets/logos/elasticsearch.png)

Hostnames:

- `elasticsearch-node-1.backpack.test`
- `elasticsearch-node-2.backpack.test`
- `elasticsearch-node-3.backpack.test`

## Services

### `elasticsearch-node-1.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| 9200 | HTTP [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) | See below
| 9300 | Transport | -

### `elasticsearch-node-2.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| 9201 | HTTP [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) | See below
| 9301 | Transport | -

### `elasticsearch-node-3.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| 9202 | HTTP [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) | See below
| 9302 | Transport | -

## Credentials

### HTTP [API](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html)

See [`init/configure-accounts.data`](init/configure-accounts.data)
