############################################
# MYSQL PROVIDER + USER
############################################
provider "mysql" {
  endpoint = aws_db_instance.default.address
  username = aws_db_instance.default.username
  password = var.db_password
}

resource "mysql_user" "app_user" {
  user               = "appuser"
  host               = "%"
  plaintext_password = var.app_user_password
  depends_on         = [aws_db_instance.default]
}

resource "mysql_grant" "app_user_grant" {
  user       = mysql_user.app_user.user
  host       = mysql_user.app_user.host
  database   = aws_db_instance.default.name
  privileges = ["ALL"]
}
