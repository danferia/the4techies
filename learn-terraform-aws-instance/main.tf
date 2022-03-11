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
  acl    = "public"
}

resource "aws_default_vpc" "default"{}

resource "aws_instance" "app_server" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"

  tags = {
    Name = "AppServerInstance"
    Name = var.instance_name
  }
}
