output "ec2_public_ip"{
    description = "The public IP address of EC2"
    value = aws_instance.public_ec2.public_ip
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
  description = "Security group ID for EC2 instances"
}


