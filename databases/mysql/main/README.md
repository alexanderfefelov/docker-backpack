# backpack-mysql-main

![MySQL](../../../doc/assets/logos/mysql.png)

Hostnames:

- `mysql-main-backup.backpack.test`
- `mysql-main-master.backpack.test`
- `mysql-main-slave.backpack.test`

## Services

| Port | Service | Credentials
| ---: | :------ | :----------
| 3306 (master), 3308 (backup), 3309 (slave) | MySQL classic protocol | `activemq_feizievoudai` / `axiechiemoht` <sup>*</sup>
| | | `backup_letocryloite` / `almatramushi`
| | | `bgbilling_nah0queithei` / `feizudi1xu9h` <sup>*</sup>
| | | `cubesviewer_server_odogymahouli` / `inceadeavoca` <sup>*</sup>
| | | `fastnetmon_boeweewoonee` / `uheeghienoej` <sup>*</sup>
| | | `fleet_fiedabaetivu` / `iengeemiutuw` <sup>*</sup>
| | | `gitea_vahkamiichae` / `ahphuzahphei` <sup>*</sup>
| | | `grafana_solenstgalog` / `peritypindol` <sup>*</sup>
| | | `graphite_comoneigalky` / `strignenecoi` <sup>*</sup>
| | | `guacamole_peoghonahmoh` / `gechaegiezav` <sup>*</sup>
| | | `healthcheck_tutedojobu` / `adqafzubjutk`
| | | `killbill_shiezouceeng` / `aghahticeiri` <sup>*</sup>
| | | `librespeed_gohsotahleit` / `thuchusohgie` <sup>*</sup>
| | | `mattermost_fepheedooroh` / `thohrawaenee` <sup>*</sup>
| | | `metabase_licideophaig` / `msorphorylac` <sup>*</sup>
| | | `redmine_shaeM8oong9A` / `ucapah7kai1I` <sup>*</sup>
| | | `replicator_avaternetrai` / `ergatecuserb`
| | | `root` / `camycorymicu`
| | | `rundeck_bineurvendle` / `nocionersava` <sup>*</sup>
| | | `telegraf_resterfigral` / `mpyrismelort`
| | | `xwiki_thezoepebood` / `ohphahshielu` <sup>*</sup>
| | | `zabbix_webarnalastr` / `dentinguarne` <sup>*</sup>

<sup>*</sup> denotes credentials that will be created by the appropriate containers.

## Databases

| Name | Description
| :--- | :----------
| `activemq` | [ActiveMQ](../../../message-queues/activemq)
| `bgbilling` | [BGBilling](../../../commerce/bgbilling)
| `cubesviewer_server` | [CubesViewer Server](../../../business-intelligence/cubesviewer-server)
| `fastnetmon` | [FastNetMon](../../../network-monitoring/fastnetmon) |
| `fleet` | [Fleet](../../../fleet)
| `gitea` | [Gitea](../../../gitea)
| `grafana` | [Grafana](../../../grafana)
| `graphite` | [Graphite](../../../graphite-statsd)
| `guacamole` | [Guacamole](../../../guacamole/frontend)
| `killbill` | [Kill Bill](../../../killbill/killbill)
| `librespeed` | [LibreSpeed](../../../librespeed)
| `mattermost` | [Mattermost](../../../mattermost)
| `metabase` | [Metabase](../../../business-intelligence/metabase)
| `redmine` | [Redmine](../../../bug-tracking/redmine)
| `rundeck` | [Rundeck](../../../rundeck)
| `xwiki` | [XWiki](../../../xwiki)
| `zabbix` | [Zabbix](../../../network-monitoring/zabbix)
