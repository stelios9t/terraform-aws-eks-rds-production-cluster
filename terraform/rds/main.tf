resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "postgres-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL traffic from within VPC"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [var.eks_node_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "portfolio-postgres"
  engine                  = "postgres"
  engine_version          = "15.3"
  instance_class          = "db.t3.micro"  
  allocated_storage       = 20
  storage_type            = "gp3"
  multi_az                = true  # failover
  db_subnet_group_name    = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = false
  username                = var.db_username
  password                = var.db_password
  backup_retention_period = 7
  skip_final_snapshot     = false
  deletion_protection     = false

  db_name                 = var.db_name

}
