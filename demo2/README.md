# Installation 

```shell
# Create infrastructure
terraform init
terraform plan
terraform apply

# Update kubernetes config
aws eks --region eu-west-1 update-kubeconfig --name learnk8s

# Test config
kubectl get svc

# Runn pods
kubectl apply -f k8s/aws-test.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/public-lb.yaml
kubectl apply -f k8s/private-lb.yaml
kubectl apply -f k8s/cluster-autoscaler.yaml

# Test OIDC IAM
kubectl exec aws-cli -- aws s3api list-buckets

# Delete pods
kubectl delete -f k8s/public-lb.yaml
kubectl delete -f k8s/private-lb.yaml
kubectl delete -f k8s/cluster-autoscaler.yaml
kubectl delete -f k8s/deployment.yaml
kubectl delete -f k8s/aws-test.yaml

# Destroy infrastructure
terraform destroy
```