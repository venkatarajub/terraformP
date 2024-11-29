resource "aws_instance" "expense" {
    for_each = var.instance_names 
    ami = data.aws_ami.joindevops.id
    instance_type = local.instance_type
    vpc_security_group_ids = var.sg_id
    tags = merge(
        var.tags,
        {
            Name = each.key
        }
    )
}

resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
  zone_id = var.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite =  true
}