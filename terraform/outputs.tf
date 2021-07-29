data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
data "aws_region" "current" {}

output "name" {
        value = data.aws_region.current.name
}
output "endpoint" {
        value = data.aws_region.current.endpoint
}

output "instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.ServerWeb.id
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.ServerWeb.public_ip
}

data "aws_subnet" "ServerWeb" {}

output "subnet_cidr_blocks" {
  value = data.aws_subnet.ServerWeb : s.cidr_block
}