variable "environment" {
    default = "dev"
}

variable "sg_id" {
    default = ["sg-04177bb468ff68998"]
}

variable "tags" {
    type = map
    default = {
        Name = "backend" 
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}
