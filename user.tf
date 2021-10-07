module "user1" {
    server_id = aws_transfer_server.sftpServer.id
    source = "./modules/sftp_user_onboarding"
    user_name = "user1"
    role = aws_iam_role.sftpIAMRole.arn
    s3_bucket = aws_s3_bucket.s3bucket.id
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpQAh9RHWr5IlEyxAyAbQwAczVBsmCg9Zr54sJSuV2gJwyCWfgM4eJ/+lRRj3+Wv0kCDImnbPzV/UMKhNDYA1d57eoMgEMFjLRTqHMdlIB6Yuu0cxEAxxFsPkAEZSl9kFwG7KeQSTw88mHvUqOpL69zZ2HwBH0+cNq+5xyQQ+agPU8V+bDtPM5HYrfHk6AhP0qz9UtfDuhKAHfyc2SZl1ABXnZOcTylQST+jCdYahtio/zRJjZX6d+D0+XSk5WB+VPrmqtZsf3YeXOmEMu7qQCoPSt7o83bpDjAUS5bD79Wnsqi1nfLQyniFgMvtgER8aJxeQdrs9T9arQz1CwNzXrGVD4MF/+OwTtq2jcRgGZxe7Be+1qpnitctoprgQsRRrL6WeOMi7hFywULoiCjoT20L2sjzAEp16nXNaw/mN+fC50DwwcrrxnV7uNgWWNM96tci4JJBnxA9eohAkjWvCbZIbDHvgc9JBMVD+p/lLXxGzA+IZ7EPs1vVmmttSg33c= arkaprava.jana@ARKAPRAVAs-MacBook-Air.local"
    upload_frequency = "daily"
}