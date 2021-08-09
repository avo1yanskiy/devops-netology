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

  owners = ["099720109477"] # Canonical
}

terraform {
      backend "s3" {
      bucket = "tfstate-state-terraform"
      key    = "tfstate-state-terraform/init-1"
      region = "us-west-2"
  }
}
resource "aws_instance" "ServerWeb" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "Deploy VM"
  }
  root_block_device {
          delete_on_termination = false
          volume_size           = 8
          volume_type           = "gp2"
        }
        
}