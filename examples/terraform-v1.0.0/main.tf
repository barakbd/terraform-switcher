resource "aws_s3_bucket" "b" {
  bucket = var.s3_bucket_name
  # This will throw a `terraform fmt -recursive --check` error
  acl = "private"
}