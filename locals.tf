
locals {
  owners      = var.business-division
  Environment = var.environment
  Name        = "${var.environment}-${var.business-division}"

  common_tags = {
    owners      = local.owners
    environment = local.Environment
  }

  eks_cluster_name = "${local.Name}-${var.eks-cluster}"
  // aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"), 1)
}