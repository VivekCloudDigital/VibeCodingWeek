provider "aws" {
  region = var.region
}

# 🧠 Dynamically retrieve latest Amazon Linux 2 AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"]
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = data.aws_ami.latest_amazon_linux.id  # ✔ Now dynamic
  subnet_id     = module.vpc.subnet_id
}
