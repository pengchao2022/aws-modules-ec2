output "instance_ids" {
  description = "创建的 EC2 实例 ID"
  value       = module.ec2_instance.instance_ids
}

output "instance_private_ips" {
  description = "创建的 EC2 实例私有 IP"
  value       = module.ec2_instance.instance_private_ips
}

output "security_group_id" {
  description = "创建的安全组 ID"
  value       = module.ec2_instance.security_group_id
}

output "key_pair_name" {
  description = "创建的 SSH 密钥对名称"
  value       = module.ec2_instance.key_pair_name
}