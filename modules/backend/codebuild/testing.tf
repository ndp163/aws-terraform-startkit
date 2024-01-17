resource "aws_codebuild_project" "testing" {
  name          = local.codebuild_testing_name
  build_timeout = "60"

  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"

    // https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    dynamic "environment_variable" {
      for_each = var.codebuild_testing_env_vars
      content {
        type  = "PLAINTEXT"
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  source {
    type = "CODEPIPELINE"
    # if you src buildspec, comment out this line
    buildspec = file("${path.module}/buildspec/testing.yaml")
  }
}
