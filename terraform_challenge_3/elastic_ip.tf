resource "aws_eip" "eip" {
    instance = aws_instance.citadel.id
    vpc = true

    provisioner "local-exec" {
      command = "echo ${self.public_dns} >> /root/citadel_public_dns.txt"
    }
  
}

resource "aws_eip_association" "eip_association" {
    instance_id = aws_instance.citadel.id
  
}