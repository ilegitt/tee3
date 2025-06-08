output "vpc_id" {
  value = aws_vpc.main.id
}

output "db_endpoint" {
  value = aws_db_instance.default.address
}

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
}

output "secrets" {
  value = {
    db_master_secret = aws_secretsmanager_secret.db_password.arn
    app_user_secret  = aws_secretsmanager_secret.app_user_password.arn
  }
}
