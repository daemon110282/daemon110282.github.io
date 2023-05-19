# Prometheus

- [Prometheus](#prometheus)
	- [Зачем](#зачем)
	- [Модель данных](#модель-данных)
	- [Deployment](#deployment)

## Зачем

- это база данных временных рядов
- хранит метрики, агрегированные за период времени
- [PromQL](https://prometheus.io/docs/prometheus/latest/querying/examples/)
![schema](https://static.tildacdn.com/tild3932-3264-4264-a430-386464666565/_4.png)

## Модель данных

- метрика
- набор лейблов (теги) key-value
	- instance
	- evn
	- job
- значение метрики
![data model](https://static.tildacdn.com/tild6163-3136-4134-b933-396663633530/_5.png)

[Типы метрик](https://slurm.io/tpost/egiyf928zy-polnoe-rukovodstvo-po-prometheus):

- Счетчик Count - счетчик может __только увеличивать или обнулять число__
- Измерители Gauge - со временем __могут уменьшаться__
- Гистограмма Histogram - агрегация чего-то самим приложением, когда нам интересно знать [распределение величин по заранее определенным группам (buckets)](https://habr.com/ru/company/tochka/blog/685636/)
	- Гистограмма считает количество попаданий в какую-то группу, то есть __запоминает счетчики, а не сами значения__
- Сводки Summary

## Deployment

- [HA](https://habr.com/ru/companies/oleg-bunin/articles/728456/) :  Thanos, Cortex или Mimir
![варианты](https://habrastorage.org/getpro/habr/upload_files/a04/915/5ef/a049155eff8a2d6921e86100584a7919.png)