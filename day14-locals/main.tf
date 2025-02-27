# locals {
#   bucket-name = "${var.layer}-${var.env}-bucket-hydnard"
#   env = "dev"
#   type = "web"
# }

# resource "aws_s3_bucket" "demo" {
#   bucket = "web-test-bucket-hydnaresh"
#   bucket = "${var.layer}-${var.env}-bucket-hyd"
#   bucket = local.bucket-name
#   tags = {
#         Name = "${var.layer}-${var.env}-bucket-hyd"
#         Name = local.type
#         Environment = local.env
#   }



# }


######### Ex:2
provider "aws" {
  
}
locals {
  region = "ap-south-1"
  Environment = "dev"
  instance_type = "t2.micro"
  ami = "ami-0d682f26195e9ec0f"
  Name = var.name
}

resource "aws_instance" "example" {
  ami = local.ami # Amazon Linux 2 AMI
  instance_type = local.instance_type

  tags = {
    Name  = local.Name
    Environment = local.Environment
  }
}