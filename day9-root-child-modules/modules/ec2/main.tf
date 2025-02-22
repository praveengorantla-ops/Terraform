resource "aws_instance" "this" {
  ami = "ami-0ddfba243cbee3768" # Replace with a valid AMI
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2"
  }
}