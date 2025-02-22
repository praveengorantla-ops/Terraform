resource "aws_instance" "name" {
    ami = "ami-0d0913a373377ae9f"
    key_name = "prvnkeypair"
    instance_type = "t2.micro"
}