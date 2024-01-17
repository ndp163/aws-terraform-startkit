locals {
  codebuild_build_name   = "${terraform.workspace}-${var.project}-backend-build"
  codebuild_testing_name = "${terraform.workspace}-${var.project}-backend-testing"
}
