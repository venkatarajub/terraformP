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
        Environment = "dev"
        Terraform = "true"
    }
}

variable "environment" {
    default = "dev"
}

variable "instance_names" {
    type = list
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z07511293FMH2POOUP6DK"
}

variable "domain_name" {
    default = "vensa.online"
}

variable "sg_id" {
        default = ["sg-04177bb468ff68998"]
}