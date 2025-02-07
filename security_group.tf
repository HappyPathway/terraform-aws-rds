resource "aws_security_group" "rds" {
  name        = "${var.cluster_identifier}-rds-sg"
  description = "Security group for ${var.cluster_identifier} RDS cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.port
    to_port         = var.port
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
    self            = true
  }

  # Add default egress rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}