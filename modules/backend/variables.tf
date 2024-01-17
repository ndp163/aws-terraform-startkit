variable "region" {
  description = "AWS Region for the VPC"
}

variable "project" {
  description = "Project name"
}

variable "vpc" {
  type = object({
    id               = string
    route_table_id   = string
    public_subnet_1a = string
    public_subnet_1c = string
  })
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

variable "cpu_to_scale_up" {
  description = "CPU % to Scale Up the number of containers"
}

variable "cpu_to_scale_down" {
  description = "CPU % to Scale Down the number of containers"
}

variable "sns_topic_arn" {
  description = "SNS topic"
  type        = string
  default     = ""
}

variable "memory_to_scale_up" {
  description = "MEMORY % to scale up the number of containers"
  type        = number
}

variable "memory_to_scale_down" {
  description = "MEMORY % to scale down the number of containers"
  type        = number
}

variable "log_bucket_domain_name" {
  description = "bucket to store access log from Cloudfront"
  type        = string
}

variable "x_alb_key" {
  description = "ALB key to verify request from cloudfront to alb"
  type        = string
}

variable "rds_username" {
  default     = "admin"
  description = "The username of the database"
}

variable "rds_password" {
  default     = "password"
  description = "The password of the database"
}

variable "rds_cpu_to_alarm" {
  description = "RDS threshold to trigger alarm"
  type        = number
}

variable "rds_memory" {
  type = number
}

variable "rds_memory_to_alarm" {
  type = number
}

variable "rds_connections_to_alarm" {
  type = number
}

variable "rds_deadlocks_to_alarm" {
  type = number
}

variable "rds_min_capacity" {
  type = number
}

variable "rds_max_capacity" {
  type = number
}

variable "rds_instance_class" {
  type = string
}

variable "git_repository_owner" {
  description = "Owner from Repository"
}

variable "git_repository_name" {
  description = "Name of repository"
}

variable "git_repository_branch" {
  description = "Build branch aka Master"
}

variable "codebuild_build_env_vars" {
  description = "Environment variables for codebuild of backend building stage"
  type        = any
}

variable "codebuild_testing_env_vars" {
  description = "Environment variables for codebuild of backend testing stage"
  type        = any
}
