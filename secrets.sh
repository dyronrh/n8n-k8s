kubectl create secret generic n8n-secrets \
  --from-literal=POSTGRES_USER=n8n \
  --from-literal=POSTGRES_PASSWORD=supersecurepass \
  --from-literal=N8N_BASIC_AUTH_USER=admin \
  --from-literal=N8N_BASIC_AUTH_PASSWORD=strongpassword \
  --from-literal=N8N_LB_IP=192.168.1.151 \
  --from-literal=N8N_ENCRYPTION_KEY=$(openssl rand -hex 32)
