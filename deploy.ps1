# Configuration
$Image = "ghcr.io/milan-bhimani/cd:main"
$ContainerName = "production-app"

Write-Host "--- Starting Deployment ---" -ForegroundColor Cyan

# 1. Pull the image
Write-Host "Step 1: Pulling image..."
docker pull $Image

# 2. Cleanup old container
Write-Host "Step 2: Removing old container..."
docker rm -f $ContainerName 2>$null

# 3. Start new container
Write-Host "Step 3: Starting new container..."
docker run -d -p 8080:8000 --name $ContainerName $Image

Write-Host "--- Deployment Finished! ---" -ForegroundColor Green
Write-Host "Visit: http://localhost:8080"
