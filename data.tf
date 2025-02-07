data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# data "aws_db_parameter_group" "parameter_group" {
#   name = var.parameter_group_name_source
# }

# data "aws_db_subnet_group" "subnet_group" {
#   name = var.db_subnet_group_name_source
# }