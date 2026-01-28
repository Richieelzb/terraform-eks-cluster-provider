module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  cluster_endpoint_public_access = true
  // enable_cluster_creator_admin_permissions = true


  # Disable Launch Template for all node groups (module defaults)
  # eks_managed_node_group_defaults = {
  #   create_launch_template = false
  # }

  eks_managed_node_groups = {
    private_nodes = {
      desired_size   = 2
      min_size       = 2
      max_size       = 3
      instance_types = ["t3.medium"]
      subnet_ids     = module.vpc.private_subnets

      # remote_access = {
      #   ec2_ssh_key               = data.aws_key_pair.existing-key.key_name
      #   source_security_group_ids = [aws_security_group.bastion_sg.id] # Only allow from bastion/VPN SG
      # }

    }
  }

  tags = {
    Environment = "dev"
  }
}
