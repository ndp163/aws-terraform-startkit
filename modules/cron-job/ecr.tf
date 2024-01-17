# Cron job definition
resource "aws_ecr_repository" "ecr_repo" {
  name         = "${terraform.workspace}-${var.project}-ecr-cron-job"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_ropo_policy" {
  repository = aws_ecr_repository.ecr_repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Delete all images except the last one",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = 4
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
