output "Global_Accelerator_Endpoint" {
  value       = aws_globalaccelerator_accelerator.sftp_accl.dns_name
  description = "Global Accelerator URL"
}