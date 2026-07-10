# Админский ЛК

## Зачем

Выполнение сотрудниками поддержки функций:

- администрирования
- анализа проблем под логином клиента

## Паттерны

1.Приходит location  /admin/api/v1/currencyRates
2.Добавляем Header IsAdmin
3.Устанавливаем глобальную переменную IsAdmin=true
4.rewrite удаляем /admin/ c флагом=last

### Разграничение доступа по IP Whitelist из интранет только

- Основная сборка ЛК
- Отдельная админская сборка ЛК где все запросы админские идут на url /admin
- Отдельная админская сборка бэка
- На уровне NGINX
  - проксирование на админскую сборку бэка по /admin
  - проксирование на основную сборку бэка

Пример конфига NGINX:

server {
    listen 443 ssl;
......
    proxy_set_header IsAdmin $isadmin;
.....
    set $isadmin false;
    if ($request_uri ~ ^/admin) {
      set $isadmin true;
    }

	location ~ ^/admin/api/v1/route {
		allow 192.168.0.0/16;
        allow 172.16.0.0/12;
        deny all;        
        rewrite ^/admin/(.*)$ /$1;
	}
	
	location api/v1/currencyRates {
		proxy_pass http://backend1
	}
}
