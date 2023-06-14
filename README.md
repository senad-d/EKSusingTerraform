# EKSusingTerraform

Terraform will allow us to describe everything as a file or multiple files and then piece them together. 

So what we need to do next is create a Terraform file. 

This Terraform code provisions an EKS cluster in AWS with associated networking resources such as VPC, subnets, and NAT gateways. It also retrieves the kubeconfig for the cluster and saves it as a local file.