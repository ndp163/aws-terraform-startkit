# locals {
#   logs_exports = ["audit", "error", "general", "slowquery"]
# }

# resource "aws_cloudwatch_log_group" "rds_mysql" {
#   count             = length(local.logs_exports)
#   name              = "/aws/rds/instance/${aws_rds_cluster_instance.mysql.identifier}/${local.logs_exports[count.index]}"
#   retention_in_days = 90 # 3 months
# }
