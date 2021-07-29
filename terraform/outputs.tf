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

output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.ubuntu : s.cidr_block]
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}
    