resource "aws_subnet" "example_eks_public_1a" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 0)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1a",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_public_1b" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 1)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1b",
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "example_eks_public_1c" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, 2)
  availability_zone       = "${data.aws_region.current.name}c"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name} - pub-subnet -1c",
      "kubernetes.io/role/elb" = 1
    }
  )
}