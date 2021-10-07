variable "server_id" {
  description = "The Server ID of the Transfer Server"
  type        = string
}

variable "user_name" {
  description = "The name of the user account"
  type        = string
}

variable "role" {
  description = "Amazon Resource Name (ARN) of an IAM role that allows the service to controls your user’s access to your Amazon S3 bucket"
  type        = string
}

variable "s3_bucket" {
  description = "S3 Bucket for user's directory path"
  type        = string
}

variable "public_key" {
  description = "Public Key for user Auth"
  type        = string
}

variable "upload_frequency" {
  description = "Upload frequency for user  - Daily/Weekly"
  validation {
    condition     = var.upload_frequency  == "daily" || var.upload_frequency == "weekly"
    error_message = "Value for upload_frequency must be weekly or daily."
  }
}