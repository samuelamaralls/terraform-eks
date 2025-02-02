resource "aws_vpc" "example_vpc_eks" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-VPC"
    }
  )
}