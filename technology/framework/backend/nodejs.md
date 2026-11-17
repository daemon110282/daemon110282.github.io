# Node.js

Программная платформа, основанная на движке V8 (компилирующем JavaScript в машинный код), превращающая JavaScript из узкоспециализированного языка в язык общего назначения.

## Зачем

## Паттерны

- Observability
  - Metric Prometheus Format
    - [prom-client](https://dev.to/oluwatobi2001/optimizing-performance-using-prometheus-with-node-js-for-monitoring-b90)
      - [http-request-count, http error-rates, http latency](https://www.softpost.org/devops/how-to-capture-http-request-count-latency-and-error-rates-with-prometheus)
    - [Alert + Grafana](https://blog.risingstack.com/node-js-performance-monitoring-with-prometheus/)
  - Middleware to __Log__ HTTP API Requests and Responses
    - [moesif](https://www.moesif.com/blog/technical/logging/How-we-built-a-Nodejs-Middleware-to-Log-HTTP-API-Requests-and-Responses/)
    - [morgan](https://github.com/expressjs/morgan)
- [Both HTTP and HTTPS server on one service](https://stackoverflow.com/questions/8355473/listen-on-http-and-https-for-a-single-express-app)
