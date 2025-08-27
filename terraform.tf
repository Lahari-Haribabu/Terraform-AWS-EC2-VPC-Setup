terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.10.0"
    }
  }
  backend "s3" {
    bucket = "lahari-bucket-s3"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lahari-table"
    
  }
}