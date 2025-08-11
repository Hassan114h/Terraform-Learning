output "ec2_sg_id" {
  value = module.ec2_module.ec2_sg_id
}

output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2_module.ec2_public_ip
}

output "rds_endpoint" {
  value = module.myrds.endpoint
}

output "rds_username" {
  value = var.db_username
}

output "rds_password" {
  value = var.db_password
  sensitive = true
}

output "rds_dbname" {
  value = var.db_name
}
