# Jobs, CronJob

Зачем:

- Пакетная обработка данных
- Команды/специфические задачи

- [Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/) запуск не по расписанию: вручную
- [Cron Job](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) реализует паттерн [Cron Job](../../arch/pattern/cron.job.md): запуск по расписанию

Параметры:

  - запускается на выполнение, и после завершения возвращает соответствующий __код завершения__ (exit status), который сообщает, [является ли результат успешным или неудачным](https://digitrain.ru/articles/279243/).
  - гарантируют, что __один или несколько подов выполнят свои команды__ и успешно завершатся. После завершения всех подов без ошибок, Job завершается.
    - job’ы должны быть __идемпотентными__, есть __риск создания 2х job__ 
      - как решать?
        - не использовать CronJob k8s: поднять ПОД, [внутри crontb](https://habr.com/ru/companies/slurm/articles/526130/)
    - __Ограничение__ выполнения __по времени__ - параметр __activeDeadlineSeconds__ 
    - Возможность одновременного выполнения - параметр __concurrencyPolicy__: Forbid, Allow, Replace
    - удаление Job
      - __ttlSecondsAfterFinished__ - количество секунд, по истечении которых Job может быть __автоматически удален__ после его завершения (либо Completed, либо Failed). Это также __удаляет зависимые объекты__, такие как Pod
      - __failedJobHistorLimit__ - кол-во Job в кластере сбойных для удаления
      - __successfulJobHistoryLimit__ - кол-во Job в кластере завершенных успешно для удаления
    - [при сбоях](https://habr.com/ru/companies/slurm/articles/526130/)
      - __количество повторов__ backoffLimit
      - __restartPolicy__: Never (никогда) и OnFailure    
    - startingDeadlineSeconds
    
  Паттерны

    - [Несколько одиночных Job’ов](https://habr.com/ru/companies/otus/articles/546376/) - параметр __completions__
    - Несколько параллельно запущенных Job’ов (Work Queue) - параметр __parallelism__
   