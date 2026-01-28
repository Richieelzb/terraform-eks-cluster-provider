/*resource "aws_instance" "bastion-ec2" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance-type
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = data.aws_key_pair.existing-key.key_name
  iam_instance_profile        = aws_iam_instance_profile.bastion_profile.name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]

  tags = { Name = "eks-bastion" }
}
*/