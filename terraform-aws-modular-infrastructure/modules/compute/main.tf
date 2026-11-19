# Retrieve Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Public Security Group
resource "aws_security_group" "public_sg" {
  name   = "${var.environment}-public-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH from administrator"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-public-sg"
  }
}

# Private Security Group
resource "aws_security_group" "private_sg" {
  name   = "${var.environment}-private-sg"
  vpc_id = var.vpc_id

  ingress {
    description     = "SSH from public EC2"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-private-sg"
  }
}

# Public EC2
resource "aws_instance" "public_vm" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}-public-ec2"
  }
}

# Private EC2
resource "aws_instance" "private_vm" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  tags = {
    Name = "${var.environment}-private-ec2"
  }
}
