provider "aws" {
  region  = var.region
  profile = "my-account"

  default_tags {
    tags = {
      Environment = "${terraform.workspace}-project-name"
    }
  }
}

provider "aws" {
  alias   = "east"
  region  = "us-east-1"
  profile = "my-account"

  default_tags {
    tags = {
      Environment = "${terraform.workspace}-project-name"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.31.0"
    }
  }

  backend "s3" {
    bucket  = "my-project-terraform-backend"
    key     = "backend/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "my-account"
    encrypt = true
  }
}
