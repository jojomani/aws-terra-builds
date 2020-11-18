# VPC Module

## Overview

Creates a custom AWS VPC with a public and private subnet, and 2 security groups. 

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.4 |
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dev_vpc | The Dev VPC ID | `string` | aws_vpc.dev_vpc.id | Yes |
| web_subnet | The Public Subnet ID | `string` | aws_subnet.public.id | Yes |
| dc_subnet | The Private Subnet ID | `string` | aws_subnet.private.id | Yes |

## Outputs

| Name | Value  | Description |
|------|--------|-------------|
| vpc_id | aws_vpc.dev_vpc.id | The VPC ID |
| web_subnet | aws_subnet.public.id | The Public Subnet ID |
| dc_subnet | aws_subnet.private.id | The Private Subnet ID |
| web_securitygroup | aws_security_group.allow_icmp.id | The Web Security Group ID |
| dc_securitygroup | aws_security_group.allow_rdp.id | The DC Security Group ID |
