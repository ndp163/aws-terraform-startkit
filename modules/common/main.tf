module "lambda" {
  source                       = "./lambda"
  project                      = var.project
  sns_topic_arn                = module.sns.sns_topic_arn
  lambda_concurrency_threshold = var.lambda_concurrency_threshold
}

module "s3" {
  source  = "./s3"
  project = var.project
}

module "secret-manager" {
  source             = "./secret-manager"
  project            = var.project
  cloufront_key_path = var.cloufront_key_path
}

module "sns" {
  source             = "./sns"
  project            = var.project
  subscription_mails = var.notification_subscription_mails
}

module "vpc" {
  source          = "./vpc"
  region          = var.region
  project         = var.project
  vpc_cidr        = var.vpc_cidr
  public_subnet_1 = var.public_subnet_1
  public_subnet_2 = var.public_subnet_2
}
