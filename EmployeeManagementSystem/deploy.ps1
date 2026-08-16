# deploy.ps1
Write-Host "1. Pointing terminal to Minikube Docker environment..." -ForegroundColor Cyan
minikube docker-env | Invoke-Expression

Write-Host "2. Building new Spring Boot Docker image..." -ForegroundColor Cyan
docker build -t employee-backend:latest .

Write-Host "3. Rolling out restart to Kubernetes deployment..." -ForegroundColor Cyan
kubectl rollout restart deployment/backend-api -n employee-system

Write-Host "4. Monitoring rollout status..." -ForegroundColor Cyan
kubectl rollout status deployment/backend-api -n employee-system

Write-Host "Deployment complete!" -ForegroundColor Green