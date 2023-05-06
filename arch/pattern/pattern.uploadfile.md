# Файловый обмен - Upload File

Возможные требования по передаче файлов:

- [Требования по передаче файлов](https://www.artofba.com/post/%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B9-%D0%BA-%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%B8-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D1%8B%D0%B9-%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD)
- Multiple file upload
- Validation and security
- Upload from remote server (FTP, HTTP...)
- Upload from private [storage bucket (S3 or Google Storage)](../../technology/filesystem/object.storage.md)
- Individual progress bar for every file
- Upload notifications
- Разделение на части файла - [Chunking files](https://uploadcare.com/blog/the-file-uploading-guide) over 20 MB
- Parallel upload of files under 20 MB

## Patterns

- [Image API service dedicated](https://www.apollographql.com/blog/backend/file-uploads/file-upload-best-practices) 
- **Signed Upload URL** dedicated storage (On premise, Cloud)
   - It can require a little more work to set up than a dedicated image service but provides for finer control.
- [Google Resumable upload large files > 5Mb](https://developers.google.com/drive/api/guides/manage-uploads)
- __Legacy__: Несколько файлов **multipart/form-data**, and return an ID to the client.
   1. [The client then sends (PUT idempotent) the metadata with the ID](https://tyk.io/blog/api-design-guidance-file-upload), and the server re-associates the file and the metadata.
   2. Send the metadata first, and return an ID to the client. The client then sends the file with the ID, and the server re-associates the file and the metadata.
   3. **CSRF attacks** risk
      1. You should not enable multipart requests (ie, graphql-upload) in your GraphQL server unless you understand how CSRF attacks work and are confident that you have prevented them in your app
      2. exposes your server to CSRF mutation attacks unless you’ve specifically prevented them.
- __Legacy__: include the **Base64** content inside the JSON string
   - Не использовать [base64 кодирования](https://tyk.io/blog/api-design-guidance-file-upload/): increasing the data size by around 33%
   - [add processing overhead in both the server and the client](https://stackoverflow.com/questions/33279153/rest-api-file-ie-images-processing-best-practices) for encoding/decoding.
- Несколько файлов разных типов **multipart/related** request.
   - [The Multipart/Related media](https://stackoverflow.com/questions/4083702/posting-a-file-and-associated-data-to-a-restful-webservice-preferably-as-json) type is intended for compound objects consisting of several inter-related body parts. RFC 2387 specification for more in-depth details.
- [Option](https://tyk.io/blog/api-design-guidance-file-upload/)
   - Direct file upload
      - Create a new file, POST /downloads (endpoint name an example), __response 202 Accepted, Location: /downloads/123__ (unique ID of the download). If we're sharing the files among users, the same POST might return the same ID (all the users are waiting for the same file to generate)
   - Multipart HTTP request
   - Two-step metadata + upload
- [HTTP Status](api-http-status.md)
   - 413 Payload Too Large (if exceeding max)
   - 507 Insufficient Storage (server full).
- API Uploading example [Cloudinary](https://cloudinary.com/documentation/upload_images)

## Security

- [OWASP](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
   - [OWASP Unrestricted File Upload](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
- [OWASP TOP 10](https://www.opswat.com/blog/file-upload-protection-best-practices)
- [OWASP Cheats Sheets](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html)

## Технологии

- [Файловые системы](../../technology/filesystem/filesystem.md)
   - [Распределенные файловые системы](../../technology/filesystem/dfs.md)
   - [Распределенные параллельнае файловые системы](../../technology/filesystem/dpfs.md)
- FTP SFTP - передача файлов
- [Object Storage](../../technology/filesystem/object.storage.md)
