# Datadog Observability

Helm charts for managing Datadog dashboards and monitors.

## 📁 Structure

```
datadog-observability/
├── dashboards-helm/          # ✅ Ready to use
│   ├── Chart.yaml
│   ├── values.yaml
│   ├── README.md
│   └── templates/
│       ├── service-health-dashboard.yaml
│       └── rum-business-dashboard.yaml
│
└── monitors-helm/            # ✅ Ready to use
    ├── Chart.yaml
    ├── values.yaml
    ├── README.md
    └── templates/
        └── latency-monitor.yaml
```

## 🚀 Quick Start

### Deploy Dashboard for Backend Service

```bash
cd dashboards-helm

helm upgrade --install order-service-dashboards . \
  --set service.name=order-service \
  --set environment=prod
```

### Deploy Dashboard for Frontend Service

```bash
helm upgrade --install checkout-frontend-dashboards ./dashboards-helm \
  --set service.name=checkout-frontend \
  --set environment=prod \
  --set dashboards.serviceHealth.enabled=false \
  --set dashboards.rumBusiness.enabled=true
```

### Deploy Monitor for Service

```bash
helm upgrade --install order-service-monitors ./monitors-helm \
  --set service.name=order-service \
  --set environment=prod \
  --set monitors.latency.threshold=2000
```

## 📊 What's Included

### Dashboards (Ready)
- ✅ Service Health Dashboard (RED metrics + SRE Golden Signals)
- ✅ RUM Business Dashboard (Frontend performance metrics)

### Monitors (Ready)
- ✅ High Latency Monitor (P95)

## 📝 Next Steps

1. **Deploy dashboards** for your services
2. **Deploy monitors** for alerting
3. **Verify** in Datadog UI
4. **Customize thresholds** per environment

## 🔗 Resources

- [Dashboards README](./dashboards-helm/README.md)
- [Monitors README](./monitors-helm/README.md)
