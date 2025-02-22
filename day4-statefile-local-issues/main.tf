resource "aws_instance" "name" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "varkey"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "devlp"
    }
  

}


#note developers overwriting each nothers work if separe state file for same project
#merge conflicts in terraform.tfstate
#if two developers run terraform apply at the same time, one may overwrite the others changes, causing unexpected resource modifications.
#both developers working independently not collaborative
#solution: maintain common statefile to overcome above issues