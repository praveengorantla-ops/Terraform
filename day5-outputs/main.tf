resource "aws_instance" "dev" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "varkey"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "dev"
    }
  
}

#creating s3 bucket and dynamo DB for state backend storage and applying the lock mechanism for statefile

# this backend configuration instructs terraform to store its state in an s3 bucket.
terraform {
  backend "s3" {
    bucket = "prvnkmrbtch"
    region = "ap-south-1"
    key = "day5/terraform.tfstate" 
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
  }
}