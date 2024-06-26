variable "project" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cron_job_cpu" {
  type = number
}

variable "cron_job_memory" {
  type = number
}

variable "cron_job_schedule" {
  type = string
}
