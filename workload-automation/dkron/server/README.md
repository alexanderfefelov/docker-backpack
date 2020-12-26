# backpack-dkron-server

![Dkron](../../../doc/assets/logos/dkron.png)

Hostnames:

- `dkron-server-1.backpack.test`
- `dkron-server-2.backpack.test`
- `dkron-server-3.backpack.test`

## Services

| Port | Service | Credentials
| ---: | :------ | :----------
| [8900](http://dkron-server-1.backpack.test:8900) (server-1), [8903](http://dkron-server-2.backpack.test:8903) (server-2), [8906](http://dkron-server-3.backpack.test:8906) (server-3) | HTTP [API](https://dkron.io/api/) and management console | -
| 8901 (server-1), 8901/udp (server-1), 8904 (server-2), 8904/udp (server-2), 8907 (server-3), 8907/udp (server-3) | Serf | -
| 8902 (server-1), 8905 (server-2), 8908 (server-3) | gRPC | -
