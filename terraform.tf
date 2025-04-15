terraform {
  cloud {
    organization = "tc_fiap"
    workspaces {
      name = "tc5_infra"
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