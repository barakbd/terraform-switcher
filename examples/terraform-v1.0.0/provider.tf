provider "aws" {
  region = "us-east-1"

  shared_credentials_file = "$HOME/.aws/credentials"

  default_tags {
    tags = {
      key   = "value"
    }
  }
}

