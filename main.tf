locals {
  create_account = var.name != null && var.email != null ? true : false
}

resource "aws_organizations_organization" "main" {
  count                         = var.create_organization ? 1 : 0
  aws_service_access_principals = var.aws_service_access_principals
  feature_set                   = var.feature_set
  enabled_policy_types          = var.enabled_policy_types
}

resource "aws_organizations_account" "main" {
  count                      = local.create_account ? 1 : 0
  name                       = var.name
  email                      = var.email
  close_on_deletion          = var.close_on_deletion
  create_govcloud            = var.create_govcloud
  iam_user_access_to_billing = var.iam_user_access_to_billing
  parent_id                  = var.parent_id
  role_name                  = var.role_name
  tags                       = var.tags

  lifecycle {
    ignore_changes = [role_name]
  }
}

resource "aws_organizations_delegated_administrator" "main" {
  count             = var.make_delegated_administrator ? 1 : 0
  account_id        = aws_organizations_account.main[0].id
  service_principal = var.administrator_service_principal
}

resource "aws_organizations_organizational_unit" "main" {
  count     = var.ou_name != null ? 1 : 0
  name      = var.ou_name
  parent_id = var.ou_parent_id
  tags      = var.tags
}
