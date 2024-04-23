#Creating S3 
resource "aws_s3_bucket" "Project-S3" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "Bucket-version" {
  bucket = aws_s3_bucket.Project-S3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "Proj" {
  bucket = aws_s3_bucket.Project-S3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}