provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.vpc.subnet_id
}

module "alb" {
  source     = "./modules/alb"
  subnet_id  = module.vpc.subnet_id
  vpc_id     = module.vpc.vpc_id
  instance_id = module.ec2.instance_id
}
