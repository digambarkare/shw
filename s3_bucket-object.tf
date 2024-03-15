resource "aws_s3_bucket" "mybucket-1" {
     bucket = "myspecialbucklletyomi"
       tags = {
     Name        = "My-bucket-12"
     Environment = "Development"
   }
  
 }
 