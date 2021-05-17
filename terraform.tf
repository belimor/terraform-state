#########################################
# S3 bucket to keep tfstate remotely
#########################################
resource "random_id" "random" {
  byte_length = 8
}

resource "aws_s3_bucket" "tf_state" {
  bucket = lower("${var.s3_bucket_name}-${random_id.random.hex}")
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(var.project_tags, { Name = lower("${var.s3_bucket_name}-${random_id.random.hex}"), "project" = var.aws_project })
  # protects bucket from accidental deletion
  lifecycle {
    prevent_destroy = true
  }
  # destroys bucket with it's content
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.tf_state.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#########################################
# DynamoDB for remote state locking
#########################################
resource "aws_dynamodb_table" "this" {
  name           = lower("${var.dynamodb_name}-${random_id.random.hex}")
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = merge(var.project_tags, { Name = lower("${var.s3_bucket_name}-${random_id.random.hex}"), "project" = var.aws_project })
}

