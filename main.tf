terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source = "./modules/ec2"

  # 从变量传递 VPC 和子网信息
  vpc_id          = var.vpc_id
  private_subnets = var.private_subnet_ids

  # 实例配置
  instance_count = var.instance_count
  instance_type  = var.instance_type
  key_name       = var.key_name

  # 标签
  project_name = var.project_name
  environment  = var.environment
}