# VictoriaMetrics 

## Зачем

- It can be used as a drop-in replacement for __Prometheus in Grafana__, [because it supports __Prometheus querying API__](https://docs.victoriametrics.com/Single-server-VictoriaMetrics.html).
- It can be used as a drop-in replacement for __Graphite in Grafana__, because it supports __Graphite API__.
- It supports __metrics' scraping__, ingestion and backfilling via the following protocols:
	- Metrics scraping from Prometheus exporters.
	- Prometheus remote write API.
	- Prometheus exposition format.
	- [From StatsD](https://docs.victoriametrics.com/Single-server-VictoriaMetrics.html#how-to-send-data-from-graphite-compatible-agents-such-as-statsd)
- Параметры метрики - формат [Prometheus](../store/prometheus.md).
- Просмотр метрик
	- GUI MetricsQL [VMUI](https://docs.victoriametrics.com/Single-server-VictoriaMetrics.html#vmui)
	- API
- Alert [VMAlert + Prometheus Alertmanager](https://docs.victoriametrics.com/vmalert.html#single-node-victoriametrics)

## MetricsQL

- [PromQL](../store/prometheus.md)-like query language with a powerful set of functions and features for working specifically with time series data.
- [Примеры запросов](https://docs.victoriametrics.com/keyConcepts.html#metricsql)