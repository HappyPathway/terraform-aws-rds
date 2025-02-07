resource "aws_rds_cluster_endpoint" "static" {
  for_each = var.create_cluster && var.create_cluster_endpoints ? var.cluster_endpoints : {}

  cluster_identifier          = aws_rds_cluster.cluster[0].id
  cluster_endpoint_identifier = each.key
  custom_endpoint_type        = each.value.type
  
  static_members = try(each.value.static_members, null)
  excluded_members = try(each.value.excluded_members, null)

  tags = var.tags
}