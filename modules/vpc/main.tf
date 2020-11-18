# Creates a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Dev-VPC"
  }
}

# Creates the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.dev_vpc

  tags = {
    Name = "IGW"
  }
}

# Creates a route table for public subnet
resource "aws_route_table" "public_rtable" {
  vpc_id = var.dev_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route Table for Public Subnet"
  }
}

# Creates a public subnet
resource "aws_subnet" "public" {
  vpc_id            = var.dev_vpc
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

# Route table association for public subnet
resource "aws_route_table_association" "a" {
  subnet_id      = var.web_subnet
  route_table_id = aws_route_table.public_rtable.id

}

# Creates a route table for private subnet
resource "aws_route_table" "private_rtable" {
  vpc_id = var.dev_vpc

  tags = {
    Name = "Local Route Table for Isolated Private Subnet"
  }
}

# Creates a private subnet
resource "aws_subnet" "private" {
  vpc_id            = var.dev_vpc
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Isolated Private Subnet"
  }
}

# Route table association for private subnet
resource "aws_route_table_association" "b" {
  subnet_id      = var.dc_subnet
  route_table_id = aws_route_table.private_rtable.id
}

# Creates a security group that allows ICMP & SSH traffic from user-specified IP addrress, and all outbond traffic
resource "aws_security_group" "allow_icmp" {
  name        = "Dev-SG"
  description = "Allow ICMP traffic"
  vpc_id      = var.dev_vpc

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.whitelist
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = var.whitelist
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : "Dev-SG"
  }
}

# Creates a security group that allows ICMP and RDP traffic from user-specified IP addrress
resource "aws_security_group" "allow_rdp" {
  name        = "DC-SG"
  description = "Allow RDP traffic"
  vpc_id      = var.dev_vpc

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = var.whitelist
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.whitelist
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "ICMP"
    cidr_blocks = var.whitelist
  }

  tags = {
    "Name" : "DC-SG"
  }
}