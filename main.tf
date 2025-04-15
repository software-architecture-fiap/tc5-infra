terraform {
  cloud {
    organization = "tc_fiap"
    workspaces {
      name = "tc5-infra"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }
  }
    required_version = ">= 1.2"
}

provider "aws" {
  region = var.region
}

module "s3" {
    source = "./s3"
}

module "sqs" {
    source = "./sqs"
}

module "cognito" {
    source = "./cognito"
}

# module "dynamodb" {
#     source = "./dynamodb"
# }

module "eks" {
    source = "./eks"
}