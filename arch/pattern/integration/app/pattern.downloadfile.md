# Download File

## Patterns

- Use [Content Delivery Network (CDN)](../../../system.class/perfofmance/cdn.md)
- Массив байтов, не в JSON. Файл нужно передавать [под его "родным"](https://code-maze.com/aspnetcore-web-api-return-file/) __Content-Type__
- [Byte Array and Stream](https://code-maze.com/aspnetcore-web-api-return-file/)
- Async file complete
	- Request the file, GET /downloads/123, file not yet completed, __response [HTTP Status](../../../../api/api-http-status.md) 102 Processing__ (and an optional progress and/or ETA, if available)
	- Request the file, GET /downloads/123, file completed, __response HTTP Status 303__ See other, Location: https://cdn/full-path-to-generated.file.pdf
- [Support partial responses for large binary resources](https://learn.microsoft.com/en-us/azure/architecture/best-practices/api-design#support-partial-responses-for-large-binary-resources)

## Как вернуть файл в REST API: 5 вариантов реализации

Формулировки «метод возвращает файл» для разработки недостаточно.

Нужно определить:

- где хранится файл
- передаём ли мы его в теле ответа или возвращаем ссылку
- должен ли файл открываться в браузере или скачиваться

### 1. Передать содержимое файла в теле ответа

Подходит, если пользователь должен получить файл сразу, а API самостоятельно проверяет права и передаёт его содержимое.

В теле ответа возвращаются бинарные данные - сам файл.

HTTP/1.1 200 OK
Content-Type: application/pdf
Content-Disposition: attachment; filename="report.pdf"

%PDF-1.7...

Если файл большой, сервер может читать его из хранилища и сразу передавать клиенту частями, не загружая целиком в оперативную память - это уже будет потоковая передача.

[Пример Google Drive](https://developers.google.com/workspace/drive/api/guides/manage-downloads#curl)

### 2. Файл закодированный в Base64

Здесь сервер сначала преобразует байты PDF-файла в строку Base64, а потом помещает её в JSON.

HTTP/1.1 200 OK
Content-Type: application/json

{
  "fileName": "report.pdf",
  "contentType": "application/pdf",
  "content": "JVBERi0xLjcKJ..."
}

Клиент должен:

- получить JSON
- извлечь значение поля content
- декодировать Base64 обратно в байты
- сохранить полученные байты в файл нужного формата

🔺 Base64 без необходимости лучше не использовать: объём данных увеличится примерно на треть, а серверу и клиенту потребуется больше памяти на обработку.

[Пример GitHub](https://docs.github.com/en/rest/repos/contents?apiVersion=2026-03-10#get-repository-content)

### 3. Вернуть временную ссылку

Подходит для больших файлов и файлов из объектного хранилища — например, S3.

API проверяет права пользователя и возвращает ссылку, по которой клиент скачивает файл напрямую из хранилища:

{
  "downloadUrl": "https://storage.example.com/...",
  "expiresAt": "2026-10-20T12:00:00Z"
}

В требованиях нужно указать:

- срок действия ссылки
- для какого файла и HTTP-метода она действует
- можно ли использовать её повторно
- нужно ли журналировать факт выдачи ссылки, не сохраняя сам URL

[Пример для Dropbox](https://docs.dropboxapi.com/dropbox-api/api-reference/user-endpoints/files/get-temporary-link)

### 4. Разделить метаданные и содержимое файла

Подходит, если сначала нужно показать пользователю информацию о файле, а скачивание он запускает отдельно.

Сочетается с любым из трёх способов выше.

GET /files/{fileId}

Метод возвращает метаданные:

{
  "id": "4831",
  "name": "report.pdf",
  "mediaType": "application/pdf",
  "size": 5242880,
  "status": "READY"
}

Сам файл возвращает отдельный метод:

GET /files/{fileId}/content

Примеры Box API:

- получение [информации о файле](https://developer.box.com/reference/get-files-id) (тут и URL на скачивание)
- скачивание [содержимого файла](https://developer.box.com/reference/get-files-id-content)

### 5. Потоковая передача и Range: как отдавать большие файлы в REST API

При передаче больших файлов часто смешивают [два разных механизма](https://t.me/getanalysts/3768):

- потоковую передачу  
- получение файла частями с Range

Но это не одно и то же.

#### Потоковая передача файла

При обычной потоковой передаче клиент отправляет запрос на получение файла:

GET /files/4831/content

Сервер проверяет права пользователя, начинает читать файл из хранилища и сразу передаёт полученные байты клиенту.

Ему не нужно сначала загружать весь файл в оперативную память и только потом формировать ответ.

HTTP/1.1 200 OK
Content-Type: application/pdf
Content-Disposition: attachment; filename="report.pdf"
Content-Length: 5242880

%PDF-1.7...

Для клиента это один обычный HTTP-ответ со всем содержимым файла.

Потоковая передача описывает то, как сервер читает и отправляет данные. Это не отдельный формат ответа и не означает, что файл обязательно можно скачать частями.

👉 Во время потоковой передачи HTTP-ответ остаётся незавершённым, а соединение с клиентом — активным, пока сервер не передаст весь файл или передача не прервётся.

#### Получение файла частями с помощью Range

Если клиенту нужно получить только определённую часть файла, он передаёт заголовок Range:

GET /files/4831/content
Range: bytes=0-1048575

Такой запрос означает:

💡 вернуть байты с позиции 0 по позицию 1048575.

Сервер возвращает не весь файл, а только запрошенный диапазон:

HTTP/1.1 206 Partial Content
Content-Type: application/pdf
Content-Disposition: attachment; filename="report.pdf"
Accept-Ranges: bytes
Content-Range: bytes 0-1048575/5242880
Content-Length: 1048576

Обратите внимание на headers:

- 206 Partial Content — возвращена только часть файла  
- Accept-Ranges: bytes — сервер поддерживает получение файла по диапазонам байтов  
- Content-Range — показывает границы возвращённой части и полный размер файла  
- Content-Length — содержит размер возвращаемой части, а не всего файла

Поддержка Range нужна, например, для:

- возобновления прерванного скачивания
- перемотки видео и аудио  
- параллельной загрузки частей большого файла  
- получения только необходимого фрагмента данных

👉 Что вернуть при некорректном диапазоне

Если клиент запросил диапазон, которого в файле не существует, сервер возвращает:

HTTP/1.1 416 Range Not Satisfiable
Content-Range: bytes */5242880

Число после / показывает полный размер файла.

Например, нельзя запросить байты начиная с позиции 6000000, если размер файла составляет только 5242880 байт.

#### Какие заголовки надо определить в требованиях

```text
Content-Type — формат содержимого файла:
Content-Type: application/pdf
Content-Disposition — как браузер должен обработать файл:
Content-Disposition: attachment; filename="report.pdf"
```

attachment предлагает скачать файл.

Если файл должен открываться в браузере, можно использовать:

```text
Content-Disposition: inline; filename="report.pdf"
Content-Length — размер всего ответа в байтах:
Content-Length: 5242880
```

В ответе 206 Partial Content это размер возвращаемой части файла.

```test
Accept-Ranges — сообщает о поддержке получения файла частями:
Accept-Ranges: bytes
Content-Range — показывает, какой диапазон возвращён:
Content-Range: bytes 0-1048575/5242880
```

#### Как описать в задаче

Можно использовать такую формулировку:

Метод GET /files/{fileId}/content должен проверить наличие файла и права пользователя на его получение.

Если заголовок Range не передан, метод возвращает всё содержимое файла с кодом 200 OK. Сервер должен читать файл из хранилища и передавать его клиенту потоком, не загружая файл целиком в оперативную память.

Если передан корректный заголовок Range, метод возвращает запрошенный диапазон байтов с кодом 206 Partial Content.

Если запрошенный диапазон не существует, метод возвращает 416 Range Not Satisfiable.

Пример [Amazon S3 GetObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)
