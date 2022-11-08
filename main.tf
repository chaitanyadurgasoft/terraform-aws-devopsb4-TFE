terraform {
  backend "s3" {
    bucket = "awsb4cgitnew"
    key    = "awsb4devops.tfstate"
    region = "ap-south-1"
  }
}
provider "aws" {
  region = var.aws_region
}