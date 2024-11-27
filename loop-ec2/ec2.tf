# create 3 insatnces using count loop
resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg_exp.id]

    tags = {
        Name = var.instance_names[count.index]
    }
}

resource "aws_security_group" "sg_exp" {
    name = "sg_exp"
    description = "expense sg"
    vpc_id = var.vpc_id
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "expense-sg"
    }
}