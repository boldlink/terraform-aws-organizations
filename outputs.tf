output "arn" {
  value       = aws_organizations_account.main.*.arn
  description = "The ARN for this account."
}

output "govcloud_id" {
  value       = aws_organizations_account.main.*.govcloud_id
  description = "ID for a GovCloud account created with the account."
}

output "id" {
  value       = aws_organizations_account.main.*.id
  description = "The AWS account id"
}

output "tags_all" {
  value       = aws_organizations_account.main.*.tags_all
  description = "A map of tags assigned to the resource"
}

output "administrator_account_id" {
  value       = aws_organizations_delegated_administrator.main.*.id
  description = "The unique identifier (ID) of the delegated administrator."
}

output "administrator_arn" {
  value       = aws_organizations_delegated_administrator.main.*.arn
  description = "The Amazon Resource Name (ARN) of the delegated administrator's account."
}

output "administrator_delegation_enabled_date" {
  value       = aws_organizations_delegated_administrator.main.*.delegation_enabled_date
  description = "The date when the account was made a delegated administrator."
}

output "administrator_email" {
  value       = aws_organizations_delegated_administrator.main.*.email
  description = "The email address that is associated with the delegated administrator's AWS account."
}

output "administrator_joined_method" {
  value       = aws_organizations_delegated_administrator.main.*.joined_method
  description = "The method by which the delegated administrator's account joined the organization."
}

output "administrator_joined_timestamp" {
  value       = aws_organizations_delegated_administrator.main.*.joined_timestamp
  description = "The date when the delegated administrator's account became a part of the organization."
}

output "administrator_name" {
  value       = aws_organizations_delegated_administrator.main.*.name
  description = "The friendly name of the delegated administrator's account."
}

output "administrator_status" {
  value       = aws_organizations_delegated_administrator.main.*.status
  description = "The status of the delegated administrator's account in the organization."
}

output "accounts" {
  value       = aws_organizations_organization.main[*].accounts
  description = "List of organization accounts including the master account. For a list excluding the master account, see the `non_master_accounts` attribute."
}

output "account_arn" {
  value       = aws_organizations_organization.main[*].accounts[*].arn
  description = "ARN of the account"
}

output "account_email" {
  value       = aws_organizations_organization.main[*].accounts[*].email
  description = "Email of the account"
}

output "account_id" {
  value       = aws_organizations_organization.main[*].accounts[*].id
  description = "Identifier of the account"
}

output "account_name" {
  value       = aws_organizations_organization.main[*].accounts[*].name
  description = "Name of the account"
}

output "account_status" {
  value       = aws_organizations_organization.main[*].accounts[*].status
  description = "Current status of the account"
}

output "org_arn" {
  value       = aws_organizations_organization.main[*].arn
  description = "ARN of the organization"
}

output "org_id" {
  value       = aws_organizations_organization.main[*].id
  description = "Identifier of the organization"
}

output "master_account_arn" {
  value       = aws_organizations_organization.main[*].master_account_arn
  description = "ARN of the master account"
}

output "master_account_email" {
  value       = aws_organizations_organization.main[*].master_account_email
  description = "Email address of the master account"
}

output "master_account_id" {
  value       = aws_organizations_organization.main[*].master_account_id
  description = "Identifier of the master account"
}

output "non_master_accounts" {
  value       = aws_organizations_organization.main[*].non_master_accounts
  description = "List of organization accounts excluding the master account."
}

output "roots" {
  value       = aws_organizations_organization.main[*].roots
  description = "List of organization roots."
}

output "root_arn" {
  value       = aws_organizations_organization.main[*].roots[*].arn
  description = "ARN of the root"
}

output "root_id" {
  value       = aws_organizations_organization.main[*].roots[*].id
  description = "Identifier of the root"
}

output "root_name" {
  value       = aws_organizations_organization.main[*].roots[*].name
  description = "Name of the root"
}

output "root_policy_types" {
  value       = aws_organizations_organization.main[*].roots[*].policy_types
  description = "List of policy types enabled for this root."
}

output "root_policy_types_type" {
  value       = aws_organizations_organization.main[*].roots[*].policy_types[*].type
  description = "The type of the policy type"
}

output "root_policy_types_status" {
  value       = aws_organizations_organization.main[*].roots[*].policy_types[*].status
  description = "The status of the policy type as it relates to the associated root"
}

output "ou_accounts" {
  value       = aws_organizations_organizational_unit.main[*].accounts
  description = " List of child accounts for this Organizational Unit. Does not return account information for child Organizational Units."
}

output "ou_accounts_arn" {
  value       = aws_organizations_organizational_unit.main[*].accounts[*].arn
  description = "ARN of the account"
}

output "ou_accounts_email" {
  value       = aws_organizations_organizational_unit.main[*].accounts[*].email
  description = "Email of the account"
}

output "ou_accounts_id" {
  value       = aws_organizations_organizational_unit.main[*].accounts[*].id
  description = "Identifier of the account"
}

output "ou_accounts_name" {
  value       = aws_organizations_organizational_unit.main[*].accounts[*].name
  description = "Name of the account"
}

output "ou_arn" {
  value       = aws_organizations_organizational_unit.main[*].arn
  description = "ARN of the organizational unit"
}

output "ou_id" {
  value       = aws_organizations_organizational_unit.main[*].id
  description = "Identifier of the organization unit"
}

output "ou_tags_all" {
  value       = aws_organizations_organizational_unit.main[*].tags_all
  description = "A map of tags assigned to the resource"
}
