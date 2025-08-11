resource "aws_instance" "public_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  security_groups = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  
  user_data = <<-EOF
  #!/bin/bash
  set -e

  sudo dnf update -y
  sudo dnf install -y httpd php php-mysqlnd php-gd php-xml php-mbstring php-opcache
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo dnf install -y mysql

  sudo rm -f /var/www/html/index.html

  wget https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
  sudo cp -r wordpress/* /var/www/html/
  sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

  sudo sed -i "s/database_name_here/${var.db_name}/" /var/www/html/wp-config.php
  sudo sed -i "s/username_here/${var.db_username}/" /var/www/html/wp-config.php
  sudo sed -i "s/password_here/${var.db_password}/" /var/www/html/wp-config.php
  sudo sed -i "s/localhost/${var.db_endpoint}/" /var/www/html/wp-config.php

  sudo chown -R apache:apache /var/www/html/
  sudo chmod -R 755 /var/www/html/

  sudo systemctl restart httpd

  rm -rf wordpress latest.tar.gz
  EOF

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow HTTP/HTTPS inbound and all outbound"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  # Optional SSH for troubleshooting
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["51.14.123.107/32"]
    description = "Allow SSH from my IP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}
