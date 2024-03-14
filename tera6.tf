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
resource "aws_s3_bucket" "rohii" {
    bucket = "my-tf-test-bucket"

    tags = {
        Name = "my bucket"
        Enviorment = "Development"
    }    
}   

  
