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
  shared_config_files        = ["/root/.aws/config"]
  shared_credentials_files   =["/root/.aws/credentials"]
  profile                    = "digambar"
}
#create instunce
resource "aws_instance" "rohhi" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
}

variable "profile" {
    default = "digambar"
    type = string
    description = "here i am make my server"
}

variable "region" {
    type = string
    description = "here i am using "
    default = "ap-southeast-1"
}

variable "ami" {
    type = string
    description = "value"
    default = "ami-0123c9b6bfb7eb962"
}

variable "instance_type" {
    type = string
    description = "value"
    default = "t2.micro"
}

variable "key_name" {
    type = string
    description = "value"
    default = "digambar"
}

variable "tags" {
    type = map
    description = "hhh"
    default = {
        Name = "variable-server"
        Enviorment = "production"
        Project = "xyz"
    }
}            

output "server_created" {
    value = "yes created"
}
     