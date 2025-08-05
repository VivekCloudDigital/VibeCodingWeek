variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default     = "ami-0123456789abcdef0"
  description = "AMI ID for EC2 instance"
}
