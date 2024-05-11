# Диагностика Troubleshooting

- [Диагностика Troubleshooting](#диагностика-troubleshooting)
  - [Dump](#dump)
  - [Трассировка](#трассировка)
  - [Use case](#use-case)
    - [High CPU](#high-cpu)
    - [High Latency Timeout](#high-latency-timeout)
    - [Thread pool starvation](#thread-pool-starvation)
    - [GС .NET LOH](#gс-net-loh)

## Dump

- [Windows Debugging Tools](todo) installed on the server (takes longer)
- [ProcDump](todo) (faster)

## Трассировка

- Средствами WCF
  - [Настройка сбора данных](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/tracing/configuring-tracing)
  - Просмотр [трассировки](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/service-trace-viewer-tool-svctraceviewer-exe)
  - [Виды](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/tracing/significant-traces)
    - Трассировка журнала сообщений
      - Существует четыре настраиваемые точки ведения журнала для сообщения: ServiceLevelSendRequest, TransportSend, TransportReceive, ServiceLevelReceiveRequest.
        - Service Level : At this level the message is logged when it is about to leave or enter the code. Secure messages are logged decrypted at this level.
        - Transport Level : At this level messages are logged just before getting encoded or after getting decoded for transmission over wire. Even reliable messaging messages are logged.
        - Malformed Level : All the messages which WCF fails to process due to improper format gets logged.
- или через [FREB](https://www.thebestcsharpprogrammerintheworld.com/2016/06/07/lab-4-install-and-configure-failed-request-tracing/) on [WCF](https://www.thebestcsharpprogrammerintheworld.com/2017/01/16/can-you-trace-wcf-using-failed-request-tracing/)

## Use case

### High CPU

- Признаки
- Проверки
  
### High Latency Timeout

- Признаки
- Проверки

### Thread pool starvation

- Признаки
- Проверки
  
### GС .NET LOH

- Признаки
- Проверки
