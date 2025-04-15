resource "aws_cognito_user_pool" "user_pool" {
  name = "users_pool_tc"

  alias_attributes = ["email"]

  admin_create_user_config {
    allow_admin_create_user_only = true

  }

  password_policy {
    minimum_length                   = 8
    require_lowercase                = false
    require_numbers                  = false
    require_symbols                  = false
    require_uppercase                = false
    temporary_password_validity_days = 7
  }

  schema {
    name                = "email"
    attribute_data_type = "String"
    mutable             = true
    required            = true
  }

}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name            = "user_pool_tc_client"
  user_pool_id    = aws_cognito_user_pool.user_pool.id
  generate_secret = false

  explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_ADMIN_USER_PASSWORD_AUTH"]
  read_attributes     = ["email"]
  write_attributes    = ["email"]
}

resource "aws_cognito_user" "example" {
  user_pool_id = aws_cognito_user_pool.user_pool.id
  username     = "abc"
  attributes = {
    email          = "icarolinebrasil@gmail.com"
    email_verified = "true"
    name           = "caroline"
  }
  lifecycle {
    ignore_changes = [attributes["email_verified"]]
  }
  password                 = "12345678"
  force_alias_creation     = false
  message_action           = "SUPPRESS"
  desired_delivery_mediums = ["EMAIL"]
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain       = "users-pool-tc-domain"
  user_pool_id = aws_cognito_user_pool.user_pool.id

}

output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}
