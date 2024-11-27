resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids = var.sg_id

    tags = merge(
        var.tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_route53_record" "expense" {
  count = length(var.instance_names)  
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}