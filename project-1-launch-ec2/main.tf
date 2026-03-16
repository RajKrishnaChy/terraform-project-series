variable "region" {
  description = "The name of region in which you are deploying the instance"
  default     = "us-east-1"

}



provider "aws" {
  region = var.region

}



variable "ami_value" {
  description = "The id of the ami"
  default     = "ami-02dfbd4ff395f2a1b"

}

variable "instance_type_value" {
  description = "The value of the instance_type"
  default     = "t3.micro"

}

resource "aws_instance" "computer" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  tags = {
    Name = "My-EC2-Instance"
  }

}

output "show_inastance_publicip" {
  value = aws_instance.computer.public_ip

}

