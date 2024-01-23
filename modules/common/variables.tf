variable "region" {
  type = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "lambda_concurrency_threshold" {
  type = number
}

variable "notification_subscription_mails" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_1" {
  type = string
}

variable "public_subnet_2" {
  type = string
}

variable "cloufront_key_path" {
  type = string
}
