resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr) # cidr == source of truth 
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index] #loop --give each one a new cidr based on order
  availability_zone = var.azs[count.index] 
  map_public_ip_on_launch = true 
  tags = var.tags
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index] #same as public
  tags = var.tags
}



# public_subnet [0] - us-east-1 - 10.0.0.0/24