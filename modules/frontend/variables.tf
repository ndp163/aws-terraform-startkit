variable "project" {
  description = "Project name"
  type        = string
}

variable "codebuild_env_vars" {
  type = any
}

variable "git_repository_owner" {
  type = string
}

variable "git_repository_name" {
  type = string
}

variable "git_repository_branch" {
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

variable "log_bucket_domain_name" {
  type = string
}

variable "frontend_domain" {
  type = string
}
