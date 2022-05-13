# provider "aws"{
#    access_key = "my-access-key"
#    secret_key = "my-secret-key"
#    region = "us-east-1a"
# }
resource "aws_db_instance" "default" {
  identifier = "mydb"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t2.micro"
  db_name              = "mydb"
  username             = "mydb"
  password             = "Ravitejakula09"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}