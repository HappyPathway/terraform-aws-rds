provider "aws" {
  alias  = "primary"
  region = "us-east-2"
}

provider "aws" {
  alias  = "secondary"
  region = "us-east-1"
}

module "aurora_global" {
  source = "../../"
  providers = {
    aws = aws.primary
  }

  create_global_cluster = true
  create_cluster       = true
  
  global_cluster_identifier = "example-global"
  cluster_identifier       = "aurora-primary"
  engine                   = "aurora-postgresql"
  engine_version           = "14.6"
  
  db_name          = "myapp"
  master_username         = "admin"
  master_password         = "change_me_123"
  
  instance_class         = "db.r6g.large"
  number_of_instances    = 2
  
  vpc_security_group_ids = [aws_security_group.example.id]
  db_subnet_group_name   = aws_db_subnet_group.example.name

  skip_final_snapshot    = true
}

# Secondary cluster in different region
module "aurora_secondary" {
  source = "../../"
  providers = {
    aws = aws.secondary
  }

  create_cluster = true
  
  cluster_identifier        = "aurora-secondary"
  global_cluster_identifier = module.aurora_global.global_cluster_id
  engine                    = "aurora-postgresql"
  engine_version           = "14.6"
  
  instance_class          = "db.r6g.large"
  number_of_instances     = 2
  
  vpc_security_group_ids  = [aws_security_group.example_secondary.id]
  db_subnet_group_name    = aws_db_subnet_group.example_secondary.name

  skip_final_snapshot     = true

  depends_on = [module.aurora_global]
}