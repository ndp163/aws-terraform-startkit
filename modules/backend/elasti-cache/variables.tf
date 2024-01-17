variable "subnet_ids" {
  type        = list(any)
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "allowed_security_group_ids" {
  description = "The allowed security group ids to connect on Redis"
}

variable "instance_class" {
  description = "The instance type"
}

variable "project" {
  description = "Project name"
}

variable "sns_topic_arn" {
  description = "SNS topic"
  type        = string
}

variable "redis_cpu_threshold" {
  type = number
}

variable "redis_db_memory" {
  type = number
}

variable "redis_db_freeable_memory_threshold" {
  type = number
}
