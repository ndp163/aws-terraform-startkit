resource "aws_ecs_cluster" "backend" {
  name = "${terraform.workspace}-${var.project}-backend"
}

resource "aws_ecs_service" "backend" {
  name            = "${terraform.workspace}-${var.project}-backend"
  task_definition = aws_ecs_task_definition.backend.arn
  cluster         = aws_ecs_cluster.backend.id
  launch_type     = "FARGATE"
  desired_count   = var.desired_tasks

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    security_groups  = [aws_security_group.ecs_backend_service.id]
    subnets          = var.subnet_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = local.container_name
    container_port   = local.container_port
  }

  lifecycle {
    ignore_changes = [desired_count, load_balancer, task_definition]
  }
}

resource "aws_ecs_task_definition" "backend" {
  family = "${terraform.workspace}-${var.project}-service"
  container_definitions = jsonencode([
    {
      name                   = local.container_name
      image                  = "${var.ecr_repo_url}:latest"
      cpu                    = var.task_cpu
      memory                 = var.task_memory
      readonlyRootFilesystem = true
      essential              = true

      portMappings = [
        {
          containerPort = local.container_port
          hostPort      = local.container_port
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.backend_logs.name
          awslogs-region        = var.region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory

  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  task_role_arn      = aws_iam_role.ecs_execution_role.arn
}
