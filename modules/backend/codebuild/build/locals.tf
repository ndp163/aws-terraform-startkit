locals {
  codebuild_name = "${terraform.workspace}-${var.project}-backend-build"
}
