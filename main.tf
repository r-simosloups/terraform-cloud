variable "ami" {}
variable "region" {}
variable "instance_type" {}
variable "access_key" {}
variable "secret_key" {}
#variable "subnet_id" {}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
force_destroy = true #terraform is not able to delete this resource which this option terraform will delete the vpc default
}

resource "aws_instance" "terraform-cloud-demo-server"{
ami = var.ami
instance_type = var.instance_type
#subnet_id = var.subnet_id
tags = {
Name= "terraform-cloud-demo-server"
}

depends_on = [ aws_default_vpc.default ]
}
