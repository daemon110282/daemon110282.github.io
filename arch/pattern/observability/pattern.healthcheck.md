# Health Check

- [Pattern](https://microservices.io/patterns/observability/health-check-api.html) HTTP /health
- Custom HTTP Stats, [Cache Response disable](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/health-checks?source=recommendations&view=aspnetcore-6.0)
- Параметры
	- статус ИС
	- статус компонентов от которых зависит ИС 
	- RAM, CPU используемые ИС
	- версия ИС - в формате семантического версионирования https://semver.org/lang/ru/
- HTTP status code: [200 - healthy, 500 - unhealthy](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/health-checks?view=aspnetcore-7.0#customize-the-http-status-code)


## Технологии

- [ASP.NET Core + UI](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/implement-resilient-applications/monitor-app-health?source=recommendations)
- [Azure](https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-health-introduction)
- k8s [liveness и readiness probes](https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/health-checks?view=aspnetcore-7.0)
	- Readiness indicates if the app is running normally but isn't ready to receive requests.
	- Liveness indicates if an app has crashed and must be restarted.
