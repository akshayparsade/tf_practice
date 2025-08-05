output "private_subnet_cidr" {
  value = aws_subnet.private_subnet_cidr.id
}

output "public_subnet_id" {
   value = aws_subnet.public_subnet_cidr.id

}