# Security API

## Patterns 

- [API Security Audit](https://docs.42crunch.com/latest/content/concepts/api_contract_security_audit.htm)
- [OWASP](https://42crunch.com/owasp-api-security-top-10/)
  - [Угрозы OWASP подробно](https://habr.com/ru/post/503284/)
- [check api tools](https://platform.42crunch.com/)
- [tools for check api sec](https://github.com/arainho/awesome-api-security)
- [apisecurity.io](https://apisecurity.io/)
- [Control levels of user authorisation](https://www.gov.uk/guidance/gds-api-technical-and-data-standards)
- [API Security tools and resources](https://github.com/arainho/awesome-api-security)
- [openapi security](https://openapi.security/)

## Схемы аутентификации

[Схемы аутентификации](https://habr.com/ru/articles/503284/)

- Token-Based Authentication 
	- [Bearer Authentication](https://devblogs.microsoft.com/dotnet/bearer-token-authentication-in-asp-net-core/)
	- [JWT Bearer](https://learning.postman.com/docs/sending-requests/authorization/authorization-types/#jwt-bearer) обычно токен в формате [JWT](../../technology/jwt.md)   
	- Unlike API key and Basic authentication, token-based authentication offers __higher security__. Tokens can __expire__, reducing the window of vulnerability if compromised, and we can __cryptographically sign__ for added security.
	- Аутентификация [OIDC](../../technology/protocols.integration/oidc.md)
  		- Авторизация [OAuth](../../technology/protocols.integration/oauth.md)
- [API key](https://code-maze.com/aspnetcore-api-key-authentication/) - Данная схема обеспечивает защиту от несанкционированного использования API и позволяет осуществлять, например, проверку лимитов использования API.
	- Лучше перейти на [Bearer Token, JWT Token](https://blog.postman.com/what-is-an-api-key/)
	- .NET Core example in [header](https://code-maze.com/aspnetcore-api-key-authentication/) 
		- "X-API-Key"
		- Authorization header 'Authorization': 'Bearer YOUR_API_KEY' [RFC 7235](https://www.rfc-editor.org/rfc/rfc7235#section-4.2)
	- __key rotation__ and __safe storage__ (Key Value Store - Vault), which leaves their API keys vulnerable to theft
	- Store API keys as [hashed values](https://blog.postman.com/what-is-an-api-key/)
	- Implement [rate limiting](../../arch/pattern/performance/rate.limit.md)
- [cookie](https://blog.bytebytego.com/i/86976622/token-cookie-session)
- ntlm ldap
- http basic
- digest
- form
- swt 
- ws security
- ssl client
