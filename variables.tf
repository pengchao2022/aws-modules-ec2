variable "region" {
  description = "AWS 区域"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "私有子网 ID 列表"
  type        = list(string)
}

variable "instance_count" {
  description = "要创建的 EC2 实例数量"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 实例类型"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH 密钥对名称"
  type        = string
  default     = "ec2-ssh-key"
}

variable "project_name" {
  description = "项目名称，用于资源标签"
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "环境名称，用于资源标签"
  type        = string
  default     = "dev"
}