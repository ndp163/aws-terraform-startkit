aws_region = "ap-northeast-1"
project    = "toyota"

###### CLUSTER OPTIONS  ######

# Customize your ECR Registry Name
app_repository_name = "pro-toyota-repo"

###### APPLICATION OPTIONS  ######
# Number of containers
desired_tasks        = 2
min_tasks            = 2
max_tasks            = 6
cpu_to_scale_up      = 80
cpu_to_scale_down    = 30
memory_to_scale_up   = 80
memory_to_scale_down = 30

# Desired CPU
desired_task_cpu = "2048"

# Desired Memory
desired_task_memory = "4096"

# ALB endpoint paths for Cloudfront
endpoints = [{
  path   = "/doctor",
  domain = "api.vet.buddynote.toyota-tsusho.com",
  }, {
  path   = "/app",
  domain = "api.buddynote.toyota-tsusho.com",
  }, {
  path   = "/operator",
  domain = "api.operator.buddynote.toyota-tsusho.com",
  }, {
  path   = "/webhook",
  domain = "api.webhook.buddynote.toyota-tsusho.com",
}]

media_cdn_domain = "cdn.buddynote.toyota-tsusho.com"

###### RDS OPTIONS  ######
database_name     = "buddy_note"
database_username = "admin"
database_password = "e5calCrmJAawIRDMf64e"
max_capacity      = 6
min_capacity      = 2

###### REDIS OPTIONS  ######
redis_instance_class = "cache.t3.medium"

###### GITHUB OPTIONS  ######

# Github Repository Owner
git_repository_owner = "ttc-petpj"

# Github Repository Project Name
git_repository_name = "ttc-pet-backend"

# Default Branch
git_repository_branch = "release-master"

# Connection ARN
git_connection_arn = "arn:aws:codestar-connections:ap-northeast-1:064105057086:connection/bae01739-73b3-441a-bf9d-d0b22bd954f2"

# Lambda SAM Repository Name
sam_git_repository_name = "ttc-pet-backend-iot"

# Cronjob repository name
cron_job_git_repository_name   = "ttc-pet-batch"
cron_job_git_repository_branch = "release-master"

# Lambda SAM app default Branch
sam_git_repository_branch = "master"

###### VPC OPTIONS  ######
vpc_cidr        = "10.1.0.0/16"
public_subnet_1 = "10.1.1.0/24"
public_subnet_2 = "10.1.2.0/24"

# Env variables
codebuild_build_env_vars = {
  DOCKERHUB_USERNAME       = "deep3lb"
  DOCKERHUB_PASSWORD       = "kWzTXyjZSYYgimfsI0K12jErdIJZ"
  JWT_ACCESS_KEY           = "6GR3c8Lzgq0uLUrSxJSG1b0qXsWT"
  JWT_REFRESH_KEY          = "vOuLb9XOPtmc4qOF4pl1fVmc4D0U"
  APP_JWT_ACCESS_KEY       = "ABZS1mnBcbD4O6Ljz6sHWvIpNYlF"
  APP_JWT_REFRESH_KEY      = "P4G3Qqo7Y5ofolT2ugxzQGQp1WKW"
  APP_JWT_CODE_KEY         = "mtrQixF4tUxm03NzzP8IcU1EPF9P"
  APP_JWT_RESET_PWD_KEY    = "XyrHo2mmgHVtcADFb9RKSW0XlKbo"
  APP_API_KEY              = "H3mP0TT9xyDkJt79bydw025hX4mZ"
  ADMIN_JWT_ACCESS_KEY     = "yLK1AQ18RfrSko5Uz3RIuoQR9Qm1"
  ADMIN_JWT_REFRESH_KEY    = "bfMKH9wbyG19yZyBIx31C6P4BcME"
  ADMIN_API_KEY            = "xNPO2o9A82yllF33sNia2Qz5B5IU"
  CLOUDFRONT_KEY_PAIR_ID   = "K1GKX80BQRW1AL"
  FIREBASE_CLIENT_EMAIL    = "firebase-adminsdk-andsv@prod-ttc-pet-iot.iam.gserviceaccount.com"
  ENV_PATH                 = "env/.env_production" # path of file env in source
  DOCTOR_JWT_ACCESS_KEY    = "gijS2jTGavFlU7j0SUSwcmVd3VoS"
  DOCTOR_JWT_REFRESH_KEY   = "k6r9EuB7CT5C2sA2MLny7untVHSj"
  DOCTOR_JWT_CODE_KEY      = "fzXyCFvA50V91b9b7rbbkbPOSgWp"
  DOCTOR_JWT_RESET_PWD_KEY = "T4Q5rP36owKXNv9zRvq9hKdIliOW"
  DOCTOR_API_KEY           = "tQjr04SKK16Tb4jajf2zObka4ITQ"
  WEBHOOK_SECRET_KEY       = "UowwrytxQGP5jgajNm0PLEC44PgJ"
}

codebuild_cron_job_env_vars = {
  DOCKERHUB_USERNAME    = "deep3lb"
  DOCKERHUB_PASSWORD    = "kWzTXyjZSYYgimfsI0K12jErdIJZ"
  FIREBASE_CLIENT_EMAIL = "firebase-adminsdk-andsv@prod-ttc-pet-iot.iam.gserviceaccount.com"
  EC_FORCE_EMAIL        = "support@toyota-tsusho.com"
  EC_FORCE_PASSWORD     = "RVBS9oRSvmVc"
}

# IoT options
iot_account_id      = "124414018124"
iot_raw_data_bucket = "pro-iot-raw-data"

cron_job_cpu    = 1    # 1 CPU
cron_job_memory = 2048 # 2 GB

# sam env variables
ai_api_gateway_endpoint = "t28d002c46-vpce-0fdb29c0172fba706.execute-api.ap-northeast-1.amazonaws.com" // todo
webhook_endpoint        = "api.webhook.buddynote.toyota-tsusho.com"

# batch config
cron_job_configs = [
  {
    name     = "reminder",
    schedule = "cron(0 10 * * ? *)" #at 10:00 UTC
  },
  {
    name     = "itchy",
    schedule = "cron(0 0 * * ? *)" #at 00:00 UTC
  },
  {
    name     = "sync-ec-force",
    schedule = "cron(0 15 * * ? *)" #at 15:00 UTC
  }
]

subscription_mails = ["phucnd@vitalify.asia", "cancc@vitalify.asia"]

# RDS ACU threshold to trigger alarm
rds_acu_alarm_threshold = 70

# Lambda concurrent executions threshold to trigger alarm
lambda_concurrency_threshold = 800

redis_cpu_threshold                = 70
redis_db_memory                    = 3317862236 # 3.09GB
redis_db_freeable_memory_threshold = 30

waf_whitelist = []
