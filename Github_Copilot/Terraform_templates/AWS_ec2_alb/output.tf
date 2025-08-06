output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
