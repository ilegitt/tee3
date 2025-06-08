############################################
# RDS
############################################
resource "aws_db_subnet_group" "default" {
  name       = "main-db-subnet-group"
  subnet_ids = aws_subnet.public[*].id
  tags       = { Name = "main-db-subnet-group" }
}

resource "aws_db_instance" "default" {
  identifier              = "mydb"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  name                    = "mydatabase"
  username                = "admin"
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  multi_az                = true
  storage_encrypted       = true
  publicly_accessible     = false
  skip_final_snapshot     = true

  depends_on = [aws_autoscaling_group.web_asg]
  tags       = { Name = "mydb" }
}
