# stop-n8n.ps1
# Script to stop n8n containers using Podman

$projectDir = "C:\n8n"
Set-Location $projectDir

Write-Host "Stopping containers..." -ForegroundColor Cyan
podman-compose down

Write-Host "`nContainer Status:" -ForegroundColor Cyan
podman ps -a --filter "name=n8n"
