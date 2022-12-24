echo "Criando as imagens ..."

docker build -t berubel/k8s-backend:1.0 backend/.
docker build -t berubel/k8s-database:1.0 database/.

echo "Realizando push das imagens ..."

docker push berubel/k8s-backend:1.0
docker push berubel/k8s-database:1.0

echo "Criando serviços no cluster kubernetes ..."

kubectl apply -f .\service.yml

echo "Realizando os deployments ..."

kubectl apply -f .\deployment.yml