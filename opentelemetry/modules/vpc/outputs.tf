output "vpc_id" {
    description = "VPC id"
    value = aws_vpc.main.id
  
}

output "private_subnet_ids" {
    description = "private sub ids"
    value = aws_subnet.private[*].id
  
}

output "public_subnet_ids" {
    description = "Pub sub ids"
    value = aws_subnet.public[*].id
}