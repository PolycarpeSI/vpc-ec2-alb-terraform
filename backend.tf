terraform {
  backend "s3" {
    bucket         = "poly-s3" // Here is the name of the s3 bucket created in AWS
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "state-log" // Here is the name of dynamoDB created in AWS
  }
}