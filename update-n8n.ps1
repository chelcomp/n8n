# update-n8n.ps1
# Script to update n8n containers using Podman

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

Write-Host "Pulling latest images..." -ForegroundColor Cyan
podman-compose pull

Write-Host "Restarting containers with updated images..." -ForegroundColor Cyan
podman-compose up -d

Write-Host "`nContainer Status:" -ForegroundColor Cyan
podman ps -a --filter "name=n8n"
