output "instance_ids" {
  description = "创建的 EC2 实例 ID"
  value       = aws_instance.ec2_instance[*].id
}

output "instance_private_ips" {
  description = "创建的 EC2 实例私有 IP"
  value       = aws_instance.ec2_instance[*].private_ip
}

output "instance_private_dns" {
  description = "私有 DNS 名称列表"
  value       = aws_instance.ec2_instance[*].private_dns
}

output "security_group_id" {
  description = "创建的安全组 ID"
  value       = aws_security_group.ec2_sg.id
}

output "key_pair_name" {
  description = "创建的 SSH 密钥对名称"
  value       = aws_key_pair.ec2_ssh_key.key_name
}

