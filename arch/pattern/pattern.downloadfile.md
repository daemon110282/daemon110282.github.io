# Download File

- Use [Content Delivery Network (CDN)](../arch/system.class/cdn.md)
- Массив байтов, не в JSON. Файл нужно передавать [под его "родным"](https://code-maze.com/aspnetcore-web-api-return-file/) __Content-Type__
- [Byte Array and Stream](https://code-maze.com/aspnetcore-web-api-return-file/) 
- Async file complete
	- Request the file, GET /downloads/123, file not yet completed, __response [HTTP Status](../../api/api-http-status.md) 102 Processing__ (and an optional progress and/or ETA, if available)
	- Request the file, GET /downloads/123, file completed, __response HTTP Status 303__ See other, Location: https://cdn/full-path-to-generated.file.pdf
- [Support partial responses for large binary resources](https://learn.microsoft.com/en-us/azure/architecture/best-practices/api-design#support-partial-responses-for-large-binary-resources)