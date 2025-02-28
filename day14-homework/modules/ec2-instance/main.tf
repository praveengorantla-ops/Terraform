variable "env_name" {}
variable "instance_type" {}

resource "aws_instance" "name" {
  ami             = "ami-0d682f26195e9ec0f"
  instance_type   = var.instance_type
  key_name        = "varkey"
  availability_zone = "ap-south-1b"
  tags = {
    Name = var.env_name
  }
}