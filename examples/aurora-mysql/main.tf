provider "aws" {
  region = "us-west-2"
}

# VPC
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "aurora-mysql-example"
  }
}

# Subnets
resource "aws_subnet" "example" {
  count             = 2
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "aurora-mysql-example-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "aurora-mysql-example"
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "example" {
  name       = "aurora-mysql-example"
  subnet_ids = aws_subnet.example[*].id

  tags = {
    Name = "aurora-mysql-example"
  }
}

# Security Group
resource "aws_security_group" "example" {
  name_prefix = "aurora-mysql-example"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aurora-mysql-example"
  }
}

# Data source for AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# Aurora MySQL Cluster
module "aurora_mysql" {
  source = "../../"
  
  create_cluster = true
  
  cluster_identifier = "aurora-mysql-demo"
  engine            = "aurora-mysql"
  engine_version    = "8.0.mysql_aurora.3.04.0"
  
  db_name          = "myapp"
  master_username  = "dbadmin"
  master_password  = "YourSecurePasswordHere123!"
  
  instance_class      = "db.r6g.large"
  number_of_instances = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name
  availability_zones     = data.aws_availability_zones.available.names
  
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  
  backup_retention_period   = 7
  preferred_backup_window   = "02:00-03:00"
  
  performance_insights_enabled = true
  monitoring_interval         = 60
  create_monitoring_role      = true
  
  skip_final_snapshot = true

  tags = {
    Environment = "dev"
    Project     = "aurora-mysql-example"
  }
}

# Outputs
output "cluster_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = module.aurora_mysql.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "A read-only endpoint for the cluster"
  value       = module.aurora_mysql.cluster_reader_endpoint
}

output "cluster_port" {
  description = "The database port"
  value       = module.aurora_mysql.cluster_port
}