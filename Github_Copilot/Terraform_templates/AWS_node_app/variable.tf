variable "aws_region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI with Node.js support"
  default     = "ami-0c02fb55956c7d316" # Update based on region
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of your AWS key pair"
  type        = string
}
