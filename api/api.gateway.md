# API Gateway

* [MSA API Gateway](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern)
* [API Gateway](https://microservices.io/patterns/apigateway.HTML)

## Зачем?
    * How can client apps minimize the number of requests to the back end and reduce chatty 
communication to multiple microservices?
    * How can you handle cross-cutting concerns such as authorization, data transformations, and dynamic request dispatching?
    *  How can client apps communicate with services that use non-Internet-friendly protocols(amqp)? 
    * How can you shape a facade especially made for mobile apps?
  * what
    * Reverse proxy or gateway routing. https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing
    * aggregation https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation
    * Cross-cutting concerns or gateway offloading.
      * Authentication and authorization 
      * Service discovery integration 
      * Response caching 
      * Retry policies, circuit breaker, and QoS 
      * Rate limiting and throttling 
      * Load balancing 
      * Logging, tracing, correlation 
      * Headers, query strings, and claims transformation 
      * IP whitelisting
      
* https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading

## Links
