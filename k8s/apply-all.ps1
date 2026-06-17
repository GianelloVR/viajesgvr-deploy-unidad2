Write-Host "Aplicando base..."
kubectl apply -f .\k8s\00-base\namespace.yml
kubectl apply -f .\k8s\00-base\app-secrets.yml
kubectl apply -f .\k8s\00-base\common-configmap.yml

Write-Host "Aplicando bases de datos..."
kubectl apply -f .\k8s\01-databases

Write-Host "Esperando bases de datos..."
Start-Sleep -Seconds 20

Write-Host "Aplicando infraestructura..."
kubectl apply -f .\k8s\02-infrastructure

Write-Host "Esperando config-server y eureka-server..."
Start-Sleep -Seconds 25

Write-Host "Aplicando microservicios..."
kubectl apply -f .\k8s\03-microservices

Write-Host "Esperando microservicios..."
Start-Sleep -Seconds 25

Write-Host "Aplicando gateway..."
kubectl apply -f .\k8s\04-gateway

Write-Host "Aplicando Keycloak..."
kubectl apply -f .\k8s\05-keycloak

Write-Host "Aplicando frontend..."
kubectl apply -f .\k8s\06-frontend

Write-Host ""
Write-Host "Estado de pods:"
kubectl get pods -n viajesgvr

Write-Host ""
Write-Host "Estado de services:"
kubectl get svc -n viajesgvr