resource "aws_db_instance" "myrds"{
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class 
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    identifier = var.identifier
    username = var.db_username  
    password = var.db_password
    skip_final_snapshot = true


    tags = {
        Name = "Myrdsdb"
    }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow MySQL inbound from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]    
    description     = "Allow MySQL from EC2 instances"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

