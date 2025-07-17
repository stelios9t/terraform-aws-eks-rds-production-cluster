resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "postgres-subnet-group"
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
  vpc_security_group_ids  = [] 
  publicly_accessible     = false
  username                = var.db_username
  password                = var.db_password
  backup_retention_period = 7
  skip_final_snapshot     = false
  deletion_protection     = false

  db_name                 = var.db_name

}
