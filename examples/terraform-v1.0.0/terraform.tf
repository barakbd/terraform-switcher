terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      version = "~> 3.42.0"
      source  = "hashicorp/aws"
    }
  }

  backend "local" {}
}