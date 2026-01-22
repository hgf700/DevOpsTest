$NAME="kubernetes-demo-api"
$USERNAME="hgf70"
$IMAGE="$USERNAME/$NAME`:latest"

Write-Host "building docker image"
docker build -t $IMAGE .

Write-Host "pushing docker image"
docker push $IMAGE

Write-Host "applying kubernetes manifest"
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

kubectl get pods
kubectl get services
kubectl get services "$NAME-service"
