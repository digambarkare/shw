terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}
provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-0be811527bbd59596"
  instance_type = "t2.micro"

  tags = {
    Name = "JacksBlogExample"
  }
}
