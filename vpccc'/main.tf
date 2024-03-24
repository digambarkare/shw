# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.41.0"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = "ap-southeast-1"
#   shared_config_files        = ["/root/.aws/config"]
#   shared_credentials_files   =["/root/.aws/credentials"]
#   profile                    = "digambar"
# }

# terraform {
#   backend "s3" {
#     bucket         	   = "gggggggg99"
#     key                = "terraform.tfstate"
#     region         	   = "us-east-1"
#     encrypt        	   = true
#     dynamodb_table = "table-2"
#   }
# }

# #create instunce
# resource "aws_instance" "instance4_g" {
#     ami = var.ami
#     instance_type = var.instance_type
#     key_name = var.key_name
#     tags = var.tags
# }
