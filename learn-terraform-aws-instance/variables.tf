variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16" #vpc subnets
}

/* variable "public_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(any)
  default     = { "10.0.1.0/24", "10.0.2.0/24" }
}

 variable "private_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(any)
  default     = { "10.0.3.0/24", "10.0.4.0/24" }
}*/

variable "instances_per_subnet" {
  description = "Number of EC2 instances per private subnet"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "private_key_path" {
  default = "aws-key"
}

variable "public_key_path" {
  default = "aws-key.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}

variable "env" {
  description = "Environment"
  default     = ""
}

variable "key" {
  description = "key pair"
}

