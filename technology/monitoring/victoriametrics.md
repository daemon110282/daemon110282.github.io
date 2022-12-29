# VictoriaMetrics 

## Зачем

- It can be used as a drop-in replacement for __Prometheus in Grafana__, [because it supports __Prometheus querying API__](https://docs.victoriametrics.com/Single-server-VictoriaMetrics.html).
- It can be used as a drop-in replacement for __Graphite in Grafana__, because it supports __Graphite API__.
- It supports __metrics' scraping__, ingestion and backfilling via the following protocols:
	- Metrics scraping from Prometheus exporters.
	- Prometheus remote write API.
	- Prometheus exposition format.
	- и тд.