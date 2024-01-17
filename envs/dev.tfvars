region  = "ap-northeast-1"
project = "toyota"

###### APPLICATION OPTIONS  ######
# Number of containers
desired_tasks        = 2
min_tasks            = 2
max_tasks            = 4
cpu_to_scale_up      = 80
cpu_to_scale_down    = 30
memory_to_scale_up   = 80
memory_to_scale_down = 30

# Task config
task_cpu    = 512
task_memory = 1024


###### RDS OPTIONS  ######
rds_username = "admin"
rds_password = "i0JSPENc6GrEPYExiWvf"
max_capacity = 3
min_capacity = 0.5

###### REDIS OPTIONS  ######
redis_instance_class = "cache.t3.micro"

###### GITHUB OPTIONS  ######
# Github Repository Owner
git_repository_owner = "ttc-petpj"

# Github Repository Project Name
git_repository_name = "ttc-pet-backend"

# Default Branch
git_repository_branch = "release-develop"

###### VPC OPTIONS  ######
vpc_cidr        = "10.0.0.0/16"
public_subnet_1 = "10.0.1.0/24"
public_subnet_2 = "10.0.2.0/24"

# Env variables
codebuild_build_env_vars = {
  DOCKERHUB_USERNAME       = "deep3lb"
  DOCKERHUB_PASSWORD       = "kWzTXyjZSYYgimfsI0K12jErdIJZ"
  JWT_ACCESS_KEY           = "HNATmdYTEDqg5BHYu1A6LS6jUZX/"
  JWT_REFRESH_KEY          = "vGk9LIv5+N86HMhBhQ6lJJWbEqqe"
  APP_JWT_ACCESS_KEY       = "Zo4k10Vos8FQ65jdRBt8IWkb1gjv"
  APP_JWT_REFRESH_KEY      = "mjE9hlTt94xVx5v0mjZufeuct8e1"
  APP_JWT_CODE_KEY         = "k8EmtUjUjPb1Wv8rm8M1aZSxE2Da"
  APP_JWT_RESET_PWD_KEY    = "XoTTv83tep2F9ovE7Lbqf65V2xnB"
  APP_API_KEY              = "Z9szyuZ1gxwb2TaBs1U08X3lZ44l"
  ADMIN_JWT_ACCESS_KEY     = "hKOieIV3QzBgKTwhMEZ8drBOjk5Y7Oa"
  ADMIN_JWT_REFRESH_KEY    = "J755xdOQSEnsfmx7M7nSR1RUHEoanm"
  ADMIN_API_KEY            = "D2IGUJr66KiAjklDC6"
  CLOUDFRONT_KEY_PAIR_ID   = "KYEVM2ZVJA2RM"
  FIREBASE_CLIENT_EMAIL    = "firebase-adminsdk-ei6rf@dev-ttc-pet-iot.iam.gserviceaccount.com"
  ENV_PATH                 = "env/.env_develop" # path of file env in source
  DOCTOR_JWT_ACCESS_KEY    = "qEw2bIywN37vs9lJPfzQMJVhYc5q"
  DOCTOR_JWT_REFRESH_KEY   = "VC7s1brmZapYR1MqzLkG1PBT6vcZ"
  DOCTOR_JWT_CODE_KEY      = "uwCWMcWzXpdOLOWeEyrSDy1ZD8dn"
  DOCTOR_JWT_RESET_PWD_KEY = "LuVVM3A1Y7HYOglpc0HWFGsV07MU"
  DOCTOR_API_KEY           = "NWQ4YJGRO3ZEA"
  WEBHOOK_SECRET_KEY       = "D6LVWZJ56LHSJ"
}

waf_whitelist = [
  "113.36.191.146/32",
  "222.151.197.65/32"
]

x_alb_key = "vnaweqiuvbsadvkjasndvkasdjvn"

rds_min_capacity         = 0
rds_max_capacity         = 0
rds_instance_class       = "db.t3.small"
rds_cpu_to_alarm         = 70
rds_connections_to_alarm = 50

##### FRONTEND #####
frontend_codebuild_env_vars    = {}
frontend_git_repository_owner  = "vfa-phucnd"
frontend_git_repository_name   = "Test-ECS"
frontend_git_repository_branch = "master"
frontend_authen_username       = "username"
frontend_authen_password       = "123456"
frontend_domain                = "example.com"

##### MEDIA CDN #####
media_cdn_domain = "example.com"
