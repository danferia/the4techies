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
  profile = "default"
  region  = "us-east-2"
}

resource "aws_s3_bucket" "s3bucket"{
  bucket = "the4techies-20220309"
  acl    = "private"
}

resource "aws_vpc" "nginix-vpc"{
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
}

resource "aws_subnet" "pro-subnet-public" {
  vpc_id                  = aws_vpc.nginix-vpc.id 
  route {
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone       = "us-east-2"
  }
  tags ={
    Name = "prod-public-crt"
  }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
  subnet_id      = aws_subnet.pro-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.vpc_id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.nginix-vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "aws-key" {
  key_name = "aws-key"
  public_key = file(var.publiv_key_path) 
}

resource "aws_instance" "nginx_server" {
  acl    = "public"
}

resource "aws_default_vpc" "default"{}

resource "aws_instance" "app_server" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"

  tags = {
    Name = "nginx_server"
    Name = var.instance_name
  }
#VPC
  subnet_id = aws_subnet.pro-subnet-public-1.id

#Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

#The Public SSH Key
  key_name = aws_key_pair.aws-key.id
#Nginix Install
  provisioner "file" {
   source      = "nginx.sh"
   destination = "/tmp/nginx.sh"
  }
  provisioner "remote-exec" {
   inline = [
     "chmod +x /tmp/nginx.sh",
     "sudo /tmp/nginx.sh"
   ]
  }
#Setting up the ssh connection to install nginx server
 connection {
  type        = "ssh"
  host        = self.public_ip
  user        = "ubuntu"
  private_key = file("${var.private_key_path}")
 }

}
