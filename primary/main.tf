# Terraform version and provider configurations

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# This calls the VPC module which will create a VPC with a Public and Private Subnet

module "vpc" {
  source     = "../modules/vpc"
  whitelist  = var.whitelist
  dev_vpc    = module.vpc.vpc_id
  web_subnet = module.vpc.web_subnet
  dc_subnet  = module.vpc.dc_subnet
}

# This module will create an NGNIX web server and a Windows DC Server

module "ec2" {
  source             = "../modules/ec2"
  dev_ami            = "ami-0708a0921e5eaf65d"
  dc_ami             = "ami-0412e100c0177fb4b"
  instance_type      = "t2.micro"
  web_subnet         = module.vpc.web_subnet
  dc_subnet          = module.vpc.dc_subnet
  web_security_group = module.vpc.web_securitygroup
  dc_security_group  = module.vpc.dc_securitygroup

}

# This module will create a private bucket with versioning enabled

module "s3" {
  source = "../modules/s3"
  s3_acl = "private"
}

# This will store the terraform state file remotely on a S3 bucket

terraform {
  backend "s3" {
    bucket = "Your S3 bucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}