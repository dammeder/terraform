resource "aws_sqs_queue" "main" {
  name = replace( local.name , "rtype", "sqs" )
  tags = merge(

    local.common_tags, 
    { Name = replace(local.name, "rtype", "sqs") }
  )
}

resource "aws_db_instance" "main" {
  identifier = replace ( local.name, "rtype", "rds" )
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.password.result
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = var.env == "dev" ? true : false
  final_snapshot_identifier = var.env == "dev" ? null : "${replace(local.name, "rtype", "final-snapshot")}-${formatdate("YYYYMMDDHHmmss", timestamp())}"
}


resource "random_password" "password" {
  length = 16 
  special = true 
  override_special = "!#$%&*()-_=+[]{}<>:?"

}


#   tags = merge( 
#     var.tags, 
#     {"Name" = "aws-session-instance-${count.index}"},
#     {"count" = count.index}
#   )