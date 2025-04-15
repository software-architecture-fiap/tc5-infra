resource "aws_eks_cluster" "eks_videoprocess_cluster" {
  name     = "EKS-${var.project_name}"
  role_arn = data.aws_iam_role.eks_labrole.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.eks_subnet : subnet.id if subnet.availability_zone != "${var.default_region}e"]
    security_group_ids = [aws_security_group.eks_videoprocess_sg.id]
  }

  access_config {
    authentication_mode = var.access_config
  }
}
