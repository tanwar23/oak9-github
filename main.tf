resource "aws_s3_bucket" "s3" {
  # oak9: aws_s3_bucket_public_access_block is not configured
  # oak9: CorsConfiguration.CorsRules.AllowedMethods is not configured
  # oak9: CorsConfiguration.CorsRules.AllowedMethods should be set to any of GET,HEAD,POST
  bucket = "my-tf-remediation-bucket"
  acl    = "private"
  block_public_policy = true

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:{redacted}"
        sse_algorithm     = "AES128" # oak9: server_side_encryption_configuration.rule.apply_server_side_encryption_by_default.sse_algorithm should be set to aws:kms
      }
    }
  }
}
