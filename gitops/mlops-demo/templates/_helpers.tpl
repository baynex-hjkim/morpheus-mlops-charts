{{- define "mlops-demo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mlops-demo.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "mlops-demo.name" . -}}
{{- end -}}
{{- end -}}

{{- define "mlops-demo.labels" -}}
app.kubernetes.io/name: {{ include "mlops-demo.name" . }}
app.kubernetes.io/instance: {{ .Values.runId | default .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}
