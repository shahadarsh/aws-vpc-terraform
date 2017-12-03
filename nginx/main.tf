terraform {
  backend "s3" {
    bucket = "tf-state.shahadarsh.com"
    key = "aws-vpc-terraform/nginx/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}