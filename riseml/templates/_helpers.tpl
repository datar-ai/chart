{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helpers from PostgreSQL-Chart */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "postgresql.name" -}}
{{- "postgresql" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- $name := "postgresql" -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for networkpolicy.
*/}}
{{- define "postgresql.networkPolicy.apiVersion" -}}
{{- if and (ge .Capabilities.KubeVersion.Minor "4") (le .Capabilities.KubeVersion.Minor "6") -}}
"extensions/v1beta1"
{{- else if ge .Capabilities.KubeVersion.Minor "7" -}}
"networking.k8s.io/v1"
{{- end -}}
{{- end -}}

{{/* Get the node selectors for RiseML */}}
{{- define "riseml.nodeSelectors.yaml" -}}
{{- if or (.Values.nodeSelectors.riseml | empty | not) (.Values.nodeSelectors.system | empty | not) }}
nodeSelector:
{{- if not (.Values.nodeSelectors.riseml | empty) }}
{{ toYaml .Values.nodeSelectors.riseml | indent 2 }}
{{- end }}
{{- if not (.Values.nodeSelectors.system | empty) }}
{{ toYaml .Values.nodeSelectors.system | indent 2 }}
{{- end }}
{{- end -}}
{{- end -}}