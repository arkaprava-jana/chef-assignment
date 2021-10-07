resource "aws_iam_role" "sftpIAMRole" {
  name = "sftpIAMRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "transfer.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "sftpIAMRole"
  }
}

resource "aws_iam_policy" "sftpIAMpolicy" {
  name        = "sftpIAMpolicy"
  path        = "/"
  description = "sftpIAMpolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    "Statement" : [
      {
        "Sid" : "AllowListingOfUserFolder",
        "Action" : [
          "s3:ListBucket"
        ],
        "Effect" : "Allow",
        "Resource" : aws_s3_bucket.s3bucket.arn
      },
      {
        "Sid" : "HomeDirObjectAccess",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion"
        ],
        "Resource" : "${aws_s3_bucket.s3bucket.arn}/*"
      },
      {
        "Sid" : "DenyMkdir",
        "Action" : [
          "s3:PutObject"
        ],
        "Effect" : "Deny",
        "Resource" : "${aws_s3_bucket.s3bucket.arn}/*/"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "sftpRolePolicyAttach" {
  name       = "sftpRolePolicyAttach"
  roles      = [aws_iam_role.sftpIAMRole.name]
  policy_arn = aws_iam_policy.sftpIAMpolicy.arn
}