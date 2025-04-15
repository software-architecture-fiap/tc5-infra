resource "aws_eks_access_entry" "access_entry" {
  cluster_name      = aws_eks_cluster.eks_videoprocess_cluster.name
  principal_arn     = "arn:aws:iam::${var.account_id}:role/voclabs"
  kubernetes_groups = ["fiap-tc", "team"]
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_policy_association" {
  cluster_name  = aws_eks_cluster.eks_videoprocess_cluster.name
  policy_arn    = var.policy_arn
  principal_arn = "arn:aws:iam::${var.account_id}:role/voclabs"

  access_scope {
    type = "cluster"
  }
}