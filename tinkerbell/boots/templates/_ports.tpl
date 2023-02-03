{{ define "boots.ports" }}
- {{ .PortKey }}: {{ .http.port }}
  name: {{ .http.name }}
  protocol: TCP
  {{- if eq .ServiceType "NodePort" }}
  nodePort: {{ .http.nodePort }}
  {{- end }}
- {{ .PortKey }}: {{ .syslog.port }}
  name: {{ .syslog.name }}
  protocol: UDP
  {{- if eq .ServiceType "NodePort" }}
  nodePort: {{ .syslog.nodePort }}
  {{- end }}
- {{ .PortKey }}: {{ .dhcp.port }}
  name: {{ .dhcp.name }}
  protocol: UDP
  {{- if eq .ServiceType "NodePort" }}
  nodePort: {{ .dhcp.nodePort }}
  {{- end }}
- {{ .PortKey }}: {{ .tftp.port }}
  name: {{ .tftp.name }}
  protocol: UDP
  {{- if eq .ServiceType "NodePort" }}
  nodePort: {{ .tftp.nodePort }}
  {{- end }}
{{- end }}