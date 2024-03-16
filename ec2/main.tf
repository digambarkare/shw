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

terraform {
  backend "s3" {
    bucket         	   = "prod-terraform.tfstate-b2025"
    key                = "terraform.tfstate"
    region         	   = "ap-south-1"
    encrypt        	   = true
    dynamodb_table = "terraform-b2025"
  }
}


}
#create instunce
resource "aws_instance" "rohhi22" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
}
