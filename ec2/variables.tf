variable vpc_id {
    default     = "vpc-012fbf9e1d70d9a06"
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "tags" {
    type = map
    default = {
        Name = "backend" 
        Project = "expense"
        Component = "backend" 
        Environment = "dev"
        Terraform = "true"
    }
}

variable "environment" {
    default = "dev"
}

variable "instance_type" {
    default = "t2.micro"
}