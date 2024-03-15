#Configure the AWS Provider
pr ovider "aws" {
    region = "ap-southeast-1"
    shared_config_files        = ["/root/.aws/config"]
    shared_credentials_files   =["/root/.aws/credentials"]
    profile                    = "digambar"
  }

  resource "aws_instance" "vpc-1" {
    ami = "ami-0123c9b6bfb7eb962"
    instance_type = "t2.micro"
    key_name = "digambar" 
    tags = {
      name = "example-vpc"
    }
}                    

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/24"
  enable_dns_support = true
  enable_dns_hostnames = true
}
