variable "project" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "cron_job_cpu" {
  type = number
}

variable "cron_job_memory" {
  type = number
}

variable "cron_job_configs" {
  type = list(object({
    name     = string
    schedule = string
  }))
}
