
resource "aws_key_pair" "eks_ssh" {
  key_name   = "lupfumo-key-mumbai"                         # Name shown in EC2
  public_key = file("${path.module}/lupfumo-key-mumbai.pem") # Reads from current module directory
}
