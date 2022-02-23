{{- define "InstanceGenerator.Generator" -}}
{{- $instances := pick $.Values .Values.InstanceGenerator.key -}}
{{ .Values.InstanceGenerator.key }}:
{{ range $instanceName, $instanceValues := get $instances .Values.InstanceGenerator.key }}
{{ $defaultValues := omit $.Values $.Values.InstanceGenerator.key }}
{{ $Values := mergeOverwrite (deepCopy $defaultValues) $instanceValues }}
  {{ $instanceName }}: {{ $Values | toYaml | nindent 4 }}
{{ end }}
{{- end }}
