data "template_file" "lambda_python_code" {
    template = "${file("${path.module}/lib/lambda_missing_data.py")}"

    vars = {
      bucket_name = aws_s3_bucket.s3bucket.id
      sftp_server_id = aws_transfer_server.sftpServer.id
      slack_ch = var.slack_channel
      topic_arn = aws_sns_topic.upload_failue_notify.arn
    }
}

data "archive_file" "deploymentartifact" {
  type        = "zip"
  output_path = "${path.module}/files/artifact.zip"

  source {
    content  = "${data.template_file.lambda_python_code.rendered}"
    filename = "lambda_function.py"
  }
}



resource "aws_lambda_function" "missing_data_notifier" {
  filename      = "${path.module}/files/artifact.zip"
  function_name = "missing_data_notifier"
  role          = aws_iam_role.lambdaIAMRole.arn
  handler       = "lambda_function.lambda_handler"
  timeout       = 60 

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.7"
}
