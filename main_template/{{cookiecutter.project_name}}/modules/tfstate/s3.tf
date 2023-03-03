resource "aws_s3_bucket" "tf_state_bucket" {
  bucket        = local.bucket_name
  force_destroy = var.bucket_force_destroy

  tags = local.bucket_tags
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = var.bucket_private_profile
  block_public_policy     = var.bucket_private_profile
  restrict_public_buckets = var.bucket_private_profile
  ignore_public_acls      = var.bucket_private_profile
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  acl    = var.bucket_acl_mode
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = var.bucket_versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.bucket_sse_algorithm
    }
  }
}
