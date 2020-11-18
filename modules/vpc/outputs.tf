output "vpc_id" {
  value       = aws_vpc.dev_vpc.id
  description = "The VPC ID"
}
output "web_subnet" {
  value       = aws_subnet.public.id
  description = "The ID of the Public Subnet"
}
output "dc_subnet" {
  value       = aws_subnet.private.id
  description = "The ID of the Private Subnet"
}
output "web_securitygroup" {
  value       = aws_security_group.allow_icmp.id
  description = "The Web Security Group ID"
}
output "dc_securitygroup" {
  value       = aws_security_group.allow_rdp.id
  description = "The DC Security Groupd ID"
}