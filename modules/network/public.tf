resource "aws_subnet" "example_eks_public_1a" {
  vpc_id                  = aws_vpc.example_vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 0)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_public_1b" {
  vpc_id                  = aws_vpc.example_vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 1)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_public_1c" {
  vpc_id                  = aws_vpc.example_vpc_eks.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 2)
  availability_zone       = "${data.aws_region.current.name}c"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1c",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "eks_rtb_assoc_1a" {
  subnet_id      = aws_subnet.example_eks_public_1a.id
  route_table_id = aws_route_table.eks_public_rtb.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1b" {
  subnet_id      = aws_subnet.example_eks_public_1b.id
  route_table_id = aws_route_table.eks_public_rtb.id
}

resource "aws_route_table_association" "eks_rtb_assoc_1c" {
  subnet_id      = aws_subnet.example_eks_public_1c.id
  route_table_id = aws_route_table.eks_public_rtb.id
}