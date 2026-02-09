{{- define "dashboards.serviceName" -}}
{{- .Values.service.name | default .Release.Name }}
{{- end }}
