terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  version = "~> 3.27"
  region  = "us-east-2"
}


#userdata AWS Resource AWS_Instance
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
resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  key_name        = var.key
  user_data       = <<-EOT
#cloud-config
#Downloads the and golang
packages:
 - apache2
 - golang-go
 - git
runcmd:
 - mkdir /home/ubuntu/go
 - export GOPATH=/home/ubuntu/go
 - go get github.com/hashicorp/learn-go-webapp-demo
EOT
  security_groups = [aws_security_group.allow_tls.name]

  tags = {
    Name = "${var.env}"
  }
}
#Security Groups used in User Data
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description      = "TLS from VPC HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description      = "TLS from VPC SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.selected.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
#VPC user Data

data "aws_vpc" "selected" {
  id = var.vpc_id
}
