variable "project" {
  type = string
}

variable "alb_domain" {
  description = "Domain name of ALB"
  type        = string
}

variable "waf_arn" {
  description = "WAF arn for Cloudfront"
  type        = string
}

variable "acm_cert" {
  type = any
}

variable "log_bucket_domain_name" {
  description = "bucket to store access log from Cloudfront"
  type        = string
}

variable "x_alb_key" {
  description = "ALB key to verify request from cloudfront to alb"
  type        = string
}
