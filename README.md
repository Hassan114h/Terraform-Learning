# AWS WordPress Deployment with Terraform

This project summarises my learning with **Terraform**, where I provisioned infrastructure on **AWS** to deploy a WordPress application running on an EC2 instance. It includes setting up networking, security groups, an RDS database, and configuring Apache & PHP for WordPress.  

---

## Key Features

- **VPC Networking**: Custom VPC with subnets for isolating resources.  
- **EC2 Instance**: Hosts the WordPress application with Apache and PHP installed and configured.  
- **RDS Database**: MySQL database for WordPress persistence.  
- **Security Groups**: Controlled inbound/outbound traffic for EC2 and RDS, ensuring security.  
- **Terraform Modules**: Infrastructure provisioned using reusable, maintainable modules.  
- **Automated Deployment**: Infrastructure deployed through a CI/CD pipeline to reduce manual errors and speed up release cycles.  

---

## How To Use It

### Prerequisites
- AWS account with IAM user credentials (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)  
- Terraform installed locally  

### Steps

```bash
# Clone the repository
$ git clone https://github.com/your-username/Terraform-WordPress_Project
$ cd Terraform-WordPress_Project
```
