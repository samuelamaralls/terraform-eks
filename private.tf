resource "aws_subnet" "example_eks_private_1a" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name} - priv-subnet -1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_private_1b" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name} - priv-subnet -1b",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_private" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, 5)
  availability_zone = "${data.aws_region.current.name}c"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name} - priv-subnet -1c",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}