resource "aws_rds_cluster_role_association" "this" {
  for_each = var.create_cluster ? var.iam_roles : {}

  db_cluster_identifier = aws_rds_cluster.cluster[0].id
  feature_name         = each.value.feature_name
  role_arn            = each.value.role_arn
}