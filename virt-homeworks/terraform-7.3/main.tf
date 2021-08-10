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
/*
terraform {
      backend "s3" {
      bucket = "tfstate-state-terraform"
      key    = "tfstate-state-terraform/terraform-7.3"
      region = "us-west-2"
  }
}
*/

locals {
  google_instance_type_map = {
    stage = "t2.micro" 
    prod  = "t3.large"
  }
}
locals {
  google_instance_count_map = {
    stage = "1" 
    prod  = "2"
  }
}
locals {
  instances = {
    "t2.micro" = data.aws_ami.ubuntu.id
    "t3.large" = data.aws_ami.ubuntu.id
  }
}
resource "aws_instance" "google" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.google_instance_type_map[terraform.workspace]
  count = local.google_instance_count_map[terraform.workspace]
  tags = {
    Name = "Deploy VM"
  }
  root_block_device {
          delete_on_termination = true
          volume_size           = 8
          volume_type           = "gp2"
        }
      
}

resource "aws_instance" "serverweb" {
  for_each = local.instances

  ami = each.value
  instance_type = each.key

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["tags"]
  }
        
}