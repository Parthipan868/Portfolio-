output "website_url" {
  description = "Website URL"
  value       = "http://${aws_s3_bucket_website_configuration.portfolio_website.website_endpoint}"
}

output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.portfolio_bucket.id
}

output "bucket_arn" {
  description = "S3 Bucket ARN"
  value       = aws_s3_bucket.portfolio_bucket.arn
}
