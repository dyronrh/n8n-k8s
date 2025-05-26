
# 🚀 n8n en Kubernetes (K3s-ready)

Este proyecto despliega la plataforma de automatización **n8n** en Kubernetes, usando una base de datos PostgreSQL persistente y configuración segura mediante Kubernetes Secrets.

---

## 📦 Archivos incluidos

### `n8n-secrets.yaml`
Contiene un `Secret` tipo `Opaque` con variables sensibles como:

- Contraseña de PostgreSQL (`DB_POSTGRESDB_PASSWORD`)
- Contraseña y clave de autenticación para el panel de n8n
- Clave de encriptación (`N8N_ENCRYPTION_KEY`)

### `n8n.yaml`
Despliega la aplicación `n8n` como un `Deployment` con:

- Imagen oficial `n8nio/n8n:latest`
- Variables de entorno leídas desde el `Secret`
- Recursos configurados (2–4 GiB RAM, 2–4 CPU)
- Escucha en el puerto `5678`

### `postgres.yaml`
Despliega una instancia de PostgreSQL con almacenamiento persistente:

- PVC de 5GiB
- Imagen `postgres:15`
- Variables inyectadas desde `n8n-secrets.yaml`

---

## 🛠 Requisitos

- Kubernetes (probado con K3s)
- `kubectl` configurado
- PersistentVolume dinámico (o local-path-provisioner)
- Dominio (DuckDNS https://www.duckdns.org/domains ) si usarás TLS
- kubevip para balancear carga entre el cluster(no se necesita si es standalone) https://kube-vip.io/

---

## 🚀 Cómo desplegar

```bash
kubectl create namespace n8n
kubectl apply -f n8n-secrets.yaml -n n8n
kubectl apply -f postgres.yaml -n n8n
kubectl apply -f n8n.yaml -n n8n
```
