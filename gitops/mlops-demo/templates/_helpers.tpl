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
app.kubernetes.io/name: {{ include "mlops-demo.name" . | quote }}
app.kubernetes.io/instance: {{ .Values.runId | default .Release.Name | toString | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | quote }}
{{- end -}}
