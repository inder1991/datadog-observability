# Datadog Observability Infrastructure

GitOps repository for Datadog Agent deployment across kubernetes clusters.

## Repository Structure
```
datadog-observability/
├── base/                    # Base Helm configurations
├── overlays/                # Environment-specific values
│   ├── dev/
│   ├── staging/
│   └── production/
├── argocd/                  # ArgoCD Applications
├── secrets/                 # Sealed secrets
└── docs/                    # Documentation
```

## Deployment

Managed via ArgoCD. See [docs/deployment.md](docs/deployment.md) for details.

## Clusters

- **Dev**: dev-ae1 (UAE Development)
- **Staging**: staging-ae1 (UAE Staging)
- **Production**: 
  - prod-ae1 (UAE)
  - prod-sa1 (Saudi Arabia)
  - prod-eg1 (Egypt)
  - [... additional entities]

## Contacts

- **Owner**: Platform Engineering Team
- **Oncall**: #platform-engineering-oncall
