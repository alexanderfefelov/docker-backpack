# backpack-alertmanager

![Alertmanager](../../doc/assets/logos/prometheus.png)

Hostnames:

- `alertmanager-node-1.backpack.test`
- `alertmanager-node-2.backpack.test`
- `alertmanager-node-3.backpack.test`

## Services

### `alertmanager-node-1.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| [9093](http://alertmanager-node-1.backpack.test:9093) | HTTP [API](https://github.com/prometheus/alertmanager/blob/master/api/v2/openapi.yaml) and management console | -
| 9094, 9094/udp | Cluster | -

### `alertmanager-node-2.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| [9095](http://alertmanager-node-2.backpack.test:9095) | HTTP [API](https://github.com/prometheus/alertmanager/blob/master/api/v2/openapi.yaml) and management console | -
| 9096, 9096/udp | Cluster | -

### `alertmanager-node-3.backpack.test`

| Port | Service | Credentials
| ---: | :------ | :----------
| [9097](http://alertmanager-node-3.backpack.test:9097) | HTTP [API](https://github.com/prometheus/alertmanager/blob/master/api/v2/openapi.yaml) and management console | -
| 9098, 9098/udp | Cluster | -
