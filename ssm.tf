resource "aws_ssm_parameter" "slackwebhook" {
  name        = "slackwebhook"
  description = "Slack WebHook for Notification"
  type        = "SecureString"
  value       = "DummyValue --> To be replaced from console"
  key_id      = aws_kms_key.s3key.id
}