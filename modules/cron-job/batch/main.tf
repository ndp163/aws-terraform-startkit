resource "aws_batch_compute_environment" "this" {
  compute_environment_name = "${terraform.workspace}-${var.project}-cron-job-compute-env"

  compute_resources {
    max_vcpus = 4

    security_group_ids = [aws_security_group.this.id]
    subnets            = var.subnet_ids

    type = "FARGATE"
  }

  service_role = aws_iam_role.this.arn
  type         = "MANAGED"
}

resource "aws_batch_job_queue" "this" {
  name     = "${terraform.workspace}-${var.project}-cron-job-queue"
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    "${aws_batch_compute_environment.this.arn}",
  ]
}

resource "aws_batch_job_definition" "this" {
  name = "${terraform.workspace}-${var.project}-job-definition"
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = <<CONTAINER_PROPERTIES
  {
    "command": ["node", "dist/index.js"],
    "image": "${var.repository_url}:latest",
    "environment": [],
    "fargatePlatformConfiguration": {
      "platformVersion": "LATEST"
    },
    "resourceRequirements": [
      {"type": "VCPU", "value": "${var.cron_job_cpu}"},
      {"type": "MEMORY", "value": "${var.cron_job_memory}"}
    ],
    "executionRoleArn": "${aws_iam_role.this.arn}",
    "jobRoleArn": "${aws_iam_role.this.arn}",
    "readonlyRootFilesystem": true,
    "networkConfiguration": {
      "assignPublicIp": "ENABLED"
    },
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.this.name}"
      }
    }
  }
  CONTAINER_PROPERTIES
}
