# terraform-eks

## Description

This repositiory contains the terrafrom files to create an eks cluster with associated VPC.
The VPC has two public and two private subnets in two availability zones. The Nodes are created in the private subnets.

### How to use

To use this repo to provision your infrastruture please create a `terraform.tfvars` file in the cloned directory. Inside the file, add your variables.
