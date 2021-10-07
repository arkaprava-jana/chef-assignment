resource "aws_cloudwatch_event_rule" "missing_upload_check_trigger" {
  name        = "missing_upload_check_trigger"
  description = "Trigger Lambda Function for checking missing uploads"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = aws_cloudwatch_event_rule.missing_upload_check_trigger.name
  target_id = "missing_upload_check_trigger"
  arn       = aws_lambda_function.missing_data_notifier.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_invoke" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.missing_data_notifier.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.missing_upload_check_trigger.arn}"
}