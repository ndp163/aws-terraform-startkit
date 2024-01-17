variable "project" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "x_alb_key" {
  type = string
}

variable "container_port" {
  type = number
}
