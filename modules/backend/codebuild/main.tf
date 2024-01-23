module "build" {
  source                = "./build"
  project               = var.project
  environment_variables = var.codebuild_build_env_vars
}

module "testing" {
  source                = "./testing"
  project               = var.project
  environment_variables = var.codebuild_testing_env_vars
}
