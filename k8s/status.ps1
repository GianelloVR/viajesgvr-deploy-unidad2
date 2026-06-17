Write-Host "Pods:"
kubectl get pods -n viajesgvr

Write-Host ""
Write-Host "Services:"
kubectl get svc -n viajesgvr

Write-Host ""
Write-Host "Deployments:"
kubectl get deployments -n viajesgvr