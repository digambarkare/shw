terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  shared_config_files = [/root/.aws/config]
  shared_credentials_files   = [/root/.aws/credentials]
  profile = digambar
}
# Create a instaunce
resource "aws_instunce" "my-instaunce" {
  ami = "ami-0123c9b6bfb7eb962"
  instaunce_type ="t2.micro"
  key_name ="digambar"
}