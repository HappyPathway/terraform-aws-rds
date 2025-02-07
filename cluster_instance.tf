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
  dbi_resource_id                       = var.dbi_resource_id
  engine                                = var.engine
  engine_version                        = var.engine_version
  engine_version_actual                 = var.engine_version_actual
  force_destroy                         = var.force_destroy
  identifier                            = var.number_of_instances > 1 ? "${var.identifier}-${count.index + 1}" : var.identifier
  identifier_prefix                     = var.identifier_prefix
  instance_class                        = var.instance_class
  kms_key_id                            = var.kms_key_id
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  network_type                          = var.network_type
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  preferred_backup_window               = var.backup_window
  preferred_maintenance_window          = var.maintenance_window
  promotion_tier                        = var.promotion_tier
  publicly_accessible                   = var.publicly_accessible
  storage_encrypted                     = var.storage_encrypted
  tags                                  = var.tags
  tags_all                              = var.tags_all

  timeouts {
    create = "90m"
    update = "90m"
    delete = "90m"
  }

  depends_on = [aws_rds_cluster.cluster]
}
