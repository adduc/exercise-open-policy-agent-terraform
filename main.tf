resource "aws_s3_bucket" "bucket" {
  bucket = "test_bucket"
  # versioning = false
}

resource "aws_s3_bucket_versioning" "bucket_asdf" {
  bucket = "test_bucket"
  versioning_configuration {
    status = "Enabled"
  }
}