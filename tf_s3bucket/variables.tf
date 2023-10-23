variable "access_key" {
  description = ""
  default     = ""
}

variable "secret_key" {
  description = ""
  default     = ""
}

variable "region" {
  description = "region"
  default     = ""
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "s3_tfstate" {
  type    = string
  default = ""
}

variable "s3_tfstate_region" {
  type    = string
  default = ""
}

variable "tfstate_dynamodb" {
  type    = string
  default = ""
}
