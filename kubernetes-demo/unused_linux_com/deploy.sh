set -e

NAME="kubernetes-demo-api"
USERNAMER="hgf70"
IMAGE="$USERNAMER/$NAME:latest"

echo "building docker image"
docker build -t $IMAGE .

echo "pusghing docker image"
docker push $IMAGE

echo "applying kubernetes manifest (yamls)"
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "getting pods"
kubectl get pods

echo "getting services"
kubectl get services

echo "getting main services"
kubectl get services $NAME-service

