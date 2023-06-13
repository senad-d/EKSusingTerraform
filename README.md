# EKSusingTerraform

Terraform will allow us to describe everything as a file or multiple files and then piece them together. 

So what we need to do next is create a Terraform file. 

We’re going to describe a bunch of variables as inputs, describe a security group for our infrastructure, then we’re going to tell a VPC network with Public and Private subnets, then we’re also going to describe an EKS cluster with an auto-scaling worker group for our nodes. 

We will describe a Kubernetes deployment with two pods running Nginx and then finally describe a Kubernetes service of the type load balancer to make Nginx public.