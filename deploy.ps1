$Repo = "ghcr.io/milan-bhimani/cd"
$Tag = "main"
$Image = "$Repo`:$Tag"
$ContainerName = "production-app"
Write-Host "🚀 Starting Deployment Simulation..." -ForegroundColor Cyan
Write-Host "⬇️ Pulling latest image..."
docker pull $Image
Write-Host "🛑 Stopping old container..."
docker stop $ContainerName 2>$null
docker rm $ContainerName 2>$null
Write-Host " Starting new version..."
docker run -d -p 8080:8000 --name $ContainerName$Image
Write-Host "✅ Deployment Complete! App is live at http://localhost:8080" -ForegroundColor Green