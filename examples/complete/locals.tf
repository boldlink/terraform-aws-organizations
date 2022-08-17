locals {
  name      = "complete-accounts-example"
  email     = "example@email.com"
  parent_id = data.aws_organizations_organization.org.roots[0].id
  role_name = "${local.name}-role"
  ou_name   = "Complete Example"
  tags = {
    name        = local.name
    environment = "examples"
  }
}
