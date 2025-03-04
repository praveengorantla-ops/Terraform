provider "aws" {
    region = "us-west-2"
}
provider "aws" {
  alias  = "secondary"  
  region = "ap-south-1"
}