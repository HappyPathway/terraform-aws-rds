module "aurora_from_snapshot" {
  source = "../../"

  create_cluster = true
  
  cluster_identifier  = "aurora-from-snapshot"
  engine             = "aurora-postgresql"
  engine_version     = "14.6"
  
  snapshot_identifier = "my-snapshot-id"  # Replace with your snapshot ID
  
  instance_class      = "db.r6g.large"
  number_of_instances = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name

  # When restoring from snapshot, these are inherited from the snapshot
  # and should not be specified:
  # database_name  = "mydb"
  # master_username = "dbadmin"
  # master_password = "your-password-here"
  
  backup_retention_period = 7
  preferred_backup_window = "02:00-03:00"
  
  skip_final_snapshot = true
}