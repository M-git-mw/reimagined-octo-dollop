$dir = Get-Location
$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:8000/"
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Serving $dir at $prefix (press Ctrl+C to stop)"
while ($listener.IsListening) {
  $context = $listener.GetContext()
  $request = $context.Request
  $localPath = $request.Url.AbsolutePath.TrimStart('/')
  if ($localPath -eq '') { $localPath = 'valentine.html' }
  $filePath = Join-Path $dir $localPath
  if (-not (Test-Path $filePath)) {
    $context.Response.StatusCode = 404
    $bytes = [System.Text.Encoding]::UTF8.GetBytes('Not Found')
    $context.Response.ContentType = 'text/plain'
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes,0,$bytes.Length)
    $context.Response.OutputStream.Close()
    continue
  }
  $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
  $mime = switch ($ext) {
    '.html' { 'text/html' }
    '.htm' { 'text/html' }
    '.css' { 'text/css' }
    '.js' { 'application/javascript' }
    '.png' { 'image/png' }
    '.jpg' { 'image/jpeg' }
    '.jpeg' { 'image/jpeg' }
    '.gif' { 'image/gif' }
    default { 'application/octet-stream' }
  }
  $bytes = [System.IO.File]::ReadAllBytes($filePath)
  $context.Response.ContentType = $mime
  $context.Response.ContentLength64 = $bytes.Length
  $context.Response.OutputStream.Write($bytes,0,$bytes.Length)
  $context.Response.OutputStream.Close()
}
