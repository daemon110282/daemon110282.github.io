# Массово-параллельная архитектура (Massive Parallel Processing, MPP)

- Класс параллельных вычислительных систем, состоящих из множества узлов, где каждый узел представляет собой автономную, независимую от других единицу.
- Если применить это определение к области хранилищ данных, то лучше всего его смысл будет отражать термин «распределённые базы данных».
- Каждый узел в распределенной базе данных представляет собой полноценную СУБД, работающую независимо от других. 
- Сама же распределенная база данных – это совокупность независимых, автономных узлов, связанных коммуникационной сетью.

## Плюсы-минусы

- Минусы
  - чтобы соответствовать функциональным требованиям ACID, система должна получить отклик от каждого узла, поэтому коммуникационная сеть между узлами должна обладать высокой пропускной способностью, а также отказоустойчивостью.
- Плюсы
  - линейная масштабируемость, которая обеспечивает стабильные и предсказуемые параметры производительности и развитие системы.

## Технологии

- EMC Greenplum, HP Vertica, Sybase IQ, IBM Netezza, IBM InfoSphere Warehouse и Microsoft PDW.