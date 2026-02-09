# Datadog Dashboards Helm Chart

Deploy your Datadog dashboards as Kubernetes CRDs.

## Usage

### Backend Service (Service Health Dashboard)

```bash
helm upgrade --install order-service-dashboards ./dashboards-helm \
  --set service.name=order-service \
  --set environment=prod \
  --set dashboards.serviceHealth.enabled=true
```

### Frontend Service (RUM Business Dashboard)

```bash
helm upgrade --install checkout-frontend-dashboards ./dashboards-helm \
  --set service.name=checkout-frontend \
  --set environment=prod \
  --set dashboards.serviceHealth.enabled=false \
  --set dashboards.rumBusiness.enabled=true
```

## Values

```yaml
service:
  name: ""              # REQUIRED: your service name

environment: "dev"      # dev, staging, prod

dashboards:
  serviceHealth:
    enabled: true       # Backend services
  rumBusiness:
    enabled: false      # Frontend services
```

## Dashboards

### Service Health Dashboard
- Tier 1: Business value & user experience
- Tier 2: RED pattern (Rate, Errors, Duration)
- Tier 3: Debugging & saturation

### RUM Business Dashboard
- Page views and errors
- Core Web Vitals (LCP, FID)
- Performance trends

## Adding Monitors Later

Create a new folder `monitors-helm` with the same structure to add monitors.
