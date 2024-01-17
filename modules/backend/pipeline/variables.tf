variable "project" {
  description = "Project name"
}

variable "git_repository_owner" {
  description = "Owner from Repository"
}

variable "git_repository_name" {
  description = "Name of repository"
}

variable "git_repository_branch" {
  description = "Build branch aka Master"
}

variable "artifact_bucket" {
  type = string
}

variable "codebuild_build_name" {
  type = string
}

variable "codebuild_testing_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}
