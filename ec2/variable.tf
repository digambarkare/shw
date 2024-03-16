variable "profile" {
    default = "digambar"
    type = string
   
}

variable "region" {
    type = string
    description = "here i am using "
    
}

variable "ami" {
    type = string
    description = "value"
    
}

variable "instance_type" {
    type = string
    description = "value"
   
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

  