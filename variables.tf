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

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = false
  description = "Whether minor version upgrades are applied automatically"
}

variable "availability_zone" {
  type        = string
  default     = "us-gov-west-1a"
  description = "The availability zone of the DB instance"
}

variable "backup_retention_period" {
  type        = number
  default     = 35
  description = "The number of days to retain backups"
}

variable "backup_target" {
  type        = string
  default     = "region"
  description = "The target for backups (e.g., region)"
}

variable "backup_window" {
  type        = string
  default     = "10:12-10:42"
  description = "The daily time range during which automated backups are created"
}

variable "ca_cert_identifier" {
  type        = string
  default     = "rds-ca-rsa4096-g1"
  description = "The identifier of the CA certificate for the DB instance"
}

variable "character_set_name" {
  type        = string
  default     = null
  description = "The character set name for the DB instance"
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

variable "customer_owned_ip_enabled" {
  type        = bool
  default     = false
  description = "Whether customer-owned IP is enabled"
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

variable "dedicated_log_volume" {
  type        = bool
  default     = false
  description = "Whether to use a dedicated log volume"
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

variable "domain_auth_secret_arn" {
  type        = string
  default     = null
  description = "The ARN of the secret containing the domain credentials"
}

variable "domain_dns_ips" {
  type        = list(string)
  default     = []
  description = "The DNS IP addresses of the domain"
}

variable "domain_fqdn" {
  type        = string
  default     = null
  description = "The fully qualified domain name of the domain"
}

variable "domain_iam_role_name" {
  type        = string
  default     = null
  description = "The IAM role name for the domain"
}

variable "domain_ou" {
  type        = string
  default     = null
  description = "The organizational unit for the domain"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = ["audit", "error", "general", "slowquery"]
  description = "The list of log types to export to CloudWatch"
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

variable "license_model" {
  type        = string
  default     = "general-public-license"
  description = "The license model for the DB instance"
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

variable "max_allocated_storage" {
  type        = number
  default     = 0
  description = "The maximum allocated storage for the DB instance"
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

variable "multi_az" {
  type        = bool
  default     = false
  description = "Whether the DB instance is multi-AZ"
}

variable "nchar_character_set_name" {
  type        = string
  default     = null
  description = "The NCHAR character set name"
}

variable "network_type" {
  type        = string
  default     = "IPV4"
  description = "The network type (e.g., IPV4)"
}

variable "option_group_name" {
  type        = string
  default     = "default:aurora-mysql-8-0"
  description = "The option group name"
}

variable "parameter_group_name" {
  type        = string
  default     = "census-baseline-aurora-8"
  description = "The parameter group name"
}

variable "password" {
  type        = string
  default     = null
  description = "The password for the master user"
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
  default     = 0
  description = "The retention period for Performance Insights"
}

variable "port" {
  type        = number
  default     = 3306
  description = "The port for the DB instance"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Whether the DB instance is publicly accessible"
}

variable "replica_mode" {
  type        = string
  default     = null
  description = "The replica mode for the DB instance"
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

variable "storage_throughput" {
  type        = number
  default     = 0
  description = "The storage throughput for the DB instance"
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

variable "timezone" {
  type        = string
  default     = null
  description = "The timezone for the DB instance"
}

variable "upgrade_storage_config" {
  type        = string
  default     = null
  description = "The upgrade storage configuration"
}

variable "username" {
  type        = string
  default     = "dbadmin"
  description = "The username for the master user"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default     = ["sg-01980edbedc2a9201"]
  description = "The VPC security group IDs"
}