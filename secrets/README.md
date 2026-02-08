# Secrets Management

## External Secrets (Recommended)
```bashApply for each environment
kubectl apply -f datadog-secrets-dev.yaml
kubectl apply -f datadog-secrets-staging.yaml
kubectl apply -f datadog-secrets-production.yaml

## Manual Creation (Testing Only)
```bashkubectl create namespace datadogkubectl create secret generic datadog-api-key 
-n datadog 
--from-literal=api-key=YOUR_API_KEYkubectl create secret generic datadog-app-key 
-n datadog 
--from-literal=app-key=YOUR_APP_KEY

## Vault Paths

- `secret/datadog/dev/api-key`
- `secret/datadog/dev/app-key`
- `secret/datadog/staging/api-key`
- `secret/datadog/staging/app-key`
- `secret/datadog/production/api-key`
- `secret/datadog/production/app-key`
