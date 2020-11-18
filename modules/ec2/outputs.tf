output "web_instance" {
  value       = aws_instance.Web-instance.public_ip
  description = "The public IP address of the web instance"
}
output "dc_instance" {
  value       = aws_instance.DC-server.private_ip
  description = "The private IP address of the DC server"
}