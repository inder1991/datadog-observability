# Datadog Operator Deployment

GitOps repository for Datadog Operator and DatadogAgent CRD management across multiple clusters.

## Architecture┌─────────────────────────────────────────┐
│         Datadog Operator                │
│  (Manages DatadogAgent Lifecycle)       │
└─────────────────────────────────────────┘
│
▼
┌─────────────────────────────────────────┐
│      DatadogAgent CRD                   │
│  (Declarative Agent Configuration)      │
└─────────────────────────────────────────┘
│
▼
┌─────────────────────────────────────────┐
│   DaemonSet + Deployments               │
│  (Actual Datadog Agent Pods)            │
└─────────────────────────────────────────┘

## Repository Structuredatadog-operator-deployment/
├── operator/                    # Operator installation
│   ├── base/                   # Base operator config
│   └── overlays/               # Environment-specific
├── agents/                      # DatadogAgent CRDs
│   ├── dev/
│   ├── staging/
│   └── production/
├── argocd/                      # ArgoCD Applications
├── secrets/                     # External Secrets
└── docs/                        # Documentation

## Deployment Methods

- **Operator**: Installed via Helm or OpenShift OLM
- **Agents**: Deployed via DatadogAgent CRD
- **GitOps**: Managed by ArgoCD

## Quick Start

See [docs/deployment.md](docs/deployment.md)
