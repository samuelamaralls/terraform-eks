resource "aws_eks_node_group" "eks_node_group_01" {
  cluster_name    = var.cluster_name
  node_group_name = "node-01"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b,
    var.private_subnet_1c
  ]
  tags = merge(
    var.tags,
    {
      Name = "node-01"
    }
  )

  instance_types = ["t3.medium"]

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group_role_attach_worker,
    aws_iam_role_policy_attachment.eks_node_group_role_attach_ecr,
    aws_iam_role_policy_attachment.eks_node_group_role_attach_cni
  ]
}

resource "aws_eks_node_group" "eks_node_group_02" {
  cluster_name    = var.cluster_name
  node_group_name = "node-02"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b,
    var.private_subnet_1c
  ]
  tags = merge(
    var.tags,
    {
      Name = "node-02"
    }
  )

  instance_types = ["t3.medium"]

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group_role_attach_worker,
    aws_iam_role_policy_attachment.eks_node_group_role_attach_ecr,
    aws_iam_role_policy_attachment.eks_node_group_role_attach_cni
  ]
}