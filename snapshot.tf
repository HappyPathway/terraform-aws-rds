resource "aws_rds_cluster_snapshot_copy" "snapshot_copy" {
  count = var.create_cluster && var.enable_cluster_snapshot_copy ? 1 : 0

  source_db_cluster_snapshot_identifier = var.source_snapshot_identifier
  target_db_cluster_snapshot_identifier = "${var.cluster_identifier}-copy"
  kms_key_id                           = var.snapshot_copy_kms_key_id
  destination_region                    = var.snapshot_copy_destination_region
  copy_tags                            = var.copy_tags_to_snapshot
  presigned_url                        = var.snapshot_copy_presigned_url

  tags = var.tags
}