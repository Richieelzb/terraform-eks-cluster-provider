# Bastion security group (in the VPC)
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "SSH from office IP to bastion; egress to VPC"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from office"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}

# Allow bastion to SSH into nodes (attach to node SG)
resource "aws_security_group_rule" "allow_bastion_to_nodes_ssh" {
  type              = "ingress"
  description       = "SSH from bastion to nodes"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.eks.node_security_group_id # EKS module output
  //security_group_id        = module.eks.node_security_group_id # requires EKS module output
  source_security_group_id = aws_security_group.bastion_sg.id
}


# OR allow HTTPS from a CIDR
resource "aws_security_group_rule" "eks_https_from_cidr" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.eks.cluster_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
