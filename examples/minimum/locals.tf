locals {
  name      = "Boldlink-Minimal-OU-Example"
  parent_id = data.aws_organizations_organization.org.roots[0].id
  tags = {
    name        = local.name
    environment = "examples"
  }
}
