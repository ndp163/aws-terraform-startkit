module "common" {
  source                          = "./modules/common"
  project                         = var.project
  region                          = var.region
  lambda_concurrency_threshold    = var.lambda_concurrency_threshold
  notification_subscription_mails = var.notification_subscription_mails
  vpc_cidr                        = var.vpc_cidr
  public_subnet_1                 = var.public_subnet_1
  public_subnet_2                 = var.public_subnet_2
}

# module "backend" {
#   providers = {
#     aws.east = aws.east
#   }
#   source                   = "./modules/backend"
#   vpc                      = module.vpc.config
#   project                  = var.project
#   min_tasks                = var.min_tasks
#   max_tasks                = var.max_tasks
#   cpu_to_scale_up          = var.cpu_to_scale_up
#   cpu_to_scale_down        = var.cpu_to_scale_down
#   memory_to_scale_up       = var.memory_to_scale_up
#   memory_to_scale_down     = var.memory_to_scale_down
#   desired_tasks            = var.desired_tasks
#   task_cpu                 = var.task_cpu
#   task_memory              = var.task_memory
#   region                   = var.region
#   log_bucket_domain_name   = module.s3.log_bucket_domain_name
#   x_alb_key                = var.x_alb_key
#   rds_username             = var.rds_username
#   rds_password             = var.rds_password
#   rds_cpu_to_alarm         = var.rds_cpu_to_alarm
#   rds_memory               = var.rds_memory
#   rds_memory_to_alarm      = var.rds_memory_to_alarm
#   rds_connections_to_alarm = var.rds_connections_to_alarm
#   rds_deadlocks_to_alarm   = var.rds_deadlocks_to_alarm
#   rds_min_capacity         = var.rds_min_capacity
#   rds_max_capacity         = var.rds_max_capacity
#   rds_instance_class       = var.rds_instance_class
#   git_repository_owner     = var.backend_git_repository_owner
#   git_repository_name      = var.backend_git_repository_name
#   git_repository_branch    = var.backend_git_repository_branch
#   # sns_topic_arn        = module.sns.sns_topic_arn
# }

# module "frontend" {
#   providers = {
#     aws.east = aws.east
#   }
#   source                 = "./modules/frontend"
#   project                = var.project
#   codebuild_env_vars     = var.frontend_codebuild_env_vars
#   git_repository_owner   = var.frontend_git_repository_owner
#   git_repository_name    = var.frontend_git_repository_name
#   git_repository_branch  = var.frontend_git_repository_branch
#   authen_username        = var.frontend_authen_username
#   authen_password        = var.frontend_authen_password
#   log_bucket_domain_name = module.s3.log_bucket_domain_name
#   frontend_domain        = var.frontend_domain
# }

module "media_cdn" {
  providers = {
    aws.east = aws.east
  }
  source                 = "./modules/media-cdn"
  project                = var.project
  log_bucket_domain_name = module.common.s3_log_bucket_domain_name
  media_cdn_domain       = var.media_cdn_domain
}
