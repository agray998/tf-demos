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
    region = "eu-west-2"
    alias  = "aws-uk"
}

variable "ami-uk" {
    description = "machine image uk"
    default     = "ami-035469b606478d63d"
}

variable "type" {
    default = "t2.micro"
}

variable "zone" {
    description = "map of availability zones for eu-west-2"
    default     = {
        1 = "eu-west-2a"
        2 = "eu-west-2b"
    }
}

resource "aws_instance" "example" {
    provider = "aws.aws-uk"
    for_each = var.zone
    availability_zone = each.value
    ami           = var.ami-uk
    instance_type = var.type

    lifecycle {
        prevent_destroy = true
    }

    timeouts {
        create = "5m"
        delete = "2h"
    }
}