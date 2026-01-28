
resource "aws_key_pair" "eks_ssh" {
  key_name   = "eks-ng-ssh"
  public_key = file("~/.ssh/eks-ng-ssh.pub")
}
