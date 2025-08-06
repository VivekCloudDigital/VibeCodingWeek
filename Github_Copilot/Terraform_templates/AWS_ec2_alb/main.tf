provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "ec2" {
  source     = "./modules/ec2"
  subnet_id  = module.vpc.subnet_ids[0]
  sg_id      = module.vpc.ec2_sg_id
  ami_id     = var.ec2_ami
  instance_type = var.ec2_instance_type
}

module "alb" {
  source      = "./modules/alb"
  subnet_ids  = module.vpc.subnet_ids
  vpc_id      = module.vpc.vpc_id
  ec2_id      = module.ec2.instance_id
  alb_sg_id   = module.vpc.alb_sg_id
}
