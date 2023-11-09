{{/*
Expand the name of the chart.
*/}}
{{- define "c8r-name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Define the namespace template if set with global.namespaceOverride or .Release.Namespace is set
*/}}
{{- define "c8r-namespace" -}}
  {{- default .Release.Namespace .Values.global.namespaceOverride -}}
{{- end }}


{{/*
Create labels
*/}}
{{- define "c8r-labels" -}}
app.kubernetes.io/name: {{ include "c8r-name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
ClusterID
*/}}
{{- define "clusterId" -}}
{{- if not .Values.global.clusterId }}
{{- printf "Error: global.clusterId is required but not provided." | fail }}
{{- else -}}
{{- .Values.global.clusterId }}
{{- end -}}
{{- end -}}


{{/*
Endpoint
*/}}
{{- define "endpoint" -}}
{{- if not .Values.global.endpoint }}
{{- printf "Error: global.endpoint is required but not provided." | fail }}
{{- else -}}
{{- .Values.global.endpoint }}
{{- end -}}
{{- end -}}


{{/*
Bearer token
*/}}
{{- define "bearerToken" -}}
{{- if not .Values.global.bearerToken }}
{{- printf "Error: global.bearerToken is required but not provided." | fail }}
{{- else -}}
{{- .Values.global.bearerToken }}
{{- end -}}
{{- end -}}


{{/*
RemoteWrite
*/}}
{{- define "RemoteWrite" -}}
https://{{ include "endpoint" . }}/api/v1/write
{{- end -}}


{{/*
*/}}
