

# Terraform Challenege 1

## Install Terraform V1.1.5

```bash
sudo apt-get update
sudo apt install wget
sudo apt install zip
wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
cp terraform /usr/bin/terraform
```

## Create Provider for Kubernetes

Refer to provider.tf in the config directory

## Create service for Kubernetes

Create a terraform resource webapp-service for kubernetes service with following specs:
- Service name: webapp-service
- Service Type: NodePort
- Port: 8080
- NodePort: 30080

## Create Deployment for Kubernetes

Create a terraform resource frontend for kubernetes deployment with following specs:
- Deployment Name: frontend
- Deployment Labels = name: frontend
- Replicas: 4
- Pod Labels = name: webapp
- Image: kodekloud/webapp-color:v1
- Container name: simple-webapp
- Container port: 8080

