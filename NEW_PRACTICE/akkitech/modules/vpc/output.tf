output "private_subnet_id" {
  value = aws_subnet.private_subnet_cidr.id
}

output "public_subnet_id" {
   value = aws_subnet.public_subnetcidr.id.id

}