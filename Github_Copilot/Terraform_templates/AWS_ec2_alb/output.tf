output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "alb_dns_name" {
  value = module.alb.dns_name
}
