#Creating S3 
resource "aws_s3_bucket" "Project-S3" {
  bucket = "migod-s3"
  
  

  tags = {
    Name  = "Project-S3"
  }
}