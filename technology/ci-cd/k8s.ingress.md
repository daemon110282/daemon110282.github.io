# Ingress Controller

[состоит из 2х компонентов](https://habr.com/ru/articles/434524/):

- [Reverse Proxy](../../arch/pattern/deployment/pattern.proxy.reverse.md)
- контроллера который общается с API сервером k8s

Функции:

- сервисные метрики по запросам (две стратегии сбора на уровне - балансировщика\ingress controller)
  - [NGinx](https://habr.com/ru/companies/vk/articles/729796/)
  - [Traefik](https://traefik.io/blog/observing-kubernetes-ingress-traffic-using-metrics/)

![Ingress Controller](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.IC.puml)

Технологии:

- NGinx
- Netscaler
- Traefik