output "private_subnet_id" {
  value = aws_subnet.akkitech_private_subnet.id
}

output "public_subnet_id" {
  value = aws_subnet.akkitech_public_subnet.id
}

output "vpc_id" {
    value = aws_vpc.akkitech_vpc.id
  
}