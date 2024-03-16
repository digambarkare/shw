terraform {
  required_providers {
    aws = {
       source  = "hashicorp/aws"
       version = "~> 5.0"
     }
   }
 }

provider "aws" {
    region = "ap-southeast-1"
    shared_config_files        = ["/root/.aws/config"]
    shared_credentials_files   =["/root/.aws/credentials"]
    profile                    = "digambar"
  }

  #data block for sg
  data "aws_security_group" "my_sg" {
      name = "default"
  }
  resource "aws_instance" "my_instance_2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.my_sg.id]

    #
    tags = var.tags    
  }

  variable "region" {
    type = string
    description = "value"
    default = "ap-southeast-1"
  }

  variable "ami" {
    type = string
    description = "valu"
    default = "ami-0123c9b6bfb7eb962"
  }

  variable "instance_type" {
    type = string
    description = "value"
    default = "t2.micro"
  }

  variable "tags" {
    type = map
    description = "value"
    default = {
        Name = "jarvis-demo"
        Enviorment = "production"
        Project = "xyz"
    }
  }

  output "ws_security_group_id" {
    value =data.aws_security_group.my_sg.id
  }
  

  ,mklm