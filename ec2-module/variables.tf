variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "Public EC2 instance"
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Name for the RDS database"
  type        = string
  default     = "wordpress"
}

variable "db_endpoint" {
  description = "RDS database endpoint"
  type        = string
}
