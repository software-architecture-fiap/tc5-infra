data "aws_iam_role" "eks_labrole" {
  name = "LabRole"
}

data "aws_subnets" "eks_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}

data "aws_subnet" "eks_subnet" {
  for_each = toset(data.aws_subnets.eks_subnets.ids)
  id       = each.value
}

data "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr
}
