resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.sg_ids
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    set -e
    yum update -y
    amazon-linux-extras enable nginx1
    yum install -y nginx
    systemctl enable --now nginx
    echo "<h1>Arch2 via module — Nginx is running</h1>" > /usr/share/nginx/html/index.html
  EOF

  tags = {
    Name = var.name
  }
}
