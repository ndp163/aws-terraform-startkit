resource "aws_ecr_repository" "backend_repo" {
  name         = "${terraform.workspace}-${var.project}-backend-repo"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "backend_repo_policy" {
  repository = aws_ecr_repository.backend_repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Delete all images except the last 4",
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
