terraform {
required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region = "ap-southeast-1"
    shared_config_files        = ["/root/.aws/config"]
    shared_credentials_files   =["/root/.aws/credentials"]
    profile                    = "digambar"
  }
#create VPC
resource "aws_vpc" "demo-vpc1" {
  cidr_block = "10.0.0.0/16"          #Set your desired CIDR block for the VPC
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "digambar-vpc"
  }
}

#create gateway
resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.demo-vpc.id         #dynamic variable value
  tags = {
    Name = "demo-igw"
  }
} 

#create route table for VPC 
resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }
  tags = {
    Name = "route-table-digambar"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.demo-vpc.id           #it is an vpc id under which VPC we create subnet & it is we define dynamic variable value in our terr. script bcz we dont know name of VPC it will directly create when vpc created.
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-1"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet"                    #name of resource
  }
}

#associate public subnet with route table
resource "aws_route_table_association" "demo-rt_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route-table.id
  }

# resource "aws_subnet" "pvt_subnet" {
#   vpc_id = aws_vpc.demo-vpc.id           
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "ap-southeast-1" 

#   tags = {
#     Name = "pvt subnet"                    
#   }
# }

#create route table pvt subnet 
resource "aws_route_table" "demo-pvt-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "local"
  }
  tags = {
    Name = "pvt-rt"
  }
}

#associate pvt subnet with route table
resource "aws_route_table_association" "demo_pvt_subnet_association" {
  subnet_id = aws_subnet.pvt_subnet.id 
  route_table_id = aws_route_table.demo-pvt-rt.id
  }

#security group
resource "aws_security_group" "demo-vpc-sg" {
  name   = "demo-vpc-sg"
  vpc_id = aws_vpc.demo-vpc.id  

  ingress {                               #incoming
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks= ["0.0.0.0/0"]
  }  
  
  ingress {
    from_port   = 80   # Allow HTTP traffic
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {                                #outbound
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks= ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}



#Create a instaunce
 resource "aws_instance" "diguu" {
   ami = "ami-0123c9b6bfb7eb962"
   instance_type ="t2.micro"
   key_name ="digambar"
   tags = {
     Name = "jarvis-server2"
     Enviorment ="staging"
     Project ="xyz"
   }
}