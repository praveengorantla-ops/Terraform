data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    values = ["prvnsbnet1"] # insert value here
  }
}
data "aws_security_group" "example" {
  filter {
    name   = "tag:Name"
    values = ["prvnsg"]
  }
}



resource "aws_instance" "devprvn" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.example.id]

}