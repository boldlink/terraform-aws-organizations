[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-organizations/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-organizations.svg)](https://github.com/boldlink/terraform-aws-organizations/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-organizations/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-organizations/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform AWS Organizations Module

## Description

This Module creates an organization, member account(s), ability to make the member account a delegated administrator and organizational unit

## Reasons to use this module over standard resources
- **Streamlined Deployment:** This module simplifies the creation of AWS Organizations, accounts, and Organizational Units through a single, unified deployment.

- **Centralized Management:** Effortlessly manage all your AWS Organization resources from one central location, ensuring consistency and ease of administration.

Examples available [`here`](./examples)

## Usage
**NOTE**:
- These examples use the latest version of this module
- An organization cannot be created if one already exists.

```hcl
module "minimum" {
  #OU Only
  source       = "boldlink/organizations/aws"
  version      = "<provide_latest_version_here>"
  ou_name      = local.name
  ou_parent_id = local.parent_id
  tags         = local.tags
}
```
## Documentation

[AWS Organizations Documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) | resource |
| [aws_organizations_delegated_administrator.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_delegated_administrator) | resource |
| [aws_organizations_organization.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |
| [aws_organizations_organizational_unit.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_service_principal"></a> [administrator\_service\_principal](#input\_administrator\_service\_principal) | The service principal of the AWS service for which you want to make the member account a delegated administrator. | `string` | `"cloudtrail.amazonaws.com"` | no |
| <a name="input_aws_service_access_principals"></a> [aws\_service\_access\_principals](#input\_aws\_service\_access\_principals) | List of AWS service principal names for which you want to enable integration with your organization. This is typically in the form of a URL, such as service-abbreviation.amazonaws.com. Organization must have feature\_set set to ALL | `list(string)` | <pre>[<br>  "access-analyzer.amazonaws.com",<br>  "aws-artifact-account-sync.amazonaws.com",<br>  "backup.amazonaws.com",<br>  "cloudtrail.amazonaws.com",<br>  "config.amazonaws.com",<br>  "guardduty.amazonaws.com",<br>  "sqs.amazonaws.com"<br>]</pre> | no |
| <a name="input_close_on_deletion"></a> [close\_on\_deletion](#input\_close\_on\_deletion) | If true, a deletion event will close the account. Otherwise, it will only remove from the organization. This is not supported for GovCloud accounts. | `bool` | `false` | no |
| <a name="input_create_govcloud"></a> [create\_govcloud](#input\_create\_govcloud) | Whether to also create a GovCloud account. The GovCloud account is tied to the main (commercial) account this resource creates. If true, the GovCloud account ID is available in the govcloud\_id attribute. The only way to manage the GovCloud account with Terraform is to subsequently import the account using this resource. | `bool` | `false` | no |
| <a name="input_create_organization"></a> [create\_organization](#input\_create\_organization) | Specify whether to create an organization | `bool` | `false` | no |
| <a name="input_email"></a> [email](#input\_email) | Email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account. | `string` | `null` | no |
| <a name="input_enabled_policy_types"></a> [enabled\_policy\_types](#input\_enabled\_policy\_types) | List of Organizations policy types to enable in the Organization Root. Organization must have feature\_set set to `ALL`. For additional information about valid policy types (e.g., `AISERVICES_OPT_OUT_POLICY`, `BACKUP_POLICY`, `SERVICE_CONTROL_POLICY`, and `TAG_POLICY`) | `list(string)` | <pre>[<br>  "BACKUP_POLICY",<br>  "SERVICE_CONTROL_POLICY",<br>  "TAG_POLICY"<br>]</pre> | no |
| <a name="input_feature_set"></a> [feature\_set](#input\_feature\_set) | Specify `ALL` (default) or `CONSOLIDATED_BILLING`. | `string` | `"ALL"` | no |
| <a name="input_iam_user_access_to_billing"></a> [iam\_user\_access\_to\_billing](#input\_iam\_user\_access\_to\_billing) | If set to ALLOW, the new account enables IAM users and roles to access account billing information if they have the required permissions. If set to DENY, then only the root user (and no roles) of the new account can access account billing information. If this is unset, the AWS API will default this to ALLOW. If the resource is created and this option is changed, it will try to recreate the account. Valid values `ALLOW` and `DENY` | `string` | `"ALLOW"` | no |
| <a name="input_make_delegated_administrator"></a> [make\_delegated\_administrator](#input\_make\_delegated\_administrator) | Specify whether to create delegated\_administrator | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Friendly name for the member account. | `string` | `null` | no |
| <a name="input_ou_name"></a> [ou\_name](#input\_ou\_name) | The name for the organizational unit | `string` | `null` | no |
| <a name="input_ou_parent_id"></a> [ou\_parent\_id](#input\_ou\_parent\_id) | ID of the parent organizational unit, which may be the root | `string` | `null` | no |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | Parent Organizational Unit ID or Root ID for the account. Defaults to the Organization default Root ID. A configuration must be present for this argument to perform drift detection. | `string` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the root account, allowing users in the root account to assume the role, as permitted by the root account administrator. The role has administrator permissions in the new member account. The Organizations API provides no method for reading this information after account creation, so Terraform cannot perform drift detection on its value and will always show a difference for a configured value after import unless `ignore_changes` is used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_arn"></a> [account\_arn](#output\_account\_arn) | ARN of the account |
| <a name="output_account_email"></a> [account\_email](#output\_account\_email) | Email of the account |
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Identifier of the account |
| <a name="output_account_name"></a> [account\_name](#output\_account\_name) | Name of the account |
| <a name="output_account_status"></a> [account\_status](#output\_account\_status) | Current status of the account |
| <a name="output_accounts"></a> [accounts](#output\_accounts) | List of organization accounts including the master account. For a list excluding the master account, see the `non_master_accounts` attribute. |
| <a name="output_administrator_account_id"></a> [administrator\_account\_id](#output\_administrator\_account\_id) | The unique identifier (ID) of the delegated administrator. |
| <a name="output_administrator_arn"></a> [administrator\_arn](#output\_administrator\_arn) | The Amazon Resource Name (ARN) of the delegated administrator's account. |
| <a name="output_administrator_delegation_enabled_date"></a> [administrator\_delegation\_enabled\_date](#output\_administrator\_delegation\_enabled\_date) | The date when the account was made a delegated administrator. |
| <a name="output_administrator_email"></a> [administrator\_email](#output\_administrator\_email) | The email address that is associated with the delegated administrator's AWS account. |
| <a name="output_administrator_joined_method"></a> [administrator\_joined\_method](#output\_administrator\_joined\_method) | The method by which the delegated administrator's account joined the organization. |
| <a name="output_administrator_joined_timestamp"></a> [administrator\_joined\_timestamp](#output\_administrator\_joined\_timestamp) | The date when the delegated administrator's account became a part of the organization. |
| <a name="output_administrator_name"></a> [administrator\_name](#output\_administrator\_name) | The friendly name of the delegated administrator's account. |
| <a name="output_administrator_status"></a> [administrator\_status](#output\_administrator\_status) | The status of the delegated administrator's account in the organization. |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN for this account. |
| <a name="output_govcloud_id"></a> [govcloud\_id](#output\_govcloud\_id) | ID for a GovCloud account created with the account. |
| <a name="output_id"></a> [id](#output\_id) | The AWS account id |
| <a name="output_master_account_arn"></a> [master\_account\_arn](#output\_master\_account\_arn) | ARN of the master account |
| <a name="output_master_account_email"></a> [master\_account\_email](#output\_master\_account\_email) | Email address of the master account |
| <a name="output_master_account_id"></a> [master\_account\_id](#output\_master\_account\_id) | Identifier of the master account |
| <a name="output_non_master_accounts"></a> [non\_master\_accounts](#output\_non\_master\_accounts) | List of organization accounts excluding the master account. |
| <a name="output_org_arn"></a> [org\_arn](#output\_org\_arn) | ARN of the organization |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Identifier of the organization |
| <a name="output_ou_accounts"></a> [ou\_accounts](#output\_ou\_accounts) | List of child accounts for this Organizational Unit. Does not return account information for child Organizational Units. |
| <a name="output_ou_accounts_arn"></a> [ou\_accounts\_arn](#output\_ou\_accounts\_arn) | ARN of the account |
| <a name="output_ou_accounts_email"></a> [ou\_accounts\_email](#output\_ou\_accounts\_email) | Email of the account |
| <a name="output_ou_accounts_id"></a> [ou\_accounts\_id](#output\_ou\_accounts\_id) | Identifier of the account |
| <a name="output_ou_accounts_name"></a> [ou\_accounts\_name](#output\_ou\_accounts\_name) | Name of the account |
| <a name="output_ou_arn"></a> [ou\_arn](#output\_ou\_arn) | ARN of the organizational unit |
| <a name="output_ou_id"></a> [ou\_id](#output\_ou\_id) | Identifier of the organization unit |
| <a name="output_ou_tags_all"></a> [ou\_tags\_all](#output\_ou\_tags\_all) | A map of tags assigned to the resource |
| <a name="output_root_arn"></a> [root\_arn](#output\_root\_arn) | ARN of the root |
| <a name="output_root_id"></a> [root\_id](#output\_root\_id) | Identifier of the root |
| <a name="output_root_name"></a> [root\_name](#output\_root\_name) | Name of the root |
| <a name="output_root_policy_types"></a> [root\_policy\_types](#output\_root\_policy\_types) | List of policy types enabled for this root. |
| <a name="output_root_policy_types_status"></a> [root\_policy\_types\_status](#output\_root\_policy\_types\_status) | The status of the policy type as it relates to the associated root |
| <a name="output_root_policy_types_type"></a> [root\_policy\_types\_type](#output\_root\_policy\_types\_type) | The type of the policy type |
| <a name="output_roots"></a> [roots](#output\_roots) | List of organization roots. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests stacks including any supporting resources:
```console
make tests
```
* Clean all tests *except* existing supporting resources:
```console
make clean
```
* Clean supporting resources - this is done separately so you can test your module build/modify/destroy independently.
```console
make cleansupporting
```
* !!!DANGER!!! Clean the state files from examples and test/supportingResources - use with CAUTION!!!
```console
make cleanstatefiles
```

#### BOLDLink-SIG 2023
