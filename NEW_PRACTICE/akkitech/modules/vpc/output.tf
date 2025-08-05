output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_subnet_id" {
   value = aws_subnet.akkitech_public_subnet

}