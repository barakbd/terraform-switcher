provider "aws" {
  region = "us-east-1"

  shared_credentials_file = "$HOME/.aws/credentials"
  
  # This will throw a `terraform validate` error as provider default tags are only avaialble from v3.38.0
  default_tags { 
    tags = {
      key = "value" 
    }
  }
}

