resource "aws_instance" "name" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "varkey"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "dev"
  }


}