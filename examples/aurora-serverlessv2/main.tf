module "aurora_serverlessv2" {
  source = "../../"

  create_cluster = true
  
  cluster_identifier = "aurora-serverlessv2"
  engine            = "aurora-postgresql"
  engine_version    = "14.6"
  engine_mode       = "provisioned"  # Required for Serverless v2
  
  db_name          = "myapp"
  master_username = "dbadmin"
  master_password = "your-password-here"
  
  instance_class = "db.serverless"
  number_of_instances = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name

  enable_serverlessv2_scaling = true
  serverlessv2_scaling_configuration = {
    min_capacity = 0.5
    max_capacity = 16.0
  }
  
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  
  skip_final_snapshot = true
}