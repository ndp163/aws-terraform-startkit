resource "aws_codestarconnections_connection" "frontend" {
  name          = "${terraform.workspace}-${var.project}-fe-connection"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "frontend" {
  name     = "${terraform.workspace}-${var.project}-pipeline-frontend"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.artifact_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        ConnectionArn        = aws_codestarconnections_connection.frontend.arn
        FullRepositoryId     = "${var.git_repository_owner}/${var.git_repository_name}"
        BranchName           = var.git_repository_branch
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["source"]

      configuration = {
        ProjectName = var.codebuild_name
      }
    }
  }
}
