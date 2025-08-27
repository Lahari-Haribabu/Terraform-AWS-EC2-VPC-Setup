variable "ec2_instance-type" {
    default = "t2.micro"
    type = string
  
}
 variable "ec2_default_root_storage_size" {
   default = 10
   type = number
}
variable "ec2_ami_id" {
  default = "ami-0cfde0ea8edd312d4"
  type = string 
}
variable "env" {
  default = "dev"
  type = string
  
}

