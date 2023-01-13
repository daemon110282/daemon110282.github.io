# Prometheus 

- это база данных временных рядов
- хранит метрики, агрегированные за период времени
- [PromQL](https://prometheus.io/docs/prometheus/latest/querying/examples/)
![schema](https://static.tildacdn.com/tild3932-3264-4264-a430-386464666565/_4.png)

## Модель данных:

- метрика
- набор лейблов (теги) key-value
	- instance
	- evn
	- job
- значение метрики
![data model](https://static.tildacdn.com/tild6163-3136-4134-b933-396663633530/_5.png)

[Типы метрик](https://slurm.io/tpost/egiyf928zy-polnoe-rukovodstvo-po-prometheus):

- Счетчик Count - счетчик может только увеличивать или обнулять число
- Измерители Gauge - со временем могут уменьшаться
- Гистограмма - агрегация чего-то самим приложением, когда нам интересно знать [распределение величин по заранее определенным группам (buckets)](https://habr.com/ru/company/tochka/blog/685636/)
	- Гистограмма считает количество попаданий в какую-то группу, то есть __запоминает счетчики, а не сами значения__
- Сводки

