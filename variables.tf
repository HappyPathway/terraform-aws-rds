variable "allocated_storage" {
  type        = number
  default     = 1
  description = "The amount of storage allocated for the DB instance"
}

variable "allow_major_version_upgrade" {
  type        = bool
  default     = null
  description = "Whether major version upgrades are allowed"
}

variable "apply_immediately" {
  type        = bool
  default     = null
  description = "Whether to apply changes immediately"
}

variable "availability_zone" {
  type        = string
  default     = "us-gov-west-1a"
  description = "The availability zone of the DB instance"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-gov-west-1a", "us-gov-west-1b", "us-gov-west-1c"]
  description = "A list of Availability Zones (AZs) where instances in the DB cluster can be created."
}

variable "backup_retention_period" {
  type        = number
  default     = 35
  description = "The number of days to retain backups"
}

variable "backup_window" {
  type        = string
  default     = null  # Set to null since preferred_backup_window is the preferred variable
  description = "DEPRECATED: Use preferred_backup_window instead. The daily time range during which automated backups are created"
}

variable "ca_cert_identifier" {
  type        = string
  default     = "rds-ca-rsa4096-g1"
  description = "The identifier of the CA certificate for the DB instance"
}

variable "cluster_identifier" {
  type        = string
  default     = "rds-csvd-morph-dev"
  description = "The identifier for the RDS cluster."
}

variable "cluster_members" {
  type        = list(string)
  default     = ["rds-csvd-morph-dev-1", "rds-csvd-morph-dev-2"]
  description = "A list of RDS instances that are part of the cluster."
}

variable "copy_tags_to_snapshot" {
  type        = bool
  default     = true
  description = "Whether to copy tags to snapshots"
}

variable "custom_iam_instance_profile" {
  type        = string
  default     = null
  description = "The custom IAM instance profile for the DB instance"
}

variable "db_cluster_parameter_group_name" {
  type        = string
  default     = "census-baseline-aurora-cl-8"
  description = "The name of the DB cluster parameter group to associate with this instance."
}

variable "db_name" {
  type        = string
  default     = null
  description = "The name of the database"
}

variable "db_subnet_group_name" {
  type        = string
  default     = "rdsng-vpc2"
  description = "The DB subnet group name"
}

variable "db_subnet_group_name_source" {
  type        = string
  description = "The name of the DB subnet group to use as a data source"
  default     = "rdsng-vpc2"
}

variable "delete_automated_backups" {
  type        = bool
  default     = true
  description = "Whether to delete automated backups"
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Whether deletion protection is enabled"
}

variable "domain" {
  type        = string
  default     = null
  description = "The Active Directory domain to join"
}

variable "domain_iam_role_name" {
  type        = string
  default     = null
  description = "The IAM role name for the domain"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = ["audit", "error", "general", "slowquery"]
  description = "The list of log types to export to CloudWatch"
}

variable "enable_http_endpoint" {
  description = "Enable HTTP endpoint for the RDS cluster"
  type        = bool
  default     = false
}

variable "engine" {
  type        = string
  default     = "aurora-mysql"
  description = "The database engine to use"
}

variable "engine_lifecycle_support" {
  type        = string
  default     = "open-source-rds-extended-support"
  description = "The lifecycle support for the engine"
}

variable "engine_mode" {
  type        = string
  default     = "provisioned"
  description = "The database engine mode."
}

variable "engine_version" {
  type        = string
  default     = "8.0.mysql_aurora.3.04.0"
  description = "The version of the database engine"
}

variable "final_snapshot_identifier" {
  type        = string
  default     = null
  description = "The identifier for the final snapshot"
}

variable "iam_database_authentication_enabled" {
  type        = bool
  default     = false
  description = "Whether IAM database authentication is enabled"
}

variable "identifier" {
  type        = string
  default     = "rds-csvd-morph-dev-1"
  description = "The identifier for the DB instance"
}

variable "identifier_prefix" {
  type        = string
  default     = null
  description = "The prefix for the DB instance identifier"
}

variable "instance_class" {
  type        = string
  default     = "db.r5.xlarge"
  description = "The instance class for the DB instance"
}

variable "iops" {
  type        = number
  default     = 0
  description = "The IOPS for the DB instance"
}

variable "kms_key_id" {
  type        = string
  default     = "arn:aws-us-gov:kms:us-gov-west-1:229685449397:key/190a2c75-8b8a-4e85-bd3d-374c49d86856"
  description = "The KMS key ID for encryption"
}

variable "maintenance_window" {
  type        = string
  default     = "wed:13:21-wed:13:51"
  description = "The weekly maintenance window"
}

variable "manage_master_user_password" {
  type        = bool
  default     = null
  description = "Whether to manage the master user password"
}

variable "master_user_secret_kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID for the master user secret"
}

variable "monitoring_interval" {
  type        = number
  default     = 0
  description = "The interval for monitoring"
}

variable "monitoring_role_arn" {
  type        = string
  default     = null
  description = "The ARN of the monitoring role"
}

variable "parameter_group_name" {
  type        = string
  default     = "census-baseline-aurora-8"
  description = "The parameter group name"
}

variable "parameter_group_name_source" {
  type        = string
  description = "The name of the DB parameter group to use as a data source"
  default     = "census-baseline-aurora-8"
}

variable "password" {
  type        = string
  default     = null  # Set to null since master_password is the preferred variable
  description = "DEPRECATED: Use master_password instead. The password for the master user"
  sensitive   = true
}

variable "performance_insights_enabled" {
  type        = bool
  default     = false
  description = "Whether Performance Insights are enabled"
}

variable "performance_insights_kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID for Performance Insights"
}

variable "performance_insights_retention_period" {
  type        = number
  default     = 7
  description = "The retention period for Performance Insights in days. Valid values are 7 or 731 (2 years)"
  validation {
    condition     = contains([0, 7, 731], var.performance_insights_retention_period)
    error_message = "Performance insights retention period must be either 7 or 731 days when performance insights is enabled, or 0 when disabled."
  }
}

variable "port" {
  type        = number
  default     = 3306
  description = "The port for the DB instance"
}

variable "promotion_tier" {
  type        = number
  default     = 0
  description = "The promotion tier for the DB instance"
}

variable "replicate_source_db" {
  type        = string
  default     = null
  description = "The source DB instance for replication"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
  description = "Whether to skip the final snapshot"
}

variable "snapshot_identifier" {
  type        = string
  default     = null
  description = "The identifier for the snapshot"
}

variable "storage_encrypted" {
  type        = bool
  default     = true
  description = "Whether storage is encrypted"
}

variable "storage_type" {
  type        = string
  default     = "aurora"
  description = "The storage type for the DB instance"
}

variable "tags" {
  type = map(string)
  default = {
    Comments                = "rds-csvd-morph-dev"
    CostAllocation          = "CSVD"
    Name                    = "rds-csvd-morph-dev-1"
    "Project Name"          = "CSVD_PaaS"
    "Project Role"          = "CSVD_PaaS_RDS"
    ProjectNumber           = "FS0000000000"
    "boc:created_by"        = "terraform"
    "boc:manage"            = "adsd-db-rds"
    "boc:tf_module_version" = "1.0"
  }
  description = "Optional tags for the DB instance"
}

variable "tags_all" {
  type = map(string)
  default = {
    Comments                = "rds-csvd-morph-dev"
    CostAllocation          = "CSVD"
    Name                    = "rds-csvd-morph-dev"
    "Project Name"          = "CSVD_PaaS"
    "Project Role"          = "CSVD_PaaS_RDS"
    ProjectNumber           = "FS0000000000"
    "boc:created_by"        = "terraform"
    "boc:manage"            = "adsd-db-rds"
    "boc:tf_module_version" = "1.0"
  }
  description = "Optional tags for the DB instance"
}

variable "username" {
  type        = string
  default     = null  # Set to null since master_username is the preferred variable
  description = "DEPRECATED: Use master_username instead. The username for the master user"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = ["sg-01980edbedc2a9201"]
  description = "The VPC security group IDs"
}

variable "backtrack_window" {
  type        = number
  default     = null
  description = "The target backtrack window in seconds"
}

variable "db_system_id" {
  type        = string
  default     = null
  description = "The identifier of the DB system"
}

variable "enable_global_write_forwarding" {
  type        = bool
  default     = false
  description = "Whether to enable global write forwarding"
}

variable "enable_local_write_forwarding" {
  type        = bool
  default     = false
  description = "Whether to enable local write forwarding"
}

variable "global_cluster_identifier" {
  type        = string
  default     = null
  description = "The global cluster identifier"
}

variable "iam_roles" {
  type = map(object({
    feature_name = string
    role_arn    = string
  }))
  default     = {}
  description = "Map of IAM role associations for the RDS cluster. Key is arbitrary identifier, feature_name is the RDS feature (e.g., s3Import, s3Export), and role_arn is the IAM role ARN"
}

variable "source_region" {
  type        = string
  default     = null
  description = "The source region for cross-region replication"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "When deleting a cluster, snapshot will also be deleted if true"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Controls if instance is publicly accessible"
}

variable "network_type" {
  type        = string
  default     = null
  description = "The network type of the cluster"
}

variable "dbi_resource_id" {
  type        = string
  default     = null
  description = "Region-unique, immutable identifier for the DB instance"
}

variable "engine_version_actual" {
  type        = string
  default     = null
  description = "Database engine version actually running on the instance"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "VPC ID where the RDS cluster will be created"
}

variable "parameter_group_family" {
  type        = string
  default     = "aurora-mysql8.0"
  description = "Family of the parameter group"
}

variable "create_db_subnet_group" {
  type        = bool
  default     = false
  description = "Whether to create a database subnet group"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs used by database subnet group"
}

variable "create_monitoring_role" {
  type        = bool
  default     = true
  description = "Whether to create an IAM role for RDS enhanced monitoring"
}

variable "enable_serverlessv2_scaling" {
  type        = bool
  default     = false
  description = "Whether to enable Serverless v2 scaling configuration"
}

variable "serverlessv2_scaling_configuration" {
  type = object({
    max_capacity = number
    min_capacity = number
  })
  default = null
  description = "Map containing serverless v2 scaling properties. Valid capacity values are in a range of 0.5 up to 256 in steps of 0.5"
}

variable "scaling_configuration" {
  type = object({
    auto_pause               = optional(bool, true)
    max_capacity            = optional(number, 256)
    min_capacity            = optional(number, 2)
    seconds_until_auto_pause = optional(number, 300)
    timeout_action          = optional(string, "RollbackCapacityChange")
  })
  default = null
  description = "Map containing serverless v1 scaling properties for serverless v1"
}

// New variables for conditional resource creation
variable "create_cluster" {
  type        = bool
  default     = true
  description = "Whether to create this RDS cluster"
}

variable "create_cluster_instance" {
  type        = bool
  default     = true
  description = "Whether to create cluster instances"
}

variable "number_of_instances" {
  type        = number
  default     = 1
  description = "Number of cluster instances to create"
}

# S3 Import Variables
variable "enable_s3_import" {
  type        = bool
  default     = false
  description = "Whether to enable S3 import functionality"
}

variable "s3_import_bucket_name" {
  type        = string
  default     = null
  description = "The bucket name where your backup is stored"
}

variable "s3_import_bucket_prefix" {
  type        = string
  default     = null
  description = "The prefix (path) inside the S3 bucket where your backup is stored"
}

variable "s3_import_ingestion_role" {
  type        = string
  default     = null
  description = "The ARN of the role to use for S3 data ingestion"
}

variable "s3_import_source_engine" {
  type        = string
  default     = null
  description = "Source engine for the backup"
}

variable "s3_import_source_engine_version" {
  type        = string
  default     = null
  description = "Version of the source engine used to make the backup"
}

# Restore to Point in Time Variables
variable "enable_restore_to_point_in_time" {
  type        = bool
  default     = false
  description = "Whether to enable restore to point in time"
}

variable "restore_source_cluster_identifier" {
  type        = string
  default     = null
  description = "The identifier of the source DB cluster from which to restore"
}

variable "restore_source_cluster_resource_id" {
  type        = string
  default     = null
  description = "The resource ID of the source DB cluster from which to restore"
}

variable "restore_type" {
  type        = string
  default     = "full-copy"
  description = "The type of restore to be performed. Valid options are 'full-copy' and 'copy-on-write'"
}

variable "restore_use_latest_restorable_time" {
  type        = bool
  default     = false
  description = "Whether to restore the DB cluster to the latest restorable backup time"
}

variable "restore_to_time" {
  type        = string
  default     = null
  description = "The date and time to restore the DB cluster to"
}

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "List of security group IDs that are allowed to access the cluster"
}

variable "create_cluster_endpoints" {
  type        = bool
  default     = false
  description = "Whether to create custom cluster endpoints"
}

variable "cluster_endpoints" {
  type = map(object({
    type             = string
    static_members   = optional(list(string))
    excluded_members = optional(list(string))
  }))
  default     = {}
  description = "Map of cluster endpoint configurations. The key is the endpoint identifier and value is a map of endpoint configuration. Type must be READER, WRITER, ANY or CUSTOM"
}

variable "enable_cluster_snapshot_copy" {
  type        = bool
  default     = false
  description = "Whether to enable snapshot copying to another region"
}

variable "source_snapshot_identifier" {
  type        = string
  default     = null
  description = "The identifier of the source snapshot to copy"
}

variable "snapshot_copy_kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID to use for snapshot encryption in the destination region"
}

variable "snapshot_copy_destination_region" {
  type        = string
  default     = null
  description = "The region to copy snapshots to"
}

variable "snapshot_copy_presigned_url" {
  type        = string
  default     = null
  description = "The presigned URL to use for snapshot copying"
}

variable "enable_activity_stream" {
  type        = bool
  default     = false
  description = "Whether to enable database activity stream"
}

variable "activity_stream_mode" {
  type        = string
  default     = "async"
  description = "Database activity stream mode. Can be sync or async"
}

variable "activity_stream_kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for encrypting database activity stream"
}

variable "activity_stream_engine_native_audit_fields_included" {
  type        = bool
  default     = false
  description = "Whether to include engine native audit fields in the activity stream"
}

variable "enable_automated_backups_replication" {
  type        = bool
  default     = false
  description = "Whether to enable automated backups replication to another region"
}

variable "automated_backups_replication_kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID to use for encrypted automated backups in the replica region"
}

variable "master_username" {
  type        = string
  default     = "dbadmin"
  description = "The username for the master user"
}

variable "master_password" {
  type        = string
  default     = null
  description = "The password for the master user"
  sensitive   = true
}

variable "preferred_backup_window" {
  type        = string
  default     = "10:12-10:42"
  description = "The daily time range during which automated backups are created"
}

variable "create_global_cluster" {
  type        = bool
  default     = false
  description = "Whether to create a global RDS cluster"
}