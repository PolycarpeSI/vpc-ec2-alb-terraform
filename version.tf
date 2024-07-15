terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #secret_key = aws_key_pair.ec2_key
  #access_key = "devopsec3"
  #skip_credentials_validation = true
  #skip_metadata_api_check     = true
  #skip_requesting_account_id  = true
}