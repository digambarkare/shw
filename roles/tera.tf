# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
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
# # Create a instaunce
# resource "aws_instance" "digu" {
#   ami = "ami-0123c9b6bfb7eb962"
#   instance_type ="t2.micro"
#   key_name ="digambar"
#   tags = {
#     Name = "jarvis-server"
#     Enviorment ="staging"
#     Project ="xyz"
#   }
# }

  

