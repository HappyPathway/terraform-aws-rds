output "cluster_arn" {
  description = "The ARN of the RDS cluster"
  value       = try(aws_rds_cluster.cluster[0].arn, null)
}

output "cluster_id" {
  description = "The ID of the RDS cluster"
  value       = try(aws_rds_cluster.cluster[0].id, null)
}

output "cluster_endpoint" {
  description = "The cluster endpoint"
  value       = try(aws_rds_cluster.cluster[0].endpoint, null)
}

output "cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = try(aws_rds_cluster.cluster[0].reader_endpoint, null)
}

output "cluster_port" {
  description = "The cluster port"
  value       = try(aws_rds_cluster.cluster[0].port, null)
}

output "cluster_master_username" {
  description = "The master username for the RDS cluster"
  value       = try(aws_rds_cluster.cluster[0].master_username, null)
  sensitive   = true
}

output "cluster_master_user_secret" {
  description = "The master user secret details if manage_master_user_password is set to true"
  value       = try(aws_rds_cluster.cluster[0].master_user_secret, null)
  sensitive   = true
}

output "cluster_instances" {
  description = "The cluster instances"
  value       = aws_rds_cluster_instance.cluster_instance
}

output "cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = [for instance in aws_rds_cluster_instance.cluster_instance : instance.endpoint]
}

output "security_group_id" {
  description = "The ID of the security group created for the RDS cluster"
  value       = aws_security_group.rds.id
}

output "parameter_group_id" {
  description = "The ID of the DB parameter group created"
  value       = aws_db_parameter_group.cluster_instance.id
}

output "cluster_parameter_group_id" {
  description = "The ID of the DB cluster parameter group created"
  value       = aws_rds_cluster_parameter_group.cluster.id
}

output "monitoring_role_arn" {
  description = "The ARN of the IAM role created for RDS enhanced monitoring"
  value       = try(aws_iam_role.rds_enhanced_monitoring[0].arn, null)
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group created or used"
  value       = var.create_db_subnet_group ? aws_db_subnet_group.rds[0].name : var.db_subnet_group_name
}

output "cluster_endpoints" {
  description = "Map of cluster endpoints attributes"
  value       = try(aws_rds_cluster_endpoint.static, null)
}

output "cluster_endpoint_arns" {
  description = "Map of cluster endpoint ARNs"
  value       = { for k, v in try(aws_rds_cluster_endpoint.static, {}) : k => v.arn }
}

output "cluster_snapshot_copy_id" {
  description = "The ID of the snapshot copy"
  value       = try(aws_rds_cluster_snapshot_copy.snapshot_copy[0].id, null)
}

output "cluster_snapshot_copy_arn" {
  description = "The ARN of the snapshot copy"
  value       = try(aws_rds_cluster_snapshot_copy.snapshot_copy[0].db_cluster_snapshot_arn, null)
}

output "custom_endpoints" {
  description = "Map of custom endpoint identifiers and their attributes"
  value = {
    for k, v in try(aws_rds_cluster_endpoint.static, {}) : k => {
      arn      = v.arn
      endpoint = v.endpoint
      type     = v.custom_endpoint_type
      members  = try(v.static_members, v.excluded_members, null)
    }
  }
}

output "activity_stream_status" {
  description = "Status of the database activity stream"
  value       = try(aws_rds_cluster_activity_stream.this[0].kinesis_stream_name, null)
}

output "automated_backups_replication_status" {
  description = "Status of the automated backups replication"
  value       = try(aws_db_instance_automated_backups_replication.this[0].status, null)
}

output "role_associations" {
  description = "Map of IAM role associations and their status"
  value       = try(aws_rds_cluster_role_association.this, {})
}