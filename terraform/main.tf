# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "ubuntu"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "WebServer" {
  ami                = data.aws_ami.ubuntu.id
  instance_type      = "t2.micro"
  availability_zone  = "us-west-2"
  volume_size        = "8 GiB"
  volume_type        = "gp2"

  tags = {
    Name = "My First Install"
  }
}
