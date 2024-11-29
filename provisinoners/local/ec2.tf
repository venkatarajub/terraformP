# Provisiners will work at the time of resource creation
resource "aws_instance" "pro-loc" {
    ami = data.aws_ami.joindevops.id
    instance_type = local.instance_type
    vpc_security_group_ids = var.sg_id
    tags = var.tags
    
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"
                
    }
}