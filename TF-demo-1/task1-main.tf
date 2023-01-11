terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# block defining local variables
# locals {
#   ami_name = "ami-0beb6fc68811e5682"
#   foo      = "bar"
# }

// configure aws provider
provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "eu-west-2"
}

/* This comment
is split over multiple lines */
module "instance_module" {
  source = "./instance"

  ami_name = var.ami_name
  type = var.type
  key_pair = var.key_pair
}