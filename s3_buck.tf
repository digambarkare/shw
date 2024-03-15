
resource "aws_s3_bucket" "rohanyyy00" {
    bucket = "my-tf-test-bucket"

    tags = {
        Name = "my bucket"
        Enviorment = "Development"
    }    
}   