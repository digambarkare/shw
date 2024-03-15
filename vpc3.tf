#Configure the AWS Provider
provider "aws" {
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
  resource "aws_subnet" "my-subnet" {
    vpc_id = "vpc-036eec5d9ad5f8b09"
    cidr_block = "10.0.0.0/26"
    availability_zone_id = "apse1-az1"
    map_public_ip_on_launch = true
    tags = {
      Name = "mysubnet"
    }
}


 resource "aws_route_table" "my-route" {
    vpc_id = "vpc-036eec5d9ad5f8b09"
    tags = {
      Name = "myvpcroute"
    }
}
resource "aws_internet_gateway" "my-igw" {
    vpc_id = "vpc-036eec5d9ad5f8b09"
    tags = {
      Name = "IGW-1"
    }


