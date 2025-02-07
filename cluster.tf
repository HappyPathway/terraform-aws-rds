# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "arn:aws-us-gov:rds:us-gov-west-1:229685449397:cluster:rds-csvd-morph-dev"
resource "aws_rds_cluster" "cluster" {
  count = var.create_cluster ? 1 : 0
  allocated_storage                     = var.allocated_storage
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  apply_immediately                     = var.apply_immediately
  availability_zones                    = var.availability_zones
  backtrack_window                      = var.backtrack_window
  backup_retention_period               = var.backup_retention_period
  ca_certificate_identifier             = var.ca_cert_identifier
  cluster_identifier                    = var.cluster_identifier
  cluster_identifier_prefix             = var.identifier_prefix
  cluster_members                       = var.cluster_members
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  database_name                         = var.db_name
  db_cluster_instance_class             = var.instance_class
  db_cluster_parameter_group_name       = var.db_cluster_parameter_group_name
  db_instance_parameter_group_name      = var.parameter_group_name
  db_subnet_group_name                  = var.db_subnet_group_name
  db_system_id                          = var.db_system_id
  delete_automated_backups              = var.delete_automated_backups
  deletion_protection                   = var.deletion_protection
  domain                                = var.domain
  domain_iam_role_name                  = var.domain_iam_role_name
  enable_global_write_forwarding        = var.enable_global_write_forwarding
  enable_http_endpoint                  = var.enable_http_endpoint
  enable_local_write_forwarding         = var.enable_local_write_forwarding
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  engine                                = var.engine
  engine_lifecycle_support              = var.engine_lifecycle_support
  engine_mode                           = var.engine_mode
  engine_version                        = var.engine_version
  final_snapshot_identifier             = var.final_snapshot_identifier
  global_cluster_identifier             = var.global_cluster_identifier
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  iam_roles                             = var.iam_roles
  iops                                  = var.iops
  kms_key_id                            = var.kms_key_id
  manage_master_user_password           = var.manage_master_user_password
  master_password                       = var.password # sensitive
  master_user_secret_kms_key_id         = var.master_user_secret_kms_key_id
  master_username                       = var.username
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  network_type                          = var.network_type
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  port                                  = var.port
  preferred_backup_window               = var.backup_window
  preferred_maintenance_window          = var.maintenance_window
  replication_source_identifier         = var.replicate_source_db
  skip_final_snapshot                   = var.skip_final_snapshot
  snapshot_identifier                   = var.snapshot_identifier
  source_region                         = var.source_region
  storage_encrypted                     = var.storage_encrypted
  storage_type                          = var.storage_type
  tags                                  = var.tags
  tags_all                              = var.tags_all
  vpc_security_group_ids                = var.vpc_security_group_ids

  dynamic "serverlessv2_scaling_configuration" {
    for_each = var.engine_mode == "provisioned" && var.enable_serverlessv2_scaling ? [1] : []
    content {
      max_capacity = var.serverlessv2_max_capacity
      min_capacity = var.serverlessv2_min_capacity
    }
  }

  dynamic "scaling_configuration" {
    for_each = var.engine_mode == "serverless" ? [1] : []
    content {
      auto_pause               = var.scaling_auto_pause
      max_capacity            = var.scaling_max_capacity
      min_capacity            = var.scaling_min_capacity
      seconds_until_auto_pause = var.scaling_seconds_until_auto_pause
      timeout_action          = var.scaling_timeout_action
    }
  }

  dynamic "s3_import" {
    for_each = var.enable_s3_import ? [1] : []
    content {
      bucket_name           = var.s3_import_bucket_name
      bucket_prefix         = var.s3_import_bucket_prefix
      ingestion_role       = var.s3_import_ingestion_role
      source_engine        = var.s3_import_source_engine
      source_engine_version = var.s3_import_source_engine_version
    }
  }

  dynamic "restore_to_point_in_time" {
    for_each = var.enable_restore_to_point_in_time ? [1] : []
    content {
      source_cluster_identifier  = var.restore_source_cluster_identifier
      source_cluster_resource_id = var.restore_source_cluster_resource_id
      restore_type              = var.restore_type
      use_latest_restorable_time = var.restore_use_latest_restorable_time
      restore_to_time           = var.restore_to_time
    }
  }

  lifecycle {
    ignore_changes = [
      # Ignore engine_version changes during auto minor version upgrades
      engine_version,
      # Ignore changes to snapshot identifier after initial restore
      snapshot_identifier,
      # Ignore changes to replication source after initial setup
      replication_source_identifier
    ]

    # Prevent accidental cluster deletion if enabled
    prevent_destroy = var.deletion_protection
  }

  timeouts {
    create = "120m"
    update = "120m"
    delete = "120m"
  }
}
