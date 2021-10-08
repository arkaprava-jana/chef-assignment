# Module for onboarding new user on SFTP


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group_rule.sftpingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_transfer_ssh_key.sftpusersshkey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/transfer_ssh_key) | resource |
| [aws_transfer_user.sftpuser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/transfer_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Public Key for user Auth | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | Amazon Resource Name (ARN) of an IAM role that allows the service to controls your user’s access to your Amazon S3 bucket | `string` | n/a | yes |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | S3 Bucket for user's directory path | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The Server ID of the Transfer Server | `string` | n/a | yes |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | Security Group ID | `string` | n/a | yes |
| <a name="input_upload_frequency"></a> [upload\_frequency](#input\_upload\_frequency) | Upload frequency for user  - Daily/Weekly | `any` | n/a | yes |
| <a name="input_user_cidr"></a> [user\_cidr](#input\_user\_cidr) | IP/CIDR of user which is to be whitelisted for data upload | `any` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the user account | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->