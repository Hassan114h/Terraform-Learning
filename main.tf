module "ec2_module" {
  source         = "./ec2-module"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  vpc_id         = var.vpc_id
  instance_name  = var.instance_name
  db_endpoint    = module.myrds.endpoint
  db_username    = var.db_username
  db_password    = var.db_password
  db_name        = var.db_name
}


module "myrds" {
  source = "./rds-module"  
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class 
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  identifier = var.identifier
  db_username = var.db_username  
  db_password = var.db_password
  vpc_id = var.vpc_id
  ec2_sg_id = module.ec2_module.ec2_sg_id
  private_subnet_ids = var.private_subnet_ids
}

/*

resource "aws_db_instance" "myrds"{
    engine = "mysql"
    engine_version = "8.0.42"
    instance_class = "XXXX" #check instance class
    allocated_storage = 20
    storage_type = "gp2"
    identifier = "mydb"
    username = var.db_username  
    password = var.db_password
    skip_final_snapshot = true

    tags = {
        Name = "Myrdsdb"
    }
}

module "vpc-module" {
  source = "./modules/vpc-module"
}

resource "aws_security_group" "ec2_sg" {
    name        = "ec2-security-group"
    description = "Allow HTTP/HTTPS inbound and all outbound"
    vpc_id      = module.vpc-module.vpc_id
 
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
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow MySQL inbound from EC2"
  vpc_id      = module.vpc-module.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
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
*/