provider "aws" {
  region = "us-east-1"
  alias  = "primary"
}

provider "aws" {
  region = "us-west-2" 
  alias  = "secondary"
}

variables {
  create_cluster = true
  create_global_cluster = true
  global_cluster_identifier = "test-global-cluster"
  engine = "aurora-postgresql"
  engine_version = "14.6"
  instance_class = "db.r6g.large"
  db_name = "testdb"
  master_username = "testadmin" 
  master_password = "testpassword12345"
  db_subnet_group_name = "default"
  monitoring_interval = 30
  performance_insights_enabled = true
  db_cluster_parameter_group_name = "test-cluster-pg"
  parameter_group_name = "test-instance-pg"
}

run "create_global_cluster" {
  command = plan

  assert {
    condition = aws_rds_global_cluster.global[0].global_cluster_identifier == var.global_cluster_identifier
    error_message = "Global cluster identifier does not match expected value"
  }

  assert {
    condition = aws_rds_global_cluster.global[0].engine == var.engine
    error_message = "Global cluster engine does not match expected value"
  }
}

run "validate_monitoring" {
  command = plan

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].monitoring_interval == var.monitoring_interval
    error_message = "Monitoring interval does not match expected value"
  }

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].performance_insights_enabled == var.performance_insights_enabled
    error_message = "Performance insights setting does not match expected value"
  }
}

run "validate_parameter_groups" {
  command = plan

  assert {
    condition = aws_rds_cluster.cluster[0].db_cluster_parameter_group_name == var.db_cluster_parameter_group_name
    error_message = "Cluster parameter group does not match expected value"
  }

  assert {
    condition = aws_rds_cluster_instance.cluster_instance[0].db_parameter_group_name == var.parameter_group_name
    error_message = "Instance parameter group does not match expected value"
  }
}