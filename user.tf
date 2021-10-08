module "user1" {
    server_id = aws_transfer_server.sftpServer.id
    source = "./modules/sftp_user_onboarding"
    user_name = "user1"
    role = aws_iam_role.sftpIAMRole.arn
    s3_bucket = aws_s3_bucket.s3bucket.id
    public_key = var.user1_publickey
    upload_frequency = "daily"
    user_cidr = "0.0.0.0/0"
    sg_id = aws_security_group.sftpSG.id
}