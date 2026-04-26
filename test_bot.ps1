$response = Invoke-WebRequest -Uri 'http://localhost:5005/webhooks/rest/webhook' `
  -Method POST `
  -ContentType 'application/json' `
  -Body '{"sender":"test_user","message":"Hi, how are you?"}' `
  -UseBasicParsing

Write-Host "=== LLM TEST RESULT ===" -ForegroundColor Green
Write-Host "Status: $($response.StatusCode)" -ForegroundColor Cyan
Write-Host "`nBot Response:"
Write-Host $response.Content -ForegroundColor Yellow
