variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0c94855ba95c71c99" # Amazon Linux 2 (us-east-1)
}

variable "instance_type" {
  default = "t2.micro"
}
