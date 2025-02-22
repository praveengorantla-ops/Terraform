#creation of server
resource "aws_instance" "prod" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "varkey"
    subnet_id = aws_subnet.prvn-sb.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      name = "prod-ec2"
    }
}