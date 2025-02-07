output "db_instance_id" {
  value       = aws_db_instance.default.id
  description = "The ID of the RDS instance"
}

output "db_instance_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = "The connection endpoint for the RDS instance"
}

output "db_instance_arn" {
  value       = aws_db_instance.default.arn
  description = "The ARN of the RDS instance"
}

output "db_instance_address" {
  value       = aws_db_instance.default.address
  description = "The address of the RDS instance"
}

output "db_instance_port" {
  value       = aws_db_instance.default.port
  description = "The port on which the DB instance is listening"
}

output "db_instance_status" {
  value       = aws_db_instance.default.status
  description = "The current status of the RDS instance"
}

output "db_instance_username" {
  value       = aws_db_instance.default.username
  description = "The master username for the RDS instance"
}

output "db_instance_allocated_storage" {
  value       = aws_db_instance.default.allocated_storage
  description = "The allocated storage for the RDS instance"
}

output "db_instance_backup_retention_period" {
  value       = aws_db_instance.default.backup_retention_period
  description = "The backup retention period for the RDS instance"
}

output "db_instance_availability_zone" {
  value       = aws_db_instance.default.availability_zone
  description = "The availability zone of the RDS instance"
}