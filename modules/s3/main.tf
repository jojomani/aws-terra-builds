# This will create a private S3 bucket with versioning enabled
resource "aws_s3_bucket" "priv" {
  bucket = "devlab-bucket001"
  acl    = var.s3_acl

  versioning {
    enabled = true
  }
}