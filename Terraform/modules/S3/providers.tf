terraform {
  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "the4techs.com"
    key = "../../terraform.tf.state"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}