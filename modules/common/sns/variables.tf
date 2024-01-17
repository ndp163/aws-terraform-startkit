variable "project" {
  description = "The backend-iot project name"
  type        = string
}

variable "subscription_mails" {
  description = "Subscription mails to receive notifications"
  type        = list(string)
}
