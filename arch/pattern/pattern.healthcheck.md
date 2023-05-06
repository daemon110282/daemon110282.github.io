# Health Check

- [Pattern](https://microservices.io/patterns/observability/health-check-api.html) HTTP /health
- Custom HTTP Stats, [Cache Response disable](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/health-checks?source=recommendations&view=aspnetcore-6.0)
- Параметры
	- статус ИС
	- статус компонентов от которых зависит ИС 
	- RAM, CPU	
	- версия - в формате семантического версионирования https://semver.org/lang/ru/

## Технологии

- [ASP.NET Core + UI](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/implement-resilient-applications/monitor-app-health?source=recommendations)
- [Azure](https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-health-introduction)