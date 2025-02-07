resource "aws_rds_global_cluster" "global" {
  count = var.create_global_cluster ? 1 : 0

  global_cluster_identifier = var.global_cluster_identifier
  engine                   = var.engine
  engine_version           = var.engine_version
  database_name            = var.db_name
  storage_encrypted        = var.storage_encrypted
  deletion_protection      = var.deletion_protection
  force_destroy           = var.force_destroy

  lifecycle {
    # Ignore engine version changes during auto minor version upgrades
    ignore_changes = [engine_version]
    prevent_destroy = false
  }

  timeouts {
    create = "120m"
    update = "120m"
    delete = "120m"
  }
}