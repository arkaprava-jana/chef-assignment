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
        "Resource" : ["${aws_s3_bucket.s3bucket.arn}/*.json","${aws_s3_bucket.s3bucket.arn}/*.csv","${aws_s3_bucket.s3bucket.arn}/*.xl*"]
      },
      {
        "Sid" : "DenyMkdir",
        "Action" : [
          "s3:PutObject"
        ],
        "Effect" : "Deny",
        "Resource" : "${aws_s3_bucket.s3bucket.arn}/*/"
      },

      {
        "Sid" : "Stmt1544140969635",
        "Action" : [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey"
        ],
        "Effect" : "Allow",
        "Resource" : "${aws_kms_key.s3key.arn}"
      }


    ]
  })
}

resource "aws_iam_policy_attachment" "sftpRolePolicyAttach" {
  name       = "sftpRolePolicyAttach"
  roles      = [aws_iam_role.sftpIAMRole.name]
  policy_arn = aws_iam_policy.sftpIAMpolicy.arn
}


resource "aws_iam_role" "sftpMonitoringRole" {
  name = "sftpMonitoringRole"

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
    Name = "sftpMonitoringRole"
  }
}

resource "aws_iam_policy" "sftpMonitoringpolicy" {
  name        = "sftpMonitoringpolicy"
  path        = "/"
  description = "sftpMonitoringpolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    "Statement" : [
      {
        "Sid" : "CloudWatchLogging",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogStream",
          "logs:DescribeLogStreams",
          "logs:CreateLogGroup",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:log-group:/aws/transfer/*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "sftpMonitoringRolePolicyAttach" {
  name       = "sftpMonitoringRolePolicyAttach"
  roles      = [aws_iam_role.sftpMonitoringRole.name]
  policy_arn = aws_iam_policy.sftpMonitoringpolicy.arn
}


