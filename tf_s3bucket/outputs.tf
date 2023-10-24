output "region" {
  value = module.aws_s3_bucket.s3_bucket_region
}

output "bucket" {
  value = module.aws_s3_bucket.s3_bucket_bucket_domain_name
}

output "aws_access_key_id" {
  value     = var.access_key
  sensitive = true
}

output "aws_secret_access_key" {
  value     = var.secret_key
  sensitive = true
}