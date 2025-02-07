module "aurora_postgresql" {
  source = "../../"

  create_cluster = true
  
  cluster_identifier = "aurora-postgresql-demo"
  engine            = "aurora-postgresql"
  engine_version    = "14.6"
  
  db_name          = "myapp"
  master_username = "dbadmin"
  master_password = "your-password-here"
  
  instance_class      = "db.r6g.large"
  number_of_instances = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name

  backup_retention_period = 7
  preferred_backup_window = "02:00-03:00"
  
  enabled_cloudwatch_logs_exports = ["postgresql"]
  
  performance_insights_enabled = true
  monitoring_interval         = 60
  
  skip_final_snapshot     = true
}