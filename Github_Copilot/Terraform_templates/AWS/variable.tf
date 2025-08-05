

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
