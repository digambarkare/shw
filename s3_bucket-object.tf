resource "aws_s3_bucket" "mybucket-1" {
     bucket = "myspecialbucklletyomi"
       tags = {
     Name        = "My-bucket-12"
     Environment = "Development"
   }
  
 }

 Upload an object to the bucket
resource "aws_s3_object" "my_object" {
  bucket = aws_s3_bucket.my_bucket.id  # Reference to the bucket created above
  key    = "tfstate/terraform.tfstate"        # Key (name) of the object in the bucket
  source = "./terraform.tfstate" #he file you want to upload
}