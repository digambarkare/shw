# Configure the AWS Provider
provider "aws" {
    region = "ap-southeast-1"
    shared_config_files        = ["/root/.aws/config"]
    shared_credentials_files   =["/root/.aws/credentials"]
    profile                    = "digambar"
  }

  resource "aws_instance" "vpc-1" {
#     ami = "ami-0f5daaa3a7fb3378b"
#     instance_type = "t2.micro"
#     key_name = "pair" 
#     tags = {
#       name = "example-vpc"
#     }
# }                    
