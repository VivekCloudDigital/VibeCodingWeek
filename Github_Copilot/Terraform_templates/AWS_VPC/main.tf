provider "aws" {
region = "ap-south-1" # Mumbai
}

####################
# VPC
####################
resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
tags = {
Name = "my-vpc"
ResourceGroup = "my-rg"
}
}

####################
# Public Subnet
####################
resource "aws_subnet" "public" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = true

tags = {
Name = "my-public-subnet"
ResourceGroup = "my-rg"
}
}

####################
# Private Subnet
####################
resource "aws_subnet" "private" {
vpc_id = aws_vpc.main.id
cidr_block = "10.0.2.0/24"
availability_zone = "ap-south-1b"

tags = {
Name = "my-private-subnet"
ResourceGroup = "my-rg"
}
}

####################
# Internet Gateway
####################
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main.id

tags = {
Name = "my-igw"
ResourceGroup = "my-rg"
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
Name = "my-public-rt"
ResourceGroup = "my-rg"
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
name = "web-sg"
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
Name = "web-sg"
ResourceGroup = "my-rg"
}
}
