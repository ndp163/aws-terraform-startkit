module "acm" {
  source          = "./acm"
  count           = var.media_cdn_domain != null ? 1 : 0
  frontend_domain = var.media_cdn_domain
}

module "s3" {
  source                       = "./s3"
  project                      = var.project
  cloudfront_media_cdn_oai_arn = module.cloudfront.cloudfront_oai_arn
}

module "cloudfront" {
  source                 = "./cloudfront"
  project                = var.project
  origin_domain_name     = module.s3.media_cdn_bucket_domain_name
  custom_domain_name     = one(module.acm) != null ? one(module.acm).domain_name : null
  acm_arn                = one(module.acm) != null ? one(module.acm).acm_arn : null
  log_bucket_domain_name = var.log_bucket_domain_name
}
