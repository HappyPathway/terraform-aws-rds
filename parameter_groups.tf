resource "aws_db_parameter_group" "cluster_instance" {
  name        = "${var.cluster_identifier}-instance-pg"
  family      = var.parameter_group_family
  description = "DB parameter group for ${var.cluster_identifier} cluster instances"

  tags = var.tags
}

resource "aws_rds_cluster_parameter_group" "cluster" {
  name        = "${var.cluster_identifier}-cluster-pg"
  family      = var.parameter_group_family
  description = "Cluster parameter group for ${var.cluster_identifier}"

  tags = var.tags
}