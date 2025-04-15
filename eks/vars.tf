variable "default_region" {
  description = "Default AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  default = "videoprocess-cluster"
  type    = string
}

variable "account_id" {
  description = "The AWS account ID"
  default     = "147671223315" # Atualizar com o ID correto
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the IAM policy to associate with the EKS cluster"
  type        = string
  default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t3a.medium"
  type        = string
}

variable "access_config" {
  description = "The access configuration for the EKS cluster"
  default     = "API_AND_CONFIG_MAP"
  type        = string
}
