variable "environment" {}
variable "region" {}
variable "ami_id" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.region
}

module "infrastructure" {
    source = "../../modules/infrastructure"

    environment = var.environment
    region = var.region
    ami_id = var.ami_id
}