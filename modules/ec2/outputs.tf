output "instance_ids" {
  description = "ec2 instance id"
  value       = aws_instance.ec2_instance[*].id
}

output "instance_private_ips" {
  description = "ec2 private ip"
  value       = aws_instance.ec2_instance[*].private_ip
}

output "instance_private_dns" {
  description = "ec2 private dns name"
  value       = aws_instance.ec2_instance[*].private_dns
}

output "security_group_id" {
  description = "sg id"
  value       = aws_security_group.ec2_sg.id
}

output "key_pair_name" {
  description = "key name"
  value       = aws_key_pair.ec2_ssh_key.key_name
}

