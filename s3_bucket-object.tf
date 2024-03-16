terraform {
  required_providers {
    aws = {
       source  = "hashicorp/aws"
       version = "~> 5.0"
     }
   }
 }


 Configure the AWS Provider
provider "aws" {
    region = "ap-southeast-1"
    shared_config_files        = ["/root/.aws/config"]
    shared_credentials_files   =["/root/.aws/credentials"]
    profile                    = "digambar"
  }

resource "aws_s3_bucket" "mybucket-1" {
     bucket = "myspecialbucklletyomi"
       tags = {
     Name        = "My-bucket-12"
     Environment = "Development"
   }
  
 }

 #Upload an object to the bucket
resource "aws_s3_object" "my_object1" {
  bucket = aws_s3_bucket.mybucket-1.id  # Reference to the bucket created above
  key    = "digambar/vpc.tf"        # Key (name) of the object in the bucket
  source = "./vpc1.tf" # file you want to upload
}