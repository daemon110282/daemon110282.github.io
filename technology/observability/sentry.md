# Sentry

Инструмент мониторинга исключений (exception), ошибок.

## Зачем

- [Observability](../../arch/ability/observability.md)
  - Traditional logging provides you with a __trail of events__. Some of those events are errors, but many times they’re simply __informational__. Sentry is fundamentally different because we __focus on exceptions__.
  - provides client libraries in every major programming language which instrument your software’s code to capture both error data and tracing telemetry
- [APM](../../arch/system.class/apm.md)
	- [Frontend](https://geekflare.com/frontend-web-monitoring/)
	- performance bottlenecks in your code
- [Security and compliance](https://logz.io/learn/complete-guide-elk-stack/?utm_source=pocket_saves#common-pitfalls:~:text=guide%40logz.io-,Use%20Cases,-The%20ELK%20Stack)
	- SIEM

## Фичи

- Stack traces
- Query
- Dashboard
- Release
- Reproduce Errors Without User Feedback - __Breadcrumbs__ show you events that lead to errors.
- [Nginx + Sentry](https://blog.sentry.io/2019/01/31/using-nginx-sentry-trace-errors-logs)
- Data Collector
	- [From stdout from FluentD Plugin](https://www.fluentd.org/plugins/all)
	- Hardware Sentry is free to use
	- Sentry SDK
		- [GELF To Sentry Adapter](https://mnwa.medium.com/easy-swap-graylog-to-sentry-when-you-have-complexity-infrastructure-5d91c3062c99)
		- [gRPC](https://github.com/m2-oss/sentry-grpc)
	- [RSyslog и Sentry](https://adw0rd.com/2012/12/15/rsyslog-sentry-bridge/)
	- [Drupal module Raven](https://www.drupal.org/project/raven)
- [APM](../../arch/system.class/apm.md)
	- [SPA Vite](https://docs.sentry.io/platforms/javascript/sourcemaps/uploading/vite/?utm_source=pocket_saves)
- Trace
- Alert
	- [Telegram](https://github.com/butorov/sentry-telegram)
- [SSO](https://develop.sentry.dev/self-hosted/sso/)
	- Auth user access by [KeyCloak SAML](https://yyhh.org/blog/2020/10/how-to-setup-saml2-authentication-on-sentry-with-keycloak/)
	- Google OIDC
- [Jira Task Intregration](https://forum.sentry.io/t/how-to-configure-jira-cloud-in-your-on-premise-sentry/6720)

## Технологии

- Архитектура
![arch](https://mermaid.ink/svg/pako:eNqFU01PwzAM_StRTiDGeu8BCbQbcKFc0DwhN_XWqs2H0kQwtv13smSj1SrgFj8_v9gvzo4LXRHP-caiqdnrAhQas3zT3rJ7Y7pGoGu0WrHb2zu2LxaPe9aVu92Txoo9YIdKkD0cQHVlYgDvSTm7ndMnStPRXGiZoWkygOom6522lAHfM0sdbv8uO9IS-v5B5RJ4EQN2FaJr4CtQ_VaWOraobdQZ6KDiDRFtcd3iGLBUNX0o_2GnYuVLnKCSpEBRUzXJGN27jaWp0Fn-qDduYAAmDBGmaGvtewIV2RH90rolMmSnvZ5CbVuyY2sicHJnzPltliF5YcqQmM455MYvAApUnCM5yYDXzpk-z7JN42pfxlXYkEsqWbKbB1oR6QstvAypuG_Az1rp1f7RStt01HqJ9AstPuOSrMSmCou-A8UC0dUkCXgejhWt0XfueOchUNE7XWyV4LmznmbcmwodLRoMX0TyfI1dH9DgVpj5OX2e-IcO3z0YL2M)
- Snuba Clickhouse Kafka Redis
![Clickhouse](https://images.ctfassets.net/em6l9zw4tzag/162no5P9QQXMQbvY7Hu8zz/9170098ce2d51a6c165664d659555975/snuba-diagram.png)
- Тех стек: Python, PostgreSQL, Kafka, Redis, Memcached, Clickhouse

## Плюсы-Минусы

Плюсы:

- [Store support Clickhouse](https://blog.sentry.io/2019/05/16/introducing-snuba-sentrys-new-search-infrastructure/)
- [OpenTelemetry](https://docs.sentry.io/platforms/python/guides/logging/performance/instrumentation/opentelemetry/) support [in work](https://develop.sentry.dev/sdk/performance/opentelemetry/) 	
	- [Demo GO OTEL trace to Sentry](https://medium.com/nuances-of-programming/opentelemetry-и-sentry-недооцененные-инструменты-трассировки-распределенных-систем-на-golang-c34de3dbdff5)
	![scheme](https://miro.medium.com/max/720/0*KLpbhHGa_JixRl-q.webp)
- [дает фокусировку на ошибках](https://infostart.ru/1c/articles/1178723/)
- позволяет получить максимальный контекст в короткое сообщение
- хорошая оптимизация хранения данных. То есть, он не хранит всю подряд информацию, если произошло повторное событие – оно группируется в одно

Минусы:

- не очень хорошо справляется с большим потоком

## Event Model

- [Context](https://docs.sentry.io/platforms/android/enriching-events/context/default-context/)
- [User](https://docs.sentry.io/platforms/android/enriching-events/identify-user/)
- [APM metric custom](https://docs.sentry.io/platforms/python/guides/logging/performance/instrumentation/performance-metrics/)
	- tag - [response size](https://stackoverflow.com/questions/7791860/jquery-how-to-check-the-size-of-the-response-object-in-an-ajax-call)
	- [context](https://stackoverflow.com/questions/69542552/add-additional-details-to-a-sentry-error-using-python-sdk)

## Deployment

- [docker 22.12.0](https://develop.sentry.dev/self-hosted/)
	- [demo](https://gist.github.com/denji/b801f19d95b7d7910982c22bb1478f96)
	- [demo](https://adw0rd.com/2019/02/21/sentry-on-premise-docker/)
	- [On premise docker](https://principal-engineering.ru/posts/getsentry-self-hosted/)
		- BSL __license__ - Если мы [не конкурируем с ними](https://open.sentry.io/licensing/), то [бесплатно](https://forum.sentry.io/t/re-licensing-sentry-faq-discussion/8044)
- [Системные требования](https://github.com/getsentry/self-hosted)
- [Observability Sentry](https://medium.com/@twunde/the-unofficial-guide-to-upgrading-sentry-on-premise-9-to-sentry-10-5e8b4e476349)
	- [health checks](https://docs.sentry.io/product/relay/monitoring/#health-checks)
	- [logs stdout](https://docs.sentry.io/product/relay/monitoring/#logging)
	- [metric in StatsD](https://docs.sentry.io/product/relay/monitoring/#metrics)
		- [model](https://docs.sentry.io/product/relay/monitoring/collected-metrics/)