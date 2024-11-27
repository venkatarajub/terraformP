resource  "aws_security_group" "sg_ex" {
    name = "sg_expense"
    description =  " SG for  expense project"
    vpc_id = var.vpc_id
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
  }
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
  }
}

resource "aws_instance" "expense" {
    for_each  = var.instance_names
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.sg_ex.id]
    instance_type = "t2.micro"

    tags = {
        Name = each.value
    }

}