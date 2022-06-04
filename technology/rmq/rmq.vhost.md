# RMQ Vhost

[RabbitMQ is multi-tenant system](https://www.rabbitmq.com/vhosts.html): connections, exchanges, queues, bindings, user permissions, policies and some other things belong to virtual hosts, logical groups of entities.
- Virtual hosts provide logical grouping and separation of resources. Separation of physical resources is not a goal of virtual hosts and should be considered an implementation detail.
- Virtual Hosts are used to isolate resources. A determined resource (e.g. exchanges, queues) can be used by more than one virtual host.
- RabbitMQ vhosts are like a virtual machine for a physical server, allowing for multiple secure application operations through virtual rather than physical separation. As the separation is virtual, it is important to remember that the vhosts are not physically separated from each other and therefore they might affect each other’s performance.
- In AMQP, a Virtual Host (a.k.a. 'vhost') is a namespace for objects like Exchanges, Queues and Bindings [1].
- RabbitMQ provides 2 mechanisms to apply segregation. 
  - Virtual hosts and 
  - queues. 
A virtual host can be created per microservice which will hold all the logical infrastructure definitions like Queues, Exchanges, users etc. This is a good practice as this allows the teams to manage their own AMQP topologies. However, this does not stop a virtual host to demand more from the underlying physical RabbitMQ instance.
- https://www.cloudamqp.com/blog/what-is-a-rabbitmq-vhost.html#:~:text=Vhosts%20(Virtual%20Hosts)%20in%20RabbitMQ,within%20an%20instance.

Support multi bus, virtual host:
- https://masstransit-project.com/usage/containers/multibus.html#multibus
- Abp.io support in job https://docs.abp.io/en/abp/4.4/Background-Jobs-RabbitMq
- https://programmer.group/springboot-connect-multiple-rabbitmq-sources.HTML
- https://docs.spring.io/spring-amqp/docs/current/reference/html/#multi-rabbit
- https://github.com/freenowtech/spring-multirabbit
- https://micronaut-projects.github.io/micronaut-rabbitmq/latest/guide
- https://docs.abp.io/en/abp/4.4/Distributed-Event-Bus-RabbitMQ-Integration
- easynetq https://stackoverflow.com/questions/64060243/multiple-vhost-connection-inside-same-project-subscribe-publish
- celery worker https://stackoverflow.com/questions/12209652/multi-celery-projects-with-same-rabbitmq-broker-backend-process
- Django back end framework https://timonweb.com/django/run-multiple-django-apps-with-celery-on-one-server-with-rabbitmq-vhosts/
