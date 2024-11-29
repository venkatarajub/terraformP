resource "aws_security_group" "multiport" {
    name = "dynamic demo"
    description = "open multiports"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value["from_port"]
            to_port =  ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
}