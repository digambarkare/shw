terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
    region = "ap-southeast-1"

}
 terraform {
   backend "s3" {
    bucket = "rajat-key-222"
    region = "us-east-1"
    key = "digambar2"
    encrypt = true
    dynamodb_table = "table3"
   }
 }



 resource "aws_instance" "terraform_child" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
 }