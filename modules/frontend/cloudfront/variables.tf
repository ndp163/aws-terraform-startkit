variable "project" {
  type = string
}

variable "origin_domain_name" {
  description = "Domain name of s3 bucket"
  type        = string
}

variable "custom_domain_name" {
  description = "Custom domain name for CloudFront"
  type        = string
}

variable "acm_arn" {
  description = "WAF arn for Cloudfront"
  type        = string
}

variable "log_bucket_domain_name" {
  description = "Bucket for Cloudfront logging"
  type        = string
}

variable "authen_username" {
  type = string
}

variable "authen_password" {
  type      = string
  sensitive = true
}
