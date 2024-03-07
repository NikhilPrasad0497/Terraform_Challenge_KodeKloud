resource "aws_instance" "citadel" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.citadel-key.id

    user_data = file("install-nginx.sh")

}

output "AWS_INSTANCE_IP" {
    value = aws_instance.citadel.public_dns
  
}