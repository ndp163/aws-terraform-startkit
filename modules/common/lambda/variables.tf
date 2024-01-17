variable "project" {
  description = "Project name"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic"
  type        = string
}

variable "lambda_concurrency_threshold" {
  description = "Lambda concurrent executions threshold to trigger alarm"
  type        = number
}
