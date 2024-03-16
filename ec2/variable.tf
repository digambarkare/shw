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
     