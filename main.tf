provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_name_value}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["${var.ami_virtualization-type}"]
  }
filter {
  name = "owner-alias"
  values = [
    "amazon"]
}
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.tag}"
  }
}