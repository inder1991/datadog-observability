{{- define "monitors.serviceName" -}}
{{- .Values.service.name | default .Release.Name }}
{{- end }}
