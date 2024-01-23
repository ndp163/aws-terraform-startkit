module "batch" {
  source          = "./batch"
  project         = var.project
  subnet_ids      = var.subnet_ids
  repository_url  = module.ecr.repository_url
  cron_job_cpu    = var.cron_job_cpu
  cron_job_memory = var.cron_job_memory
}

module "ecr" {
  source  = "./ecr"
  project = var.project
}

module "event-bridge" {
  source                   = "./event-bridge"
  project                  = var.project
  cron_job_schedule        = var.cron_job_schedule
  batch_job_queue_arn      = module.batch.job_queue_arn
  batch_job_definition_arn = module.batch.job_definition_arn
}
