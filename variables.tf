# -------------------------------------------------------
# Variables — terraform-aws-infra
# -------------------------------------------------------

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "anubhav-infra"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI for ap-south-1"
  type        = string
  default     = "ami-0f58b397bc5c1f2e8" # Amazon Linux 2 — Mumbai
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier eligible)"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ssh_cidr" {
  description = "Your IP CIDR for SSH access — replace with your IP e.g. 203.0.113.0/32"
  type        = string
  default     = "0.0.0.0/0" # Restrict to your IP in production
}
