terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "pra-remote"
    key    = "ven-pra-key1"
    region = "us-east-1"
    dynamodb_table = "pra-locking"

  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}