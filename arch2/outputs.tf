output "nginx_public_ip" {
  value = module.ec2_nginx.public_ip
}

output "nginx_instance_id" {
  value = module.ec2_nginx.instance_id
}
