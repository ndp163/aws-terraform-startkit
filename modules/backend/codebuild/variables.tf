variable "project" {
  description = "Project name"
}

variable "repository_url" {
  description = "The url of the ECR repository"
}

# variable "redis_address" {
#   type = string
# }

variable "codebuild_build_env_vars" {
  type = any
}

variable "codebuild_testing_env_vars" {
  type = any
}
