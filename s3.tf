#Creating S3 
resource "aws_s3_bucket" "Project-S3" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_acl" "Project_acl" {
  bucket = aws_s3_bucket.Project-S3.id
  acl = "public-read"
}

resource "aws_s3_bucket_public_access_block" "Proj" {
  bucket = aws_s3_bucket.Project-S3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}