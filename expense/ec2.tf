resource "aws_instance" "remote" {
    ami = data.ami_id.joindevops.id
    instance_type = local.instance_type
    vpc_security_group_ids = var.sg_id  
    tags = var.tags
}