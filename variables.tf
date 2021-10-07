variable "notifyemail" {
  type = string
  description = "Email ID to be notified for missing uploads"
  default = "arkaprava92@gmail.com"
}

variable "slack_channel" {
  type = string
  description = "Name of Slack Channel to be notified for missing uploads"
  default = "dctesting"
}