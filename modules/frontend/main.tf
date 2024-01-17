module "s3" {
  source                      = "./s3"
  project                     = var.project
  cloudfront_frontend_oai_arn = module.cloudfront.cloudfront_oai_arn
}

module "codebuild" {
  source             = "./codebuild"
  project            = var.project
  codebuild_env_vars = {}
}

module "pipeline" {
  source                = "./pipeline"
  project               = var.project
  git_repository_owner  = var.git_repository_owner
  git_repository_name   = var.git_repository_name
  git_repository_branch = var.git_repository_branch
  artifact_bucket       = module.s3.frontend_pipeline_bucket
  codebuild_name        = module.codebuild.codebuild_name
}

# module "acm" {
#   source = "./acm"
#   frontend_domain = var.frontend_domain
# }

module "lambda" {
  providers = {
    aws = aws.east
  }
  source          = "./lambda"
  project         = var.project
  authen_username = var.authen_username
  authen_password = var.authen_password
}

module "cloudfront" {
  source                    = "./cloudfront"
  project                   = var.project
  origin_domain_name        = module.s3.frontend_domain_name
  custom_domain_name        = "" # module.acm.frontend_domain_name
  acm_arn                   = "" # module.acm.frontend_acm_arn
  log_bucket_domain_name    = var.log_bucket_domain_name
  authentication_lambda_arn = module.lambda.authentication_lambda_arn
}
