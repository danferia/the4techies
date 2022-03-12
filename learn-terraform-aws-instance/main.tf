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
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"

  tags = {
    Name = "AppServerInstance"
    Name = var.instance_name
  }
}
