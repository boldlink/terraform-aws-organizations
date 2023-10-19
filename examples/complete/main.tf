#Organization Unit
module "oganization_unit" {
  source       = "../../"
  ou_name      = local.ou_name
  ou_parent_id = local.parent_id
}

#Creating account into the OU above
module "complete" {
  source                          = "../../"
  name                            = local.name
  email                           = local.email
  close_on_deletion               = true
  iam_user_access_to_billing      = "DENY"
  parent_id                       = module.oganization_unit.ou_id[0]
  role_name                       = local.role_name #use this role when switching to the account
  make_delegated_administrator    = true
  administrator_service_principal = "config.amazonaws.com"
  tags                            = local.tags
}
