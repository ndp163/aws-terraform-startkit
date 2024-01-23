variable "project" {
  description = "Project name"
}

variable "codebuild_build_env_vars" {
  type = any
}

variable "codebuild_testing_env_vars" {
  type = any
}
