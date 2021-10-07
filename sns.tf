resource "aws_sns_topic" "upload_failue_notify" {
  name = "upload_failue_notify"
}

resource "aws_sns_topic_subscription" "upload_failure_email_notify" {
  topic_arn = aws_sns_topic.upload_failue_notify.arn
  protocol  = "email"
  endpoint  = var.notifyemail
}