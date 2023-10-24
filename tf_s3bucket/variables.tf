# variable "credentials" {
#     type = object({
#         access_key = string
#         secret_key = string
#     })
#     sensitive = true
# }

variable "region" {
  description = "region"
  default     = ""
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

