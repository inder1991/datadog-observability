
#!/bin/bash

set -e

ENVIRONMENT=${1:-dev}

echo "🚀 Deploying Datadog to: ${ENVIRONMENT}"

# Add Helm repo
helm repo add datadog https://helm.datadoghq.com
helm repo update

# Create namespace
kubectl create namespace datadog --dry-run=client -o yaml | kubectl apply -f -

# Create secrets if not exist
if ! kubectl get secret datadog-api-key -n datadog &> /dev/null; then
  if [ -z "$DD_API_KEY" ]; then
    echo "❌ Set DD_API_KEY environment variable"
    exit 1
  fi
  kubectl create secret generic datadog-api-key \
    -n datadog --from-literal=api-key=$DD_API_KEY
fi


# Install/Upgrade Datadog - SINGLE COMMAND!
helm upgrade --install datadog datadog/datadog \
  --namespace datadog \
  --values base/values-base.yaml \
  --values overlays/${ENVIRONMENT}/values-${ENVIRONMENT}.yaml \
  --wait

echo "✅ Deployment complete!"
kubectl get pods -n datadog
EOF

chmod +x scripts/deploy.sh
git add scripts/
git commit -m "feat: add simple single-chart deployment script"