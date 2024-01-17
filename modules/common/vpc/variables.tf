variable "region" {
  description = "AWS Region for the VPC"
}

variable "project" {
  description = "Project name"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block of vpc"
}

variable "public_subnet_1" {
  type        = string
  description = "CIDR block of public subnet 1"
}

variable "public_subnet_2" {
  type        = string
  description = "CIDR block of public subnet 2"
}
