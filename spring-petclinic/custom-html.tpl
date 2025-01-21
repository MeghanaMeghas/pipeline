<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trivy Vulnerability Report</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        .critical { background-color: #f8d7da; color: #721c24; }
        .high { background-color: #fff3cd; color: #856404; }
        .medium { background-color: #d1ecf1; color: #0c5460; }
        .low { background-color: #d4edda; color: #155724; }
</style>
</head>
<body>
<div class="container">
<h1 class="text-center mt-4 mb-4">Trivy Vulnerability Report</h1>
<h4>Image: {{ .ArtifactName }}</h4>
<h4>Date: {{ .GeneratedAt }}</h4>
<table class="table table-bordered table-striped">
<thead>
<tr>
<th>Package</th>
<th>Vulnerability ID</th>
<th>Severity</th>
<th>Installed Version</th>
<th>Fixed Version</th>
<th>Links</th>
</tr>
</thead>
<tbody>
                {{ range .Results }}
                {{ range .Vulnerabilities }}
<tr class="{{ .Severity | toLower }}">
<td>{{ .PkgName }}</td>
<td>{{ .VulnerabilityID }}</td>
<td>{{ .Severity }}</td>
<td>{{ .InstalledVersion }}</td>
<td>{{ .FixedVersion }}</td>
<td>{{ range .References }}<a href="{{ . }}" target="_blank">{{ . }}</a><br>{{ end }}</td>
</tr>
                {{ end }}
                {{ end }}
</tbody>
</table>
</div>
</body>
</html>
