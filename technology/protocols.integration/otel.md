# OpenTelemetry (OTel) Protocol (OTLP)

Концепция OpenTelemetry (OTel) объединила OpenTracing + OpenCensus.

## Зачем

- __Слабая связность__ средств инструментирования (логи, метрики, трассировки) и сервера сбора данных [Observability](../../arch/ability/observability.md)
	- Стандартизированный формат данных для отправки на сервер сбора данных Observability
	- OpenTelemetry, the promise is that the same naming, concepts, abilities, conventions, etc. will be there in every language you use in your project. It brings universality to the telemetry world.
	- Простота замена сервера сбора данных Observability
	- APIs and SDKs for all the signals are independent of the backends you use for collecting the signals. You don’t have to worry about tight coupling with the solution you choose for storing the telemetry data (eg. Prometheus). 
	- [Цель OTel - предоставить набор стандартизированных независимых от поставщика SDK, API и инструментов для приема](https://opentelemetry.io/docs/concepts/what-is-opentelemetry/), преобразования и отправки данных в серверную часть Observability
- [Vendor Lock исключить](https://habr.com/ru/company/ru_mts/blog/537892/)
- Input Data Collector ![Data Collector](https://habrastorage.org/r/w1560/webt/te/5k/cn/te5kcnz9h8pkdd0nr_2papfrr98.png)
	- 2 modes of operation: 
		- you can either use the OpenTelemetry API to __manually instrument the telemetry collection__ from your application 
		- or you can use __automatic instrumentation techniques__ that have already been implemented for some languages.	
	- OTEL Agent ![OTEL Agent](https://habrastorage.org/r/w1560/webt/tu/my/yk/tumyykh5oqpg_-gralg_9h8cy-m.png)
- Pipeline ![pipe](https://habrastorage.org/r/w1560/webt/ky/9x/am/ky9xam8dsqhwdukqh5indpynfp4.png)
- Export  
	- Metric
		- Prometheus Metric ![schema](https://habrastorage.org/r/w1560/webt/2l/8k/l1/2l8kl1ck385o93-rqiehzewqudw.png)
		- Victoria Metrics
	- Trace
		- Jaeger
		- Zipkin
	- Logs correlation with Trace [api sdk](https://opentelemetry.io/docs/reference/specification/logs/) __beta__
- [Roadmap Spec](https://github.com/open-telemetry/opentelemetry-specification/blob/main/spec-compliance-matrix.md)

## Архитектура

- typical non-OpenTelemetry observability collection pipeline
![schema](https://opentelemetry.io/docs/reference/specification/logs/img/separate-collection.png)
- typical OpenTelemetry observability collection pipeline
![schema](https://opentelemetry.io/docs/reference/specification/logs/img/unified-collection.png)
- ![arch](https://opentelemetry.io/img/otel_diagram.png)


Based on the [Specification, the APIs and SDKs are implemented](https://scalac.io/blog/opentelemetry-from-a-birds-eye-view-a-few-noteworthy-parts-of-the-project/). There’s a noteworthy distinction between the two:
- __APIs consist of all the abstractions used for instrumentation__, clearly decoupled from their actual implementations. The APIs __do not contain the working functionality__ (they are only there to define what is going to be collected).
- An important part of the SDK is the exporters. After collecting the telemetry signals from your application, 
	- either directly (using the manual instrumentation approach)
	- or indirectly (using the auto-instrumentation), you have to actually emit them. 
	To do that, you have to use an __SDK exporter and configure it to send data to a particular__ destination.
	- Such a destination can be 
		- a telemetry backend of your choice (such as Prometheus, New Relic or Jaeger)
		- or an OpenTelemetry collector.
	- SDKs consist of all the parts that actually __implement the APIs and provide the working functionality__ for collecting and exporting all the signal data.

### The Collector

- You can export the signals
	- directly to the backend
	- of your choice directly from the OpenTelemetry exporter in your application.
- The goal here is to unify the process of telemetry data processing so that you don’t have to set up communication with multiple telemetry tools separately. You just configure __one collector that is able to communicate with all the tools__, and run it alongside your application (eg. in a docker container).
- provides you with some extra functionality you normally might not have, such as __retrying, batching or encryption__.

## OTLP 

- OTLP defines the encoding of telemetry data and the protocol used to exchange data between the client and the server.
- This specification defines how OTLP is implemented __over gRPC and HTTP 1.1 transports__ and specifies Protocol Buffers schema that is used for the payloads.
- OTLP is a request/response style protocols: the clients send requests, the server replies with corresponding responses. This document defines one requests and response type: __Export__.
- All server components MUST support the following __transport compression__ options:
	- No compression, denotated by none.
	- Gzip compression, denoted by gzip.

## Технологии

- [TODO](https://opentelemetry.io/docs/reference/specification/overview/)
- [Demo Official Docker + Jaeger + OTEL Collector + Grafana + Feature Flags](https://github.com/open-telemetry/opentelemetry-demo/blob/main/docs/docker_deployment.md)

Reference:

- [МТС Go](https://habr.com/ru/company/ru_mts/blog/537892/)