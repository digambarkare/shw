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