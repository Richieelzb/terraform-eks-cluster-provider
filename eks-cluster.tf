module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    private_nodes = {
      desired_size = 2
      min_size     = 2
      max_size     = 3

      instance_types = ["t3.medium"]
      subnet_ids     = module.vpc.private_subnets
    }
  }

  tags = {
    Environment = "dev"
  }
}
