output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The VPC ID"
}
output "web_subnet_id" {
  value       = module.vpc.web_subnet
  description = "The ID of the Public Subnet"
}
output "dc_subnet_id" {
  value       = module.vpc.dc_subnet
  description = "The ID of the Private Subnet"
}
output "s3_bucket" {
  value       = module.s3.bucket
  description = "The S3 Bucket name"
}
output "web_instance_ip" {
  value       = module.ec2.web_instance
  description = "The public IP address of the web instance"
}
output "dc_instance_ip" {
  value       = module.ec2.dc_instance
  description = "The private IP address of the DC server"
}