resource "aws_ssm_parameter" "slackwebhook" {
  name        = "slackwebhook"
  description = "Slack WebHook for Notification"
  type        = "SecureString"
  value       = "ToBeReplacedFromConsole"
  key_id      = aws_kms_key.s3key.id
  lifecycle {
      ignore_changes = [value]
  }
}