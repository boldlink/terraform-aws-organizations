module "complete" {
  source                     = "../../"
  name                       = local.name
  email                      = local.email
  close_on_deletion          = true
  iam_user_access_to_billing = "DENY"
  parent_id                  = local.parent_id
  role_name                  = local.role_name

  #OU
  ou_name      = local.ou_name
  ou_parent_id = local.parent_id
  tags         = local.tags
}
