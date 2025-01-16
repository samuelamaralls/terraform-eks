resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.example_vpc_eks.id


  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "eks_public_rtb" {
  vpc_id = aws_vpc.example_vpc_eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-public-rtb"
    }
  )
}