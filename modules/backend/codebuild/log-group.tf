resource "aws_cloudwatch_log_group" "codebuild_build" {
  name              = "/aws/codebuild/${local.codebuild_build_name}"
  retention_in_days = 90 # 3 months
}

resource "aws_cloudwatch_log_group" "codebuild_testing" {
  name              = "/aws/codebuild/${local.codebuild_testing_name}"
  retention_in_days = 90 # 3 months
}
