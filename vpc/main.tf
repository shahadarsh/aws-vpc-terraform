terraform {
  backend "s3" {
    bucket = "tf-state.shahadarsh.com"
    key = "aws-vpc-terraform/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  version = "~> 1.0.0"
  region  = "us-east-1"
}