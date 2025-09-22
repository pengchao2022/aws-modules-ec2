variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "private subnets lists"
  type        = list(string)
}

variable "instance_count" {
  description = "number of ec2 instances"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
  default     = "ec2-ssh-key"
}

variable "project_name" {
  description = "project name"
  type        = string
  default     = "allen-project"
}

variable "environment" {
  description = "env name like dev,stage,prod..."
  type        = string
  default     = "dev"
}

variable "public_key" {
  description = "The public key material"
  type        = string
}