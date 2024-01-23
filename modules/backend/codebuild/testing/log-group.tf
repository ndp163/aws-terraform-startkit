resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/codebuild/${local.codebuild_name}"
  retention_in_days = 90 # 3 months
}
