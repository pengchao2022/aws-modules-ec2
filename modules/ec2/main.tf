# 获取最新的 Ubuntu 20.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# 创建安全组，允许 SSH 访问
resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-${var.environment}-ec2-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # 注意：生产环境中应该限制为特定IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-sg"
    Project     = var.project_name
    Environment = var.environment
  }
}

# 创建AWS密钥对，使用提供的公钥
resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key # 这个变量在tfvars中提供，例如：public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvE1gsc8r+SOjxCavqYSe/ZLtdCKcQr1W2ElvU0Qwp34ynXFTQgnaJKAHWZUj5BmrPdj/u03GH5mzlI2+8gp0UwrbOFqm3S16X3zyEmPzEKnrLWUuYygHejv7x/b2gdu9UlgzQ2QmzLsboIK+SWvnHk0FvuQLtr4AdkCRYKE6TgFVVma/dr0MibeKSQ23+Be1tVf0MznDHvaocoz3xIxqTJynZyxSHnvzHdFGD/m7Ibu3ovRKhUdrYrHaG5x5/M+xbFE6OG7S2E9866LwRoldwffamktZtOC2yunZHlObFpmnFv+EqLSo+ZrPzfsQQS/jLbf9xZJbSL8BEF4epUoirE0q98W6WELxiYo87nMwNT7QMkSw9aBJiFcA6WMRzFzrxhE7o5dmG7UKol6Z5chwd+0Ngn2wASsStM2LtWjbspoJObnjSfQVbCZTNPk6yYkPrKLKEA8Dxy9anqq0CNlgqdv4RDmjH2tbuiv4H6TyTINFjfFxTY4ek8zBwc6xJf1U= ubuntu@ip-172-20-1-15"
}

# 创建 EC2 实例
resource "aws_instance" "ec2_instance" {
  count = var.instance_count

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnets, count.index % length(var.private_subnets))
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ec2_ssh_key.key_name

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
  }
}