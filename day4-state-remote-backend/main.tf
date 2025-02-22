resource "aws_instance" "name" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "varkey"
    availability_zone = "ap-south-1b"
    tags = {
      name = "devl"
    }


}

resource "aws_s3_bucket" "name" {
  bucket = "prvnpvngp"


}

#note:when multiple developers work on the same terraform state file (terraform.tfstate), several problems can arise. these issues can cause conflicts, resource corruption, and deployment failures.
#merge conflicts in terraform.tfstate
#if a developer runs terraform plan on an outdated state file, and another applies changes, the state will be out of sync.


#solution is below
# need to implement state locking provision by using dynamodb process