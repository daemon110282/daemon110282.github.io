# Файловый обмен - Upload File

Возможные требования по передаче файлов:

- [Требования по передаче файлов](https://www.artofba.com/post/%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B9-%D0%BA-%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%B8-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D1%8B%D0%B9-%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD)
- Multiple file upload
- Validation and security
- Upload from remote server (FTP, HTTP...)
- Upload from private [storage bucket (S3 or Google Storage)](../../../technology/store/object.storage.md)
- Individual progress bar for every file
- Upload notifications
- Разделение на части файла - [Chunking files](https://uploadcare.com/blog/the-file-uploading-guide) over 20 MB
- Parallel upload of files under 20 MB

## Patterns

- [Image API service dedicated](https://www.apollographql.com/blog/backend/file-uploads/file-upload-best-practices)
- __Signed Upload URL__ dedicated storage
  - On premise\Cloud [Object Storage](../../../technology/store/object.storage.md) S3 [Minio](../../../technology/store/minio.md), Cloudinary
  - It can require a little more work to set up than a dedicated image service but provides for finer control.
- [Google Resumable upload large files > 5Mb](https://developers.google.com/drive/api/guides/manage-uploads)
- Несколько файлов разных типов __multipart/related__ request.
   - [The Multipart/Related media](https://stackoverflow.com/questions/4083702/posting-a-file-and-associated-data-to-a-restful-webservice-preferably-as-json) type is intended for compound objects consisting of several inter-related body parts. RFC 2387 specification for more in-depth details.
- [Option](https://tyk.io/blog/api-design-guidance-file-upload/)
   - Direct file upload
      - Create a new file, POST /downloads (endpoint name an example)
      - __response 202 Accepted, Location: /downloads/123__ (unique ID of the download). If we're sharing the files among users, the same POST might return the same ID (all the users are waiting for the same file to generate)
   - Multipart HTTP request
   - Two-step: metadata + upload
- [HTTP Status](../../../api/api-http-status.md#files)
- API Uploading example [Cloudinary](https://cloudinary.com/documentation/upload_images)

### Сравнение подходов: base64 на клиенте vs. на сервере

| Критерий | Base64 на клиенте | Base64 на сервере |
| - | - | - |
|Передача файла|В теле JSON (fileBase64)|В виде multipart/form-data, передаётся бинарник|
|Размер HTTP-запроса|Увеличен на ~33% из-за base64	|Меньше, т.к. файл передаётся в бинарном виде|
|Проверка размера на клиенте|Простая (до кодирования можно проверить .size)|Также возможна, но менее точная без чтения файла|
|Проверка размера на сервере|Нужно декодировать base64 и вычислять размер|Можно сразу получить Content-Length|
|Производительность|Расходуется память браузера + CPU при кодировании|Сервер тратит CPU на кодирование и хранение|
|Простота реализации|Легко с FileReader, но сложнее дебажить|Используется обычный файл-аплоад, кодирование — на сервере|
|Безопасность	|JSON base64 легче перехватить или залогировать|Меньше риска случайной утечки данных|
|Нагрузка на сеть|Больше, т.к. base64 больше|Меньше, файл идёт как есть|
|Устойчивость к прерыванию|Нет прогресса/возобновления|Возможна под Multipart Upload или chunking|

### Legacy

- __Legacy__: Несколько файлов __multipart/form-data__, and return an ID to the client.
   1. [The client then sends (PUT idempotent) the metadata with the ID](https://tyk.io/blog/api-design-guidance-file-upload), and the server re-associates the file and the metadata.
   2. Send the metadata first, and return an ID to the client. The client then sends the file with the ID, and the server re-associates the file and the metadata.
   3. __CSRF attacks__ risk
      1. You should not enable multipart requests (ie, graphql-upload) in your GraphQL server unless you understand how CSRF attacks work and are confident that you have prevented them in your app
      2. exposes your server to CSRF mutation attacks unless you’ve specifically prevented them.
- __Legacy__: include the __Base64__ content inside the JSON string
   - Не использовать [base64 кодирования](https://tyk.io/blog/api-design-guidance-file-upload/): increasing the data size by around 33%
   - [add processing overhead in both the server and the client](https://stackoverflow.com/questions/33279153/rest-api-file-ie-images-processing-best-practices) for encoding/decoding.

## Security

- [OWASP](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
   - [OWASP Unrestricted File Upload](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
- [OWASP TOP 10](https://www.opswat.com/blog/file-upload-protection-best-practices)
- [OWASP Cheats Sheets](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html)

## Технологии

- [Файловые системы](../../../technology/filesystem/filesystem.md)
   - [Распределенные файловые системы](../../../technology/filesystem/dfs.md)
   - [Распределенные параллельные файловые системы](../../../technology/filesystem/dpfs.md)
- FTP SFTP - передача файлов
- [Object Storage](../../../technology/store/object.storage.md)
