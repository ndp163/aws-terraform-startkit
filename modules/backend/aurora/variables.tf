variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "project" {
  description = "Project name"
}

variable "username" {
  default     = "admin"
  description = "The username of the database"
}

variable "password" {
  default     = "password"
  description = "The password of the database"
}

variable "allowed_security_group_ids" {
  description = "The allowed security group ids to connect on RDS"
}

variable "sns_topic_arn" {
  description = "SNS topic"
  type        = string
  default     = ""
}

variable "cpu_to_alarm" {
  description = "RDS threshold to trigger alarm"
  type        = number
}

variable "instance_class" {
  type = string
}

variable "memory" {
  type = number
}

variable "memory_to_alarm" {
  type = number
}

variable "connections_to_alarm" {
  type = number
}

variable "deadlocks_to_alarm" {
  type = number
}

variable "min_capacity" {
  type = number
}

variable "max_capacity" {
  type = number
}
