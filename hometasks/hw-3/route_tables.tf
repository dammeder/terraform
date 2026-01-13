resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id 


  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

    tags = {
      "Name" = "public_route_table"
    }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id


  route { 
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = { 
    "Name" = "private_route_table"
  }
}


resource "aws_route_table_association" "public_assoc" {
  count = length(aws_subnet.public) # 3
  subnet_id = aws_subnet.public[count.index].id # aws_subnet.public[0].id
  route_table_id = aws_route_table.public_route_table.id 
    #"aws_route_table" "public_route_table"
}

resource "aws_route_table_association" "private_assoc" {
  count = length(aws_subnet.private)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}