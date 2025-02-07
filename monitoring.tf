resource "aws_db_subnet_group" "rds" {
  count       = var.create_db_subnet_group ? 1 : 0
  name        = var.db_subnet_group_name
  description = "Subnet group for ${var.cluster_identifier} RDS cluster"
  subnet_ids  = var.subnet_ids

  tags = var.tags
}

resource "aws_iam_role" "rds_enhanced_monitoring" {
  count = var.create_monitoring_role && var.monitoring_interval > 0 ? 1 : 0
  name  = "${var.cluster_identifier}-monitoring-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  count      = var.create_monitoring_role && var.monitoring_interval > 0 ? 1 : 0
  role       = aws_iam_role.rds_enhanced_monitoring[0].name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_rds_cluster_activity_stream" "this" {
  count = var.create_cluster && var.enable_activity_stream ? 1 : 0

  resource_arn = aws_rds_cluster.cluster[0].arn
  mode         = var.activity_stream_mode
  kms_key_id   = var.activity_stream_kms_key_id

  engine_native_audit_fields_included = var.activity_stream_engine_native_audit_fields_included
}