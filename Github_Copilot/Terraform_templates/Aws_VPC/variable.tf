variable "region" {
description = "AWS region to deploy resources"
}

variable "vpc_cidr" {
description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
description = "CIDR block for the private subnet"
}

variable "availability_zone_public" {
description = "Availability zone for the public subnet"
}

variable "availability_zone_private" {
description = "Availability zone for the private subnet"
}

variable "resource_group" {
description = "Tag value for Resource Group"
}
