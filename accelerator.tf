resource "aws_globalaccelerator_accelerator" "sftp_accl" {
  name            = "sftpaccl"
  ip_address_type = "IPV4"
  enabled         = true
}

resource "aws_globalaccelerator_listener" "sftp_accl_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.sftp_accl.id
  protocol        = "TCP"

  port_range {
    from_port = 22
    to_port   = 22
  }
}


resource "aws_globalaccelerator_endpoint_group" "sftp_accl_endpoint1" {
  listener_arn = aws_globalaccelerator_listener.sftp_accl_listener.id

  endpoint_configuration {
    endpoint_id = aws_eip.sftpEIP1.id
    weight      = 100
  }

    endpoint_configuration {
    endpoint_id = aws_eip.sftpEIP2.id
    weight      = 100
  }
}