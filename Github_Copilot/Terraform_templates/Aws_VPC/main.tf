provider "aws" {
region = var.region
}

####################
# VPC
####################
resource "aws_vpc" "main" {
cidr_block = var.vpc_cidr
tags = {
Name = "vpc-${var.resource_group}"
ResourceGroup = var.resource_group
}
}

####################
# Public Subnet
####################
resource "aws_subnet" "public" {
vpc_id = aws_vpc.main.id
cidr_block = var.public_subnet_cidr
availability_zone = var.availability_zone_public
map_public_ip_on_launch = true

tags = {
Name = "public-subnet-${var.resource_group}"
ResourceGroup = var.resource_group
}
}

####################
# Private Subnet
####################
resource "aws_subnet" "private" {
vpc_id = aws_vpc.main.id
cidr_block = var.private_subnet_cidr
availability_zone = var.availability_zone_private

tags = {
Name = "private-subnet-${var.resource_group}"
ResourceGroup = var.resource_group
}
}

####################
# Internet Gateway
####################
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main.id

tags = {
Name = "igw-${var.resource_group}"
ResourceGroup = var.resource_group
}
}

####################
# Public Route Table + Association
####################
resource "aws_route_table" "public" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}

tags = {
Name = "public-rt-${var.resource_group}"
ResourceGroup = var.resource_group
}
}

resource "aws_route_table_association" "public_assoc" {
subnet_id = aws_subnet.public.id
route_table_id = aws_route_table.public.id
}

####################
# Security Group
####################
resource "aws_security_group" "web_sg" {
name = "web-sg-${var.resource_group}"
description = "Allow SSH and HTTP"
vpc_id = aws_vpc.main.id

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

tags = {
Name = "web-sg-${var.resource_group}"
ResourceGroup = var.resource_group
}
}
