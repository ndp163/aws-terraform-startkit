resource "aws_batch_compute_environment" "cron_job" {
  compute_environment_name = "${terraform.workspace}-${var.project}-cron-job-compute-env"

  compute_resources {
    max_vcpus = 4

    security_group_ids = [aws_security_group.cron_job.id]
    subnets            = var.subnet_ids

    type = "FARGATE"
  }

  service_role = aws_iam_role.cron-job.arn
  type         = "MANAGED"
  depends_on   = [aws_iam_role.cron-job]
}

resource "aws_batch_job_queue" "cron_job" {
  name     = "${terraform.workspace}-${var.project}-cron-job-queue"
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    "${aws_batch_compute_environment.cron_job.arn}",
  ]
}

resource "aws_batch_job_definition" "cron_job" {
  count = length(var.cron_job_configs)

  name = "${terraform.workspace}-${var.project}-job-definition-${var.cron_job_configs[count.index].name}"
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = <<CONTAINER_PROPERTIES
  {
    "command": ["node", "dist/index.js"],
    "image": "${aws_ecr_repository.ecr_repo.repository_url}:latest",
    "environment": [
        {"name": "BATCH_MODE", "value": "${var.cron_job_configs[count.index].name}"}
    ],
    "fargatePlatformConfiguration": {
      "platformVersion": "LATEST"
    },
    "resourceRequirements": [
      {"type": "VCPU", "value": "${var.cron_job_cpu}"},
      {"type": "MEMORY", "value": "${var.cron_job_memory}"}
    ],
    "executionRoleArn": "${aws_iam_role.cron-job.arn}",
    "jobRoleArn": "${aws_iam_role.cron-job.arn}",
    "readonlyRootFilesystem": true,
    "networkConfiguration": {
      "assignPublicIp": "ENABLED"
    },
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
          "awslogs-group": "/aws/batch/${terraform.workspace}-${var.project}-job-${var.cron_job_configs[count.index].name}"
      }
    }
  }
  CONTAINER_PROPERTIES

  depends_on = [aws_iam_role.cron-job, aws_ecr_repository.ecr_repo, aws_cloudwatch_log_group.cron_job]
}

resource "aws_cloudwatch_log_group" "cron_job" {
  count = length(var.cron_job_configs)

  name              = "/aws/batch/${terraform.workspace}-${var.project}-job-${var.cron_job_configs[count.index].name}"
  retention_in_days = 180 # 6 months
}
