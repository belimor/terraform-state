output "s3_bucket_name" {
  value       = aws_s3_bucket.tf_state.bucket
  description = "S3 bucket name"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.tf_state.arn
  description = "S3 bucket arn"
}

output "s3_bucket_region" {
  value       = aws_s3_bucket.tf_state.region
  description = "S3 bucket region"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.this.name
  description = "DynamoDB table name"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.this.arn
  description = "DynamoDB table arn"
}
