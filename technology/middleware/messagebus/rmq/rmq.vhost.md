# RMQ Virtual host

## Зачем

[RabbitMQ is multi-tenant system](https://www.rabbitmq.com/vhosts.html): connections, exchanges, queues, bindings, user permissions, policies and some other things belong to virtual hosts, logical groups of entities.

- Virtual hosts provide
  - __logical grouping__ [and separation of resources](https://www.cloudamqp.com/blog/what-is-a-rabbitmq-vhost.html#:~:text=Vhosts%20(Virtual%20Hosts)%20in%20RabbitMQ,within%20an%20instance)
  - Separation of physical resources is not a goal of virtual hosts and should be considered an implementation detail.
    - RabbitMQ vhosts are like a virtual machine for a physical server, allowing for multiple secure application operations through virtual rather than physical separation. As the separation is virtual, it is important to remember that the __vhosts are not physically separated__ from each other and therefore they might affect each other’s performance.
- Virtual Hosts are __used to isolate resources__. A determined resource (e.g. exchanges, queues) can be used by more than one virtual host.
- In AMQP, a Virtual Host (a.k.a. 'vhost') is a __namespace for objects__ like Exchanges, Queues and Bindings
- RabbitMQ provides 2 mechanisms to apply segregation.
  - Virtual hosts
  - queues
- A virtual host can be created __per microservice__ which will hold all the logical infrastructure definitions like Queues, Exchanges, users etc. This is a good practice as this allows the teams to manage their [own AMQP topologies](https://www.cloudamqp.com/blog/what-is-a-rabbitmq-vhost.html#:~:text=Vhosts%20(Virtual%20Hosts)%20in%20RabbitMQ,within%20an%20instance)

## Технологии

Support multi bus, virtual host

- [masstransit](https://masstransit-project.com/usage/containers/multibus.html#multibus)
- [Abp.io support in job](https://docs.abp.io/en/abp/4.4/Background-Jobs-RabbitMq)
  - [EventBus](https://docs.abp.io/en/abp/4.4/Distributed-Event-Bus-RabbitMQ-Integration)
- [springboot](https://programmer.group/springboot-connect-multiple-rabbitmq-sources.HTML)
  - https://docs.spring.io/spring-amqp/docs/current/reference/html/#multi-rabbit
  - https://github.com/freenowtech/spring-multirabbit
- [micronaut](https://micronaut-projects.github.io/micronaut-rabbitmq/latest/guide)
- [easynetq](https://stackoverflow.com/questions/64060243/multiple-vhost-connection-inside-same-project-subscribe-publish)
- [celery worker](https://stackoverflow.com/questions/12209652/multi-celery-projects-with-same-rabbitmq-broker-backend-process)
- [Django back end framework](https://timonweb.com/django/run-multiple-django-apps-with-celery-on-one-server-with-rabbitmq-vhosts/)
