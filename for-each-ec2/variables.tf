variable "instance_names" {
    type = map
    default = {
        mysql = "t2.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
}


variable vpc_id {
    default     = "vpc-012fbf9e1d70d9a06"
}


variable "tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "environment" {
    default = "dev"
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