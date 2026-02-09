# Datadog Monitors Helm Chart

Deploy your Datadog monitors as Kubernetes CRDs.

## Usage

### Deploy Latency Monitor

```bash
helm upgrade --install order-service-monitors ./monitors-helm \
  --set service.name=order-service \
  --set environment=prod \
  --set monitors.latency.threshold=2000
```

### Deploy with Custom Values

```bash
helm upgrade --install my-service-monitors ./monitors-helm \
  --set service.name=my-service \
  --set environment=dev \
  --set monitors.latency.threshold=3000 \
  --set monitors.latency.percentile=p99
```

## Values

```yaml
service:
  name: ""              # REQUIRED: your service name

environment: "dev"      # dev, staging, prod

monitors:
  latency:
    enabled: true
    threshold: 2000     # milliseconds
    percentile: "p95"   # p50, p75, p95, p99
    evaluationWindow: "5m"
```

## Monitors

### High Latency Monitor (P95)
- Alerts when P95 latency exceeds threshold
- 5-minute evaluation window
- Configurable threshold per environment
- Includes actionable remediation steps

## Adding More Monitors

Create new templates following the same pattern:

1. Add monitor config to `values.yaml`
2. Create template in `templates/`
3. Use `{{- if .Values.monitors.yourMonitor.enabled }}`
