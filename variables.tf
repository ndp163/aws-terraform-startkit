variable "project" {
  description = "Project name"
  type        = string
}

# Customize your AWS Region
variable "region" {
  description = "AWS Region for the VPC"
  type        = string
}

###### BACKEND ######
variable "desired_tasks" {
  description = "Number of desired instances to run backend"
  type        = number
}

variable "min_tasks" {
  description = "Minimum instances to run backend"
  type        = number
}

variable "max_tasks" {
  description = "Maximum instances to run backend"
  type        = number
}

variable "cpu_to_scale_up" {
  description = "CPU % to Scale Up the number of containers"
  type        = number
}

variable "cpu_to_scale_down" {
  description = "CPU % to Scale Down the number of containers"
  type        = number
}

variable "memory_to_scale_up" {
  description = "MEMORY % to scale up the number of containers"
  type        = number
}

variable "memory_to_scale_down" {
  description = "MEMORY % to scale down the number of containers"
  type        = number
}

variable "task_cpu" {
  description = "Desired CPU to run your tasks"
  type        = number
}

variable "task_memory" {
  description = "Desired memory to run your tasks"
  type        = number
}

variable "redis_instance_class" {
  type        = string
  description = "The redis instance type"
}

###### GITHUB OPTIONS  ######
variable "backend_git_repository_owner" {
  description = "Owner name of backend git repository"
  type        = string
}

variable "backend_git_repository_name" {
  description = "Git repository name of backend"
  type        = string
}

variable "backend_git_repository_branch" {
  description = "Git repository branch of backend"
  type        = string
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block of vpc"
  type        = string
}

variable "public_subnet_1" {
  description = "CIDR block of public subnet 1"
  type        = string
}

variable "public_subnet_2" {
  description = "CIDR block of public subnet 2"
  type        = string
}

variable "backend_codebuild_build_env_vars" {
  description = "Environment variables for codebuild of backend building stage"
  type        = any
}

variable "backend_codebuild_testing_env_vars" {
  description = "Environment variables for codebuild of backend testing stage"
  type        = any
}

variable "notification_subscription_mails" {
  description = "Subscription mails to receive notifications"
  type        = list(string)
  default     = null
}

variable "lambda_concurrency_threshold" {
  description = "Lambda concurrent executions threshold to trigger alarm"
  type        = number
  default     = null
}

variable "redis_cpu_threshold" {
  description = "Redis CPU threshold to alert"
  type        = number
  default     = null
}

variable "redis_db_memory" {
  description = "Memory of current redis instance"
  type        = number
  default     = null
}

variable "redis_db_freeable_memory_threshold" {
  description = "Freeable memory threshold to alert"
  type        = number
  default     = null
}

variable "waf_whitelist" {
  description = "List IPs to ignore WAF check"
  type        = list(string)
}

variable "x_alb_key" {
  description = "ALB key to verify request from cloudfront to alb"
  type        = string
}

# RDS
variable "rds_username" {
  type        = string
  sensitive   = true
  description = "The username of RDS database"
}

variable "rds_password" {
  type        = string
  sensitive   = true
  description = "The password of RDS database"
}

variable "rds_cpu_to_alarm" {
  description = "RDS CPU threshold to trigger alarm"
  type        = number
  default     = null
}

variable "rds_memory" {
  description = "Memory of current RDS instance"
  type        = number
  default     = null
}

variable "rds_memory_to_alarm" {
  description = "freeable memory threshold of RDS to alert"
  type        = number
  default     = null
}

variable "rds_connections_to_alarm" {
  description = "number of RDS connections to alert"
  type        = number
  default     = null
}

variable "rds_deadlocks_to_alarm" {
  description = "Deadlocks duration to alert"
  type        = number
  default     = null
}

variable "rds_min_capacity" {
  description = "Min RDS replicas"
  type        = number
}

variable "rds_max_capacity" {
  description = "Max RDS replicas"
  type        = number
}

variable "rds_instance_class" {
  description = "Instance class of RDS"
  type        = string
}

##### FRONTEND #####
variable "frontend_codebuild_env_vars" {
  description = "codebuild environment variables of FrontEnd pipeline"
  type        = any
}

variable "frontend_git_repository_owner" {
  description = "Owner name of frontend git repository"
  type        = string
}

variable "frontend_git_repository_name" {
  description = "Git repository name of frontend"
  type        = string
}

variable "frontend_git_repository_branch" {
  description = "Git repository branch of frontend"
  type        = string
}

variable "frontend_authen_username" {
  description = "Basic authen username for frontend"
  type        = string
  sensitive   = true
}

variable "frontend_authen_password" {
  description = "Basic authen password for frontend"
  type        = string
  sensitive   = true
}

variable "frontend_domain" {
  description = "Domain name of frontend"
  type        = string
}

variable "media_cdn_domain" {
  description = "Domain name of media cdn"
  type        = string
}
