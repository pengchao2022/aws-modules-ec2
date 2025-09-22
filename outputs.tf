output "instance_ids" {
  description = "created id of ec2 instances"
  value       = module.ec2_instance.instance_ids
}

output "instance_private_ips" {
  description = "created provate ip of ec2 instances"
  value       = module.ec2_instance.instance_private_ips
}

output "security_group_id" {
  description = "created sg id"
  value       = module.ec2_instance.security_group_id
}

output "instance_private_dns" {
  description = "private dns lists"
  value       = module.ec2_instance.instance_private_dns
}