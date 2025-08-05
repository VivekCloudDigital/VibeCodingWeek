provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  az_public           = "us-east-1a"
  az_private          = "us-east-1b"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_id
}
[ec2-user@ip-172-31-21-35 aws_ec2_module_1]$ cat variables.tf 
variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}
