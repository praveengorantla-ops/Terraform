variable "rds-password" {
    description = "rds password"
    type = string
    default = "srivardhan"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
variable "ami" {
    description = "ami"
    type = string
    default = "ami-0d682f26195e9ec0f"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t2.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "varkey"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}