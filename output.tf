# 1. VPC ID
# 2. Public Subnet IDs - subnet_key => { subnet_id, availability_zone }
# 3. Private Subnet IDs - subnet_key => { subnet_id, availability_zone }
#


locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      id = aws_subnet.this[key].id
      az = aws_subnet.this[key].availability_zone
    }
  }
  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      id = aws_subnet.this[key].id
      az = aws_subnet.this[key].availability_zone
    }
  }
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "public_subnets" {
  value       = local.output_public_subnets
  description = "List of public subnet IDs"
}

output "private_subnets" {
  value       = local.output_private_subnets
  description = "List of private subnet IDs"
}
