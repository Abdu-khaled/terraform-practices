data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2_nginx" {
  source        = "../modules/ec2-nginx"
  name          = "arch2-nginx"
  subnet_id     = aws_subnet.public.id
  sg_ids        = [aws_security_group.web.id]
  instance_type = var.instance_type
  key_name      = var.key_name
  ami_id        = data.aws_ami.al2.id
}