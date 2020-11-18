# Creates an NGINX instance in the public subnet
resource "aws_instance" "Web-instance" {
  ami                         = var.dev_ami
  instance_type               = var.instance_type
  key_name                    = var.keypair
  subnet_id                   = var.web_subnet
  vpc_security_group_ids      = [var.web_security_group]
  associate_public_ip_address = true

  tags = {
    Name = "Web Server"
  }
}

# Creates a DC Windows Server 19 instance in the private subnet
resource "aws_instance" "DC-server" {
  ami                    = var.dc_ami
  instance_type          = var.instance_type
  key_name               = var.keypair
  subnet_id              = var.dc_subnet
  vpc_security_group_ids = [var.dc_security_group]

  tags = {
    Name = "DC Server"
  }
}