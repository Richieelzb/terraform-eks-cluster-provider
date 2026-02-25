terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.38"
    }
  }

  backend "s3" {
    bucket = "terraform-bucket-lzb-001"
    key    = "kubernetes-provider/terraform.tfstate"
    region = "ap-south-1"
    // use_lockfile = true
  }
}

provider "aws" {
  region = var.aws-region
}

/*resource "null_resource" "kubeconfig" {
  depends_on = [module.eks]

  provisioner "local-exec" {
    command = <<EOT
  aws eks update-kubeconfig \
  --region ap-south-1 \
  --name my-eks-cluster
EOT
  }
}*/
