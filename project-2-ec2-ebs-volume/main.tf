provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "server" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  tags = {
    Name = "Terraform_EC2"
  }

}

resource "aws_ebs_volume" "ebs_volume" {
  size              = 20
  availability_zone = aws_instance.server.availability_zone
  tags = {
    Name = "Terraform_EBS"
  }

}

resource "aws_volume_attachment" "ebs_ec2_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.server.id

}
