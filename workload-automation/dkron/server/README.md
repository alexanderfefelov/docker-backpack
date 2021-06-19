# backpack-dkron-server

![Dkron](../../../doc/assets/logos/dkron.png)

Hostnames:

- `dkron-server-1.backpack.test`
- `dkron-server-2.backpack.test`
- `dkron-server-3.backpack.test`

## Services

### server-1

| Port | Service | Credentials
| ---: | :------ | :----------
| [8900](http://dkron-server-1.backpack.test:8900) | HTTP [API](https://dkron.io/api/) and management console | -
| 8901, 8901/udp | Serf | -
| 8902 | gRPC | -

### server-2

| Port | Service | Credentials
| ---: | :------ | :----------
| [8903](http://dkron-server-2.backpack.test:8903) | HTTP [API](https://dkron.io/api/) and management console | -
| 8904, 8904/udp | Serf | -
| 8905 | gRPC | -

### server-3

| Port | Service | Credentials
| ---: | :------ | :----------
| [8906](http://dkron-server-3.backpack.test:8906) | HTTP [API](https://dkron.io/api/) and management console | -
| 8907, 8907/udp | Serf | -
| 8908 | gRPC | -
