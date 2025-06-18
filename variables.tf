variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "aws_region" {
  description = "Region where the resources going to be created"
  type        = string
#   default     = "us-east-1"
}

variable "website_source_path" {
  description = "Website file path"
  type        = string
  default     = "./website"
}