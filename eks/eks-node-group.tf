resource "aws_eks_node_group" "node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "NG-${var.project_name}"
  node_role_arn   = data.aws_iam_role.labrole.arn
  subnet_ids      = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.default_region}e"]
  disk_size       = 50
  instance_types   = [var.instance_type]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}