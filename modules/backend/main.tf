module "alb" {
  source         = "./alb"
  project        = var.project
  vpc_id         = var.vpc.id
  subnet_ids     = [var.vpc.public_subnet_1a, var.vpc.public_subnet_1c]
  x_alb_key      = var.x_alb_key
  container_port = module.ecs.container_port
}

module "ecr" {
  source  = "./ecr"
  project = var.project
}

module "ecs" {
  source                  = "./ecs"
  vpc_id                  = var.vpc.id
  subnet_ids              = [var.vpc.public_subnet_1a, var.vpc.public_subnet_1c]
  project                 = var.project
  min_tasks               = var.min_tasks
  max_tasks               = var.max_tasks
  desired_tasks           = var.desired_tasks
  task_cpu                = var.task_cpu
  task_memory             = var.task_memory
  region                  = var.region
  target_group_arn        = module.alb.target_group_arn
  allowed_security_groups = [module.alb.security_group_id]
  ecr_repo_url            = module.ecr.repo_url
  cpu_to_scale_up         = var.cpu_to_scale_up
  cpu_to_scale_down       = var.cpu_to_scale_down
  memory_to_scale_up      = var.memory_to_scale_up
  memory_to_scale_down    = var.memory_to_scale_down
  sns_topic_arn           = var.sns_topic_arn
}

module "waf" {
  providers = {
    aws = aws.east
  }

  source    = "./waf"
  project   = var.project
  whitelist = []
}

module "acm" {
  source         = "./acm"
  count          = var.backend_domain != null ? 1 : 0
  backend_domain = var.backend_domain
}

module "cloudfront" {
  source                 = "./cloudfront"
  project                = var.project
  alb_domain             = module.alb.domain_name
  waf_arn                = module.waf.waf_arn
  log_bucket_domain_name = var.log_bucket_domain_name
  custom_domain_name     = one(module.acm) != null ? one(module.acm).domain_name : null
  acm_arn                = one(module.acm) != null ? one(module.acm).acm_arn : null
  x_alb_key              = var.x_alb_key
}

module "rds" {
  source                     = "./rds"
  project                    = var.project
  vpc_id                     = var.vpc.id
  subnet_ids                 = [var.vpc.public_subnet_1a, var.vpc.public_subnet_1c]
  username                   = var.rds_username
  password                   = var.rds_password
  allowed_security_group_ids = [module.ecs.security_group_id, module.bastion.security_group_id]
  cpu_to_alarm               = var.rds_cpu_to_alarm
  memory                     = var.rds_memory
  memory_to_alarm            = var.rds_memory_to_alarm
  connections_to_alarm       = var.rds_connections_to_alarm
  deadlocks_to_alarm         = var.rds_deadlocks_to_alarm
  min_capacity               = var.rds_min_capacity
  max_capacity               = var.rds_max_capacity
  instance_class             = var.rds_instance_class
  sns_topic_arn              = var.sns_topic_arn
}

module "bastion" {
  source    = "./bastion"
  project   = var.project
  vpc_id    = var.vpc.id
  subnet_id = var.vpc.public_subnet_1a
}

module "s3" {
  source  = "./s3"
  project = var.project
}

module "codebuild" {
  source  = "./codebuild"
  project = var.project

  codebuild_build_env_vars = merge(var.codebuild_build_env_vars, {
    REGION         = var.region
    RDS_HOST       = module.rds.cluster_endpoint
    RDS_PORT       = module.rds.port
    RDS_DATABASE   = module.rds.database_name
    RDS_USERNAME   = var.rds_username
    RDS_PASSWORD   = var.rds_password
    CONTAINER_NAME = module.ecs.container_name
    REPOSITORY_URI = module.ecr.repo_url
    ACCOUNT_ID     = data.aws_caller_identity.this.account_id
  })

  codebuild_testing_env_vars = var.codebuild_testing_env_vars
}

module "pipeline" {
  source                 = "./pipeline"
  project                = var.project
  git_repository_owner   = var.git_repository_owner
  git_repository_name    = var.git_repository_name
  git_repository_branch  = var.git_repository_branch
  artifact_bucket        = module.s3.backend_pipeline_bucket
  codebuild_build_name   = module.codebuild.codebuild_build_name
  codebuild_testing_name = module.codebuild.codebuild_testing_name
  ecs_cluster_name       = module.ecs.cluster_name
  ecs_service_name       = module.ecs.service_name
}
