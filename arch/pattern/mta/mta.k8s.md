# Kubernetes multi-tenancy

- Два подхода:
	- Soft Multi-tenancy
	- Hard multi-tenancy assumes tenants to be malicious and therefore advocates zero trust between them. Tenant resources are isolated and access to other tenant’s resources is not allowed.
- Namespace isolation
- Block traffic between namespaces - Network Policy
- Resource Quotas
- Cluster->x nodes->x pods in node->x контейнер [docker](../../../technology/ci-cd/docker.md)
- making sure that your master and worker nodes are secure at the level of the host operating system.
