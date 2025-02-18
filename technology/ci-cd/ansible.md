# Ansible

## Зачем

Решение IAC для [CI-CD](../../arch/pattern/deployment/devops.md).

- механизм автоматизации ИТ, который автоматизирует
  - [Управление облачной инфраструктурой](https://practicum.yandex.ru/blog/ansible-sistema-upravleniya-serverami/)
  - Управление контейнерами
  - позволяет __управлять конфигурациями__ машин IAC
  - __доставлять и развёртывать__ приложения CD
  - внутрисервисную __оркестровку__
  - Создание тестовых и разработческих сред
- простой язык (YAML, в форме из Ansible Playbooks), которые позволяют описывать ваши задания автоматизации
- Аналоги: [Puppet, Salt, Chef, Fabric, Terraform](http://lostapp.ru/soft/ansible)

## Плюсы-минусы

Плюсы

- [на управляемые узлы не нужно устанавливать никакого дополнительного ПО, всё работает __через SSH__](https://habr.com/ru/companies/selectel/articles/196620/), в отличии от Puppet, Chef и Salt
- Python  
- графическая панель управления Ansibleworks AWX (до 10 серверов бесплатно)

Минусы:

- MS Windows не поддерживается

## Модель данных

![Схема](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/master/technology/ci-cd/ansible.puml)

## Паттерны

### Управление сертификатами TLS

- [Automate TLS/SSL certificate renewal by Tasks](https://www.grootan.com/blogs/automate-tls-ssl-certificate-renewal-seamlessly-with-ansible)

## Deployment

- [Ansibleworks awx](https://habr.com/ru/companies/pixonic/articles/352184/)