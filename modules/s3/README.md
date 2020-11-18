# S3 Module

## Overview

Creates an S3 bucket with versioning enabled.

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.4 |
| aws | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| s3_acl | The Access Control List of the bucket | `string` | "private" | Yes |

## Outputs

| Name | Value  | Description |
|------|--------|-------------|
| bucket | aws_s3_bucket.priv.bucket | The S3 Bucket name |
