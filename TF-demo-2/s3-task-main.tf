provider "aws" {
    shared_credentials_files = ["~/.aws/credentials"]
    region = "eu-west-2"
}

resource "aws_s3_bucket" "example_bucket" {
    bucket = "tf-demo-bucket-21uebgivgvbgeb"
}