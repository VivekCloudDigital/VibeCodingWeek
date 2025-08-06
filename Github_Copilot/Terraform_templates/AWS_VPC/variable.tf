variable "region" {
description = "AWS region to deploy resources"
default = "ap-south-1"
}

variable "vpc_cidr" {
description = "CIDR block for the VPC"
default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
description = "CIDR block for the public subnet"
default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
description = "CIDR block for the private subnet"
default = "10.0.2.0/24"
}

variable "availability_zone_public" {
description = "Availability zone for the public subnet"
default = "ap-south-1a"
}

variable "availability_zone_private" {
description = "Availability zone for the private subnet"
default = "ap-south-1b"
}

variable "resource_group" {
description = "Tag value for Resource Group"
default = "my-rg"
}
