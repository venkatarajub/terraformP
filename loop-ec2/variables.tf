variable "instance_names" {
    type = list
    default = ["mysql", "backend", "frontend"]
}

variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}

variable "vpc_id" {
    default = "vpc-012fbf9e1d70d9a06"
}