# chef-assignment

## Architecture Diagram

![Alt text here](diagram/datachef-assignment-arkaprava.drawio.svg)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.2.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.61.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_user1"></a> [user1](#module\_user1) | ./modules/sftp_user_onboarding | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.missing_upload_check_trigger](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_eip.sftpEIP1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.sftpEIP2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_globalaccelerator_accelerator.sftp_accl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_accelerator) | resource |
| [aws_globalaccelerator_endpoint_group.sftp_accl_endpoint1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_endpoint_group) | resource |
| [aws_globalaccelerator_listener.sftp_accl_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_listener) | resource |
| [aws_iam_policy.SNSPublishPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.SSMparamSecretPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sftpIAMpolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sftpMonitoringpolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.LambdaLoggingPolicyAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.SNSPublishAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.SSMparamSecretPolicyAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.TransferReadOnlyAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.sftpMonitoringRolePolicyAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.sftpRolePolicyAttach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.lambdaIAMRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sftpIAMRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.sftpMonitoringRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_internet_gateway.sftpIGW](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_key.s3key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_lambda_function.missing_data_notifier](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_cloudwatch_to_invoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_route.r](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.sftpRouteTable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_s3_bucket.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.s3BlockPublic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_security_group.sftpSG](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.sftpegress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_sns_topic.upload_failue_notify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.upload_failure_email_notify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_ssm_parameter.slackwebhook](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_subnet.sftpSubnet1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.sftpSubnet2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_transfer_server.sftpServer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/transfer_server) | resource |
| [aws_vpc.sftpVPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [archive_file.deploymentartifact](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy.TransferReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.lambdabasic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [template_file.lambda_python_code](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | S3 Bucket name for SFTP Storage | `string` | `"chef-assignment-databucket"` | no |
| <a name="input_notifyemail"></a> [notifyemail](#input\_notifyemail) | Email ID to be notified for missing uploads | `string` | `"arkaprava92@gmail.com"` | no |
| <a name="input_slack_channel"></a> [slack\_channel](#input\_slack\_channel) | Name of Slack Channel to be notified for missing uploads | `string` | `"dctesting"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Global_Accelerator_Endpoint"></a> [Global\_Accelerator\_Endpoint](#output\_Global\_Accelerator\_Endpoint) | Global Accelerator URL |
<!-- END_TF_DOCS -->