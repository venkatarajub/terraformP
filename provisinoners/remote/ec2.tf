# Provisiners will work at the time of resource creation
resource "aws_instance" "pro-loc" {
    ami = data.aws_ami.joindevops.id
    instance_type = local.instance_type
    vpc_security_group_ids = var.sg_id
    tags = var.tags

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
  }
    
    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx" 
      ]
  }
    provisioner "remote-exec" {
      when = "destroy"
      inline = [
        "sudo systemctl stop nginx"
      ]
    }
}