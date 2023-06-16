# Installation 

```shell
yum update -y && yum install -y jq gzip nano tar git unzip wget

# Install terraform
curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
unzip /tmp/terraform.zip
chmod +x terraform && mv terraform /usr/local/bin/

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Install helm
wget -q https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/bin/helm
chmod +x /usr/bin/helm

# Add AWS credentials
export AWS_ACCESS_KEY_ID=<ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<SECRET_ACCESS_KEY>

aws sts get-caller-identity

# Connect to eks
aws eks update-kubeconfig --name learnk8s --region eu-west-1

#Create namespace
kubectl create namespace testns

# Run helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm dependency build nginx_helm && helm upgrade management nginx_helm -i --namespace=testns -f ingress-nginx.yaml
```