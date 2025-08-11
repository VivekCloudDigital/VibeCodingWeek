variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "ami_id" {
  description = "AMI for EC2 instance"
  default     = "ami-0c94855ba95c71c99" # Amazon Linux 2 (us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}

//adding for ref
