resource "aws_transfer_user" "sftpuser" {
  server_id           = var.server_id
  user_name           = var.user_name
  role                = var.role
  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry  = "/"
    target = "/${var.s3_bucket}/$${Transfer:UserName}"
  }
  tags = {
    NAME             = "sftpuser",
    UPLOAD_FREQUENCY = var.upload_frequency
  }
}

resource "aws_transfer_ssh_key" "sftpusersshkey" {
  server_id = var.server_id
  user_name = aws_transfer_user.sftpuser.user_name
  body      = var.public_key
}