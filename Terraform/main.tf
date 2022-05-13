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
  profile = "aws_cl"
  version = "~> 3.27"
  region  = "us-east-1"
}

#userdata AWS Resource AWS_Instance
data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20220419"]
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
  vpc_id      = "vpc-0507451dd3353e3a1"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
  }

  ingress {
    description      = "TLS from VPC HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
  }

  ingress {
    description      = "TLS from VPC SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
#VPC user Data
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "tf_vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "vpc-0507451dd3353e3a1"
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-subnet"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = "subnet-0b7a89f9c9c6d4033"
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-09d56f8956ab235b3" # us-east-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
