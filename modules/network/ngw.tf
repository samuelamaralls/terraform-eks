resource "aws_eip" "eks_ngw_eip-1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

#resource "aws_eip" "eks_ngw_eip-1b" {
#  domain = "vpc"
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-eip-1b"
#    }
#  )
#}
#
#resource "aws_eip" "eks_ngw_eip-1c" {
#  domain = "vpc"
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-eip-1c"
#    }
#  )
#}

resource "aws_nat_gateway" "ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip-1a.id
  subnet_id     = aws_subnet.example_eks_public_1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

#resource "aws_nat_gateway" "ngw_1b" {
#  allocation_id = aws_eip.eks_ngw_eip-1b.id
#  subnet_id     = aws_subnet.example_eks_public_1b.id
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-ngw-1b"
#    }
#  )
#}
#
#resource "aws_nat_gateway" "ngw_1c" {
#  allocation_id = aws_eip.eks_ngw_eip-1c.id
#  subnet_id     = aws_subnet.example_eks_public_1c.id
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-ngw-1c"
#    }
#  )
#}

resource "aws_route_table" "eks_private_rtb-1a" {
  vpc_id = aws_vpc.example_vpc_eks.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-private-rtb-1a"
    }
  )
}

#resource "aws_route_table" "eks_private_rtb-1b" {
#  vpc_id = aws_vpc.example_vpc_eks.id
#
#  route {
#    cidr_block     = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.ngw_1b.id
#  }
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-private-rtb-1b"
#    }
#  )
#}
#
#resource "aws_route_table" "eks_private_rtb-1c" {
#  vpc_id = aws_vpc.example_vpc_eks.id
#
#  route {
#    cidr_block     = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.ngw_1c.id
#  }
#
#  tags = merge(
#    var.tags,
#    {
#      Name = "${var.project_name}-private-rtb-1c"
#    }
#  )
#}