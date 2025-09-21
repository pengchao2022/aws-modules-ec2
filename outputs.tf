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

output "instance_private_dns" {
  description = "从子模块获取的私有 DNS 名称列表"
  value       = module.ec2_instance.instance_private_dns
}