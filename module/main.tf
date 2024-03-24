# here we create only resources and providers are defined into the projet's module main.tf file
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.project}-vpc"
    enviorment = var.enviorment  
  }
}