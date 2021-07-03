variable s3_bucket_name {
    default = "my-test-bucket"
    # This will throw a `terraform init` error as sensitive was only added in v0.14.0
    # Comment it out to pass `terraform init` and check also `terraform validate`
    # sensitive = true
}