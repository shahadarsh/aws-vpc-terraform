terraform {
  backend "s3" {
    bucket = "tf-state.shahadarsh.com"
    key = "vault/nginx/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}