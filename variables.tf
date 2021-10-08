
variable "bucket_name" {
  type = string
  description = "S3 Bucket name for SFTP Storage"
}

variable "notifyemail" {
  type = string
  description = "Email ID to be notified for missing uploads"
}

variable "slack_channel" {
  type = string
  description = "Name of Slack Channel to be notified for missing uploads"
}