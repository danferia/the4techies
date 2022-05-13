variable "instance_name" {
  description = " Value of the name tag"
  type        = string
  default     = "cit480 "
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16" #vpc subnets
}
variable "ami" {
  description = "ID of the AMI instance"
  type        = string
  default     = " "
}

variable "vpc_id" {
  description = "The ID of the VPC that the instance security group belongs to"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "subnet_id" {
  description = " Subnet ID"
  type = string  
}

variable "instances_per_subnet" {
  description = "Number of EC2 instances per private subnet"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t3.micro"
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

#############################################
#Cloud front

variable "domain_name" {
  type = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}