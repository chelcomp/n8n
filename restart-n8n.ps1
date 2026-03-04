# manage-n8n.ps1
# Script to stop and restart n8n containers using Podman

$projectDir = "C:\n8n"
Set-Location $projectDir

Write-Host "Checking Podman machine status..." -ForegroundColor Cyan
$machineStatus = podman machine list --format "{{.LastUp}}"
if ($machineStatus -match "Currently running") {
    Write-Host "Podman machine is already running." -ForegroundColor Green
} else {
    Write-Host "Starting Podman machine..." -ForegroundColor Yellow
    podman machine start
}

Write-Host "Stopping containers..." -ForegroundColor Cyan
podman-compose down

Write-Host "Starting containers..." -ForegroundColor Cyan
podman-compose up -d

Write-Host "`nContainer Status:" -ForegroundColor Cyan
podman ps -a --filter "name=n8n"

Write-Host "`nOpening n8n logs (Press Ctrl+C to stop viewing logs)..." -ForegroundColor Yellow
podman logs -f n8n_n8n_1
