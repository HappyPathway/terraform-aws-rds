module "aurora_point_in_time" {
  source = "../../"

  create_cluster = true
  
  cluster_identifier = "aurora-restored"
  engine            = "aurora-postgresql"
  engine_version    = "14.6"
  
  enable_restore_to_point_in_time = true
  restore_source_cluster_identifier = "source-cluster-identifier"  # Replace with source cluster identifier
  restore_type                    = "copy-on-write"
  restore_use_latest_restorable_time = true
  
  instance_class      = "db.r6g.large"
  number_of_instances = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name
  
  # When using point-in-time restore, these are inherited from source cluster
  # and should not be specified:
  # database_name  = "mydb"
  # master_username = "dbadmin"
  # master_password = "your-password-here"
  
  backup_retention_period = 7
  preferred_backup_window = "02:00-03:00"
  
  skip_final_snapshot = true
}