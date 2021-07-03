
variable s3_bucket_name {
    default = "my-test-bucket" # This will throw a `terraform fmt -recursive --check` error
    sensitive = true
}