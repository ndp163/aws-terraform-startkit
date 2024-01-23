resource "aws_alb" "this" {
  name            = "${terraform.workspace}-${var.project}-backend"
  subnets         = var.subnet_ids
  security_groups = [aws_security_group.ecs_backend_loadbalance.id]

  tags = {
    Name = "${terraform.workspace}-${var.project}-backend"
  }
}

resource "aws_alb_target_group" "this" {
  name        = "${terraform.workspace}-${var.project}-backend"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path    = "/health-check"
    matcher = "200-399"
    timeout = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_alb.this]
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Access denied"
      status_code  = "403"
    }
  }
}

resource "aws_lb_listener_rule" "this" {
  listener_arn = aws_alb_listener.this.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.this.arn
  }

  condition {
    http_header {
      http_header_name = "X-Alb-Key"
      values           = [var.x_alb_key]
    }
  }
}
