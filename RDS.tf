
# RDS For   Eng project

resource "aws_db_instance" "Eng_Db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "focused"
  password             = "Greatness"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.Eng_DB_Group.name
  
  
}

# RDS subnet Group

resource "aws_db_subnet_group" "Eng_DB_Group" {
  name       = "eng_db_group"
  subnet_ids = [aws_subnet.Eng_Priv_Subnet1.id, aws_subnet.Eng_Priv_Subnet2.id]

  tags = {
    Name = "Eng_DB_Group"
  }
}


# sec Group for Database instance

resource "aws_security_group" "db-sec-group" {
  name        = "DB_sec_group"
  description = "Allow mysql inbound traffic"
  vpc_id      = aws_vpc.Engineer_vpc.id
}

resource "aws_security_group_rule" "Eng_Rds_Sec_group" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db-sec-group.id
}

  resource "aws_security_group_rule" "my_outbound_sg" {
    type             = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    security_group_id = aws_security_group.db-sec-group.id
   
  }
