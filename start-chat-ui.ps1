Set-Location -Path $PSScriptRoot
$port = 8000
$pythonExe = Join-Path $PSScriptRoot "..\.venv\Scripts\python.exe"
$server = Start-Process -FilePath $pythonExe -ArgumentList @("-m", "http.server", "$port") -PassThru -WindowStyle Hidden
Start-Sleep -Milliseconds 500
Start-Process "http://127.0.0.1:$port/chat-ui.html"
Write-Host "Chat UI started at http://127.0.0.1:$port/chat-ui.html"
Write-Host "Stop the web server with: Stop-Process -Id $($server.Id)"
