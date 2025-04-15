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