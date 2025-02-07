# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_rds_cluster_instance" "cluster_instance" {
  count = var.create_cluster_instance ? var.number_of_instances : 0
  
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  ca_cert_identifier                    = var.ca_cert_identifier
  cluster_identifier                    = aws_rds_cluster.cluster[0].id
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  custom_iam_instance_profile           = var.custom_iam_instance_profile
  db_parameter_group_name               = var.parameter_group_name
  db_subnet_group_name                  = var.db_subnet_group_name
  engine                                = var.engine
  engine_version                        = var.engine_version
  force_destroy                         = var.force_destroy
  identifier                            = "${var.cluster_identifier}-${count.index + 1}"
  instance_class                        = var.instance_class
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null
  preferred_backup_window               = var.preferred_backup_window
  preferred_maintenance_window          = var.maintenance_window
  promotion_tier                        = var.promotion_tier
  publicly_accessible                   = var.publicly_accessible
  tags                                  = var.tags
  tags_all                              = var.tags_all

  timeouts {
    create = "90m"
    update = "90m"
    delete = "90m"
  }

  depends_on = [aws_rds_cluster.cluster]
}
