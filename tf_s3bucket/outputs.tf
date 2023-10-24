output "region" {
  value = var.region
}

output "bucket" {
  value = aws_s3_bucket.terraform_s3.bucket
}

output "aws_access_key_id" {
  value     = var.access_key
  sensitive = true
}

output "aws_secret_access_key" {
  value     = var.secret_key
  sensitive = true
}