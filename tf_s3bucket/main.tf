terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    bucket = var.s3_tfstate
    key    = "terraform.tfstate"
    region = var.s3_tfstate_region
    # Replace this with your DynamoDB table name!
    dynamodb_table = var.tfstate_dynamodb
  }
}

provider "aws" {
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key

}

resource "aws_s3_bucket" "terraform_s3" {
  bucket = var.bucket_name
  tags = {
    Owner        = "HungNV"
  }
}