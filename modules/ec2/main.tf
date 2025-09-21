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

# 创建 SSH 密钥对
resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_ssh_key.public_key_openssh

  tags = {
    Name        = "${var.project_name}-${var.environment}-ssh-key"
    Project     = var.project_name
    Environment = var.environment
  }
}

# 生成 SSH 私钥
resource "tls_private_key" "ec2_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 将私钥保存到本地文件
resource "local_file" "private_key" {
  content  = tls_private_key.ec2_ssh_key.private_key_pem
  filename = "${path.root}/ssh_key_file/${var.key_name}.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${path.root}/ssh_key_file/${var.key_name}.pem"
  }
}

# 创建 EC2 实例
resource "aws_instance" "ec2_instance" {
  count = var.instance_count

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnets, count.index % length(var.private_subnets))
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ec2_key.key_name

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-${count.index + 1}"
    Project     = var.project_name
    Environment = var.environment
  }
}