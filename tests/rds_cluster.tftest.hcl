variables {
  create_cluster = true
  cluster_identifier = "test-aurora-cluster"
  engine = "aurora-postgresql"
  engine_version = "14.6"
  instance_class = "db.r6g.large"
  number_of_instances = 2
  db_name = "testdb"
  master_username = "testadmin"
  master_password = "testpassword12345"
  backup_retention_period = 7
  preferred_backup_window = "03:00-04:00"
  db_subnet_group_name = "default"
  deletion_protection = false
  skip_final_snapshot = true
}

run "create_aurora_cluster" {
  command = plan

  assert {
    condition = aws_rds_cluster.cluster[0].cluster_identifier == var.cluster_identifier
    error_message = "Cluster identifier does not match expected value"
  }

  assert {
    condition = aws_rds_cluster.cluster[0].engine == var.engine
    error_message = "Database engine does not match expected value"
  }

  assert {
    condition = aws_rds_cluster.cluster[0].master_username == var.master_username
    error_message = "Master username does not match expected value"
  }

  assert {
    condition = length(aws_rds_cluster_instance.cluster_instance) == var.number_of_instances
    error_message = "Number of cluster instances does not match expected value"
  }
}

run "validate_cluster_instances" {
  command = plan

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].instance_class == var.instance_class
    error_message = "Instance class does not match expected value"
  }

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].engine == var.engine
    error_message = "Instance engine does not match expected value"
  }

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].identifier == "${var.cluster_identifier}-1"
    error_message = "First instance identifier does not match expected pattern"
  }

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[1].identifier == "${var.cluster_identifier}-2"
    error_message = "Second instance identifier does not match expected pattern"
  }
}

run "validate_backup_settings" {
  command = plan

  assert {
    condition = aws_rds_cluster.cluster[0].backup_retention_period == var.backup_retention_period
    error_message = "Backup retention period does not match expected value"
  }

  assert {
    condition = aws_rds_cluster.cluster[0].preferred_backup_window == var.preferred_backup_window
    error_message = "Backup window does not match expected value" 
  }
}

run "validate_security_settings" {
  command = plan

  assert {
    condition = aws_rds_cluster.cluster[0].deletion_protection == var.deletion_protection
    error_message = "Deletion protection setting does not match expected value"
  }

  assert {
    condition = aws_rds_cluster.cluster[0].storage_encrypted == true
    error_message = "Storage encryption should be enabled by default"
  }
}