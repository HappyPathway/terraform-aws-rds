resource "aws_db_instance_automated_backups_replication" "this" {
  count = var.create_cluster && var.enable_automated_backups_replication ? 1 : 0

  source_db_instance_arn = aws_rds_cluster.cluster[0].arn
  retention_period       = var.backup_retention_period
  kms_key_id            = var.automated_backups_replication_kms_key_id
}