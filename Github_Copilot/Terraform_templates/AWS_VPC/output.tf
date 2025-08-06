output "vpc_id" {
description = "The ID of the VPC"
value = aws_vpc.main.id
}

output "public_subnet_id" {
description = "The ID of the public subnet"
value = aws_subnet.public.id
}

output "private_subnet_id" {
description = "The ID of the private subnet"
value = aws_subnet.private.id
}

output "internet_gateway_id" {
description = "The ID of the Internet Gateway"
value = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
description = "The ID of the public route table"
value = aws_route_table.public.id
}

output "security_group_id" {
description = "The ID of the security group"
value = aws_security_group.web_sg.id
}

