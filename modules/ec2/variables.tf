variable "keypair" {
  type        = string
  description = "Your own Key pair"
}
variable "dev_ami" {
  type    = string
  default = "ami-0708a0921e5eaf65d"
}
variable "dc_ami" {
  type    = string
  default = "ami-0412e100c0177fb4b"
}
variable "web_subnet" {
  type    = string
  default = "aws_subnet.public.id"
}
variable "dc_subnet" {
  type    = string
  default = "aws_subnet.private.id"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "web_security_group" {
  type    = string
  default = "aws_security_group.allow_icmp.id"
}
variable "dc_security_group" {
  type    = string
  default = "aws_security_group.allow_rdp.id"
}
