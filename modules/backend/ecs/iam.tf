# Cluster Execution Role
resource "aws_iam_role" "ecs_execution_role" {
  name = "${terraform.workspace}-${var.project}-ecs-task-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Principal : {
          Service : ["ecs-tasks.amazonaws.com", "ec2.amazonaws.com"]
        },
        Action : "sts:AssumeRole"
      }
    ]
  })
}

# Cluster Execution Policy
resource "aws_iam_role_policy" "ecs_execution_role_policy" {
  name   = "${terraform.workspace}-${var.project}-role-policy"
  policy = file("${path.module}/policy/ecs-execution-role-policy.json")
  role   = aws_iam_role.ecs_execution_role.id
}
