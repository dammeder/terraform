
output "public_subnet_cidr" {
  value = aws_subnet.public[*].cidr_block
}