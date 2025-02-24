# Docker

## Зачем

- применяется для управления отдельными контейнерами (сервисами), из которых состоит приложение

Функции:

- Storage
  - [Volume](https://docs.docker.com/engine/storage/volumes/)
  - Mount
- [Network](https://docs.docker.com/engine/network/)
- [Docker Compose](https://habr.com/ru/company/ruvds/blog/450312/) используется для одновременного управления несколькими контейнерами, входящими в состав приложения. Этот инструмент предлагает те же возможности, что и Docker, но позволяет работать с более сложными приложениями.

## Примеры

docker compose up --no-build
docker compose start
docker compose pause
docker compose stop

## Deployment

- [install](https://docs.docker.com/desktop/install/windows-install/)
- D:\Distr\Docker
