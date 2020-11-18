# EC2 Module

## Overview

Creates 2 AWS Instances; 1 Nginx web server and 1 Windows server.

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.4 |
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dev_ami | The Ngninx server ami ID | `string` | ami-0708a0921e5eaf65d | Yes |
| dc_ami | The Windows Server ami ID | `string` | ami-0412e100c0177fb4b | Yes |
| web_subnet | The Public Subnet ID | `string` | aws_subnet.public.id | Yes |
| dc_subnet | The Private Subnet ID | `string` | aws_subnet.private.id | Yes |
| instance_type | The Instance type ID | `string` | t2.micro | Yes |
| web_securitygroup | The Web Security Group ID | `string` | aws_security_group.allow_icmp.id | Yes |
| dc_securitygroup | The DC Security Group ID | `string` | aws_security_group.allow_rdp.id | Yes |

## Outputs

| Name | Value  | Description |
|------|--------|-------------|
| web_instance | aws_instance.Web-instance.public_ip | The Web instance public IP |
| dc_instance | aws_instance.DC-server.private_ip | The DC instance private IP |
