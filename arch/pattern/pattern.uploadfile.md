# Файловый обмен

Возможные требования по передаче файлов:

- [Требования по передаче файлов](https://www.artofba.com/post/%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B9-%D0%BA-%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%B8-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D1%8B%D0%B9-%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD)
- Multiple file upload
- Validation and security
- Upload from remote server (FTP, HTTP...)
- Upload from private storage bucket (S3 or Google Storage)
- Individual progress bar for every file
- Upload notifications
- [Chunking files](https://uploadcare.com/blog/the-file-uploading-guide) over 20 MB
- Parallel upload of files under 20 MB

## Patterns

1. [Image API service dedicated](https://www.apollographql.com/blog/backend/file-uploads/file-upload-best-practices) 
2. **Signed Upload URL** dedicated storage (On premise, Cloud)
   - It can require a little more work to set up than a dedicated image service but provides for finer control.
3. [Google Resumable upload large files > 5Mb](https://developers.google.com/drive/api/guides/manage-uploads)
4. Legacy: Несколько файлов **multipart/form-data**, and return an ID to the client.
   1. [The client then sends (PUT idempotent) the metadata with the ID](https://tyk.io/blog/api-design-guidance-file-upload), and the server re-associates the file and the metadata.
   2. Send the metadata first, and return an ID to the client. The client then sends the file with the ID, and the server re-associates the file and the metadata.
   3. **CSRF attacks** risk
      1. You should not enable multipart requests (ie, graphql-upload) in your GraphQL server unless you understand how CSRF attacks work and are confident that you have prevented them in your app
      2. exposes your server to CSRF mutation attacks unless you’ve specifically prevented them.
5. Legacy: include the **Base64** content inside the JSON string
   - Base64 encode the file, at the expense of increasing the data size by around 33%
   - [add processing overhead in both the server and the client](https://stackoverflow.com/questions/33279153/rest-api-file-ie-images-processing-best-practices) for encoding/decoding.
6. Несколько файлов разных типов **multipart/related** request.
   - [The Multipart/Related media](https://stackoverflow.com/questions/4083702/posting-a-file-and-associated-data-to-a-restful-webservice-preferably-as-json) type is intended for compound objects consisting of several inter-related body parts.
   - RFC 2387 specification for more in-depth details.

## Security

- [OWASP](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
- [OWASP TOP 10](https://www.opswat.com/blog/file-upload-protection-best-practices)
- [OWASP Cheats Sheets](https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html)

## Технологии

- [Распределенные файловые системы](../../technology/filesystem/dfs.md)
- [Распределенные параллельнае файловые системы](../../technology/filesystem/dpfs.md)
- FTP SFTP - передача файлов

## Links

- [Cloudinary](https://cloudinary.com/documentation/upload_images)
