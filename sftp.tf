resource "aws_transfer_server" "sftpServer" {
  endpoint_type = "VPC"
  domain = "S3"
  protocols   = ["SFTP"]
  identity_provider_type = "SERVICE_MANAGED"
  logging_role = aws_iam_role.sftpMonitoringRole.arn
  security_policy_name = "TransferSecurityPolicy-2020-06"

  endpoint_details {
    address_allocation_ids = [aws_eip.sftpEIP1.id,aws_eip.sftpEIP2.id]
    subnet_ids = [aws_subnet.sftpSubnet1.id, aws_subnet.sftpSubnet2.id]
    vpc_id     = aws_vpc.sftpVPC.id
    security_group_ids = [aws_security_group.sftpSG.id]
  }
}