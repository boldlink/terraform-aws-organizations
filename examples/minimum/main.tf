module "minimal" {
  #OU Only
  source       = "../../"
  ou_name      = local.name
  ou_parent_id = local.parent_id
  tags         = local.tags
}
