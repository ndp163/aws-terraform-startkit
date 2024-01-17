variable "project" {
  type = string
}

variable "authen_username" {
  type      = string
  sensitive = true
}

variable "authen_password" {
  type      = string
  sensitive = true
}
