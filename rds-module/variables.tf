variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "8.0.42"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The allocated storage (in GB) for the RDS instance"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The type of storage for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "identifier" {
  description = "The identifier (name) for the RDS instance"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"  
}

variable "db_name" {
  description = "Name for the RDS database"
  type        = string
  default     = "wordpress"
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true   
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be launched"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group ID of the EC2 instance"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS subnet group"
  type        = list(string)
}