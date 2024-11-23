resource "aws_security_group" "sg_tera" {
    name = "sg_tera"
    description = "allow ssh on port no 22"
    vpc_id  = var.vpc_id
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
  }
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
  }
  tags = {
    Name = "sg_terraform"
  }

}

resource "aws_instance" "terraform" {
    ami = var.ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg_tera.id]
    tags = var.tags
}