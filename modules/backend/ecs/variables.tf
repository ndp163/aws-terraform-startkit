variable "region" {
  description = "AWS Region for the VPC"
}

variable "project" {
  description = "Project name"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "subnet_ids" {
  description = "The ECS service subnet ids"
}

variable "desired_tasks" {
  description = "Number of containers desired to run the application task"
}

variable "task_cpu" {
  description = "Task CPU Limit"
}

variable "task_memory" {
  description = "Task Memory Limit"
}

variable "min_tasks" {
  description = "Minimum"
}

variable "max_tasks" {
  description = "Maximum"
}

variable "target_group_arn" {
  type = string
}

variable "allowed_security_groups" {
  type = list(string)
}

variable "ecr_repo_url" {
  type = string
}

variable "cpu_to_scale_up" {
  description = "CPU % to Scale Up the number of containers"
}

variable "cpu_to_scale_down" {
  description = "CPU % to Scale Down the number of containers"
}

variable "memory_to_scale_up" {
  description = "MEMORY % to scale up the number of containers"
  type        = number
}

variable "memory_to_scale_down" {
  description = "MEMORY % to scale down the number of containers"
  type        = number
}

variable "sns_topic_arn" {
  description = "SNS topic"
  type        = string
  default     = ""
}
