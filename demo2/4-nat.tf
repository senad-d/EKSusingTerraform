resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name    = "nat"
    Project = "learnk8s-test"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-eu-west-1a.id

  tags = {
    Name    = "nat"
    Project = "learnk8s-test"
  }

  depends_on = [aws_internet_gateway.igw]
}