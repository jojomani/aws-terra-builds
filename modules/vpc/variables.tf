variable "whitelist" {
  type        = list(string)
  description = "Your own Public IP"
}
variable "dev_vpc" {
  type        = string
  default     = "aws_vpc.dev_vpc.id"
  description = "The Dev VPC ID"
}
variable "web_subnet" {
  type    = string
  default = "aws_subnet.public.id"
}
variable "dc_subnet" {
  type    = string
  default = "aws_subnet.private.id"
}
