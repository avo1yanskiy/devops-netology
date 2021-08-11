# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]

  filter {
    name   = "public"
    values = ["true"]
  
  filter {
    name   = "image_owner_alias"
    values = ["amazon"]

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ServerWeb" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "My First Install AWS"
  }
  root_block_device {
          delete_on_termination = false
          volume_size           = 8
          volume_type           = "gp2"
        }
}