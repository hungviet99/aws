terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region  = var.region
  access_key = var.credentials.access_key
  secret_key = var.credentials.secret_key
}

resource "aws_s3_bucket" "terraform_s3" {
  bucket = var.bucket_name
  tags = {
    Owner        = "HungNV"
  }
}